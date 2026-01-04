#!/usr/bin/env bash
set -euo pipefail

# =========================
# Safe Logo Fixer + Auditor
# =========================
# What it does:
# 1) Creates a new branch (safe)
# 2) Audits repo: detects framework, finds header/nav files, finds logo files
# 3) Lets you select the correct header file + logo file
# 4) Ensures logo is in a "published" location (Hugo static/ or generic images/)
# 5) Patches the navbar brand to include <img class="site-logo"...>
# 6) Adds CSS for .site-logo into an appropriate CSS/SCSS file
# 7) Shows git diff and optionally commits

# -------- helpers --------
die(){ echo "ERROR: $*" >&2; exit 1; }
have(){ command -v "$1" >/dev/null 2>&1; }

# -------- prerequisites --------
have git || die "git not found. Install Git for Windows and run in Git Bash."
ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || die "Not inside a git repo."
cd "$ROOT"

REPORT="logo_audit_report.txt"
: > "$REPORT"

echo "Repo: $ROOT" | tee -a "$REPORT"
echo "Date: $(date)" | tee -a "$REPORT"
echo "----------------------------------------" | tee -a "$REPORT"

# -------- detect framework --------
FRAMEWORK="unknown"
if [[ -f "config.toml" || -f "config.yaml" || -f "config.yml" || -f "config.json" || -d "layouts" || -d "themes" ]]; then
  FRAMEWORK="hugo"
fi
if [[ -f "_config.yml" || -d "_includes" ]]; then
  FRAMEWORK="jekyll"
fi
if [[ -f "docusaurus.config.js" || -d "src/theme" ]]; then
  FRAMEWORK="docusaurus"
fi

echo "Detected framework: $FRAMEWORK" | tee -a "$REPORT"

# -------- determine base URL / subpath (important!) --------
# Many logo failures are path-related if the site is served at /blog/ not /
BASE_HINT=""
if [[ "$FRAMEWORK" == "hugo" ]]; then
  # Try to extract baseURL from config files
  for f in config.toml config.yaml config.yml config.json; do
    [[ -f "$f" ]] || continue
    # TOML/YAML: baseURL = "..." or baseURL: "..."
    # We'll do best-effort parsing (not perfect, but helpful)
    b="$(grep -E '^\s*baseURL\s*[:=]\s*' "$f" 2>/dev/null | head -n1 | sed -E 's/.*baseURL\s*[:=]\s*//; s/[\"'\'']//g' || true)"
    if [[ -n "${b:-}" ]]; then BASE_HINT="$b"; break; fi
  done
fi
if [[ "$FRAMEWORK" == "jekyll" && -f "_config.yml" ]]; then
  b="$(grep -E '^\s*baseurl:\s*' "_config.yml" 2>/dev/null | head -n1 | sed -E 's/.*baseurl:\s*//; s/[\"'\'']//g' || true)"
  if [[ -n "${b:-}" ]]; then BASE_HINT="$b"; fi
fi

echo "Base URL hint: ${BASE_HINT:-"(not found)"}" | tee -a "$REPORT"

# -------- create safe branch --------
BR="logo-fix-$(date +%Y%m%d-%H%M%S)"
git checkout -b "$BR" >/dev/null
echo "Created branch: $BR" | tee -a "$REPORT"
echo "----------------------------------------" | tee -a "$REPORT"

# -------- find existing logo-ish files --------
echo "Searching for logo files..." | tee -a "$REPORT"

# exclude heavy dirs
EXCLUDES=( "./.git" "./node_modules" "./public" "./resources" "./dist" "./build" "./.hugo_build.lock" )

# find logo files
LOGO_CANDIDATES_FILE=".logo_candidates.tmp"
: > "$LOGO_CANDIDATES_FILE"

# common logo names/extensions
find . -type f \( -iname "*logo*.png" -o -iname "*logo*.svg" -o -iname "*logo*.jpg" -o -iname "*logo*.jpeg" -o -iname "favicon*.png" -o -iname "*brand*.png" -o -iname "*mark*.png" \) \
  2>/dev/null | while read -r p; do
    skip="0"
    for ex in "${EXCLUDES[@]}"; do
      [[ "$p" == $ex* ]] && skip="1" && break
    done
    [[ "$skip" == "1" ]] && continue
    echo "$p" >> "$LOGO_CANDIDATES_FILE"
  done

if [[ ! -s "$LOGO_CANDIDATES_FILE" ]]; then
  echo "No obvious logo files found (logo*.png/svg). You can still pick any image manually later." | tee -a "$REPORT"
else
  echo "Found these logo candidates:" | tee -a "$REPORT"
  nl -ba "$LOGO_CANDIDATES_FILE" | tee -a "$REPORT"
fi

echo "----------------------------------------" | tee -a "$REPORT"

# -------- find header / navbar source files --------
echo "Searching for header/nav files..." | tee -a "$REPORT"

HEADER_CANDIDATES_FILE=".header_candidates.tmp"
: > "$HEADER_CANDIDATES_FILE"

# Search terms that usually locate the brand area
PATTERNS=(
  "navbar-brand"
  "site-title"
  "Little Bellies"
  "Big Answers"
  "logo"
  "brand"
  "masthead"
  "topbar"
)

# Candidate directories by framework
SEARCH_DIRS=( "." )
if [[ "$FRAMEWORK" == "hugo" ]]; then
  SEARCH_DIRS=( "layouts" "themes" "." )
elif [[ "$FRAMEWORK" == "jekyll" ]]; then
  SEARCH_DIRS=( "_includes" "_layouts" "." )
fi

for d in "${SEARCH_DIRS[@]}"; do
  [[ -d "$d" ]] || continue
  for pat in "${PATTERNS[@]}"; do
    # grep -RIn: recursive, show line numbers, ignore binary, case-insensitive
    grep -RIn --exclude-dir=".git" --exclude-dir="node_modules" --exclude-dir="public" --exclude-dir="resources" --exclude-dir="dist" --exclude-dir="build" \
      -E "$pat" "$d" 2>/dev/null \
      | cut -d: -f1 \
      | sort -u >> "$HEADER_CANDIDATES_FILE" || true
  done
done

sort -u "$HEADER_CANDIDATES_FILE" -o "$HEADER_CANDIDATES_FILE"

if [[ ! -s "$HEADER_CANDIDATES_FILE" ]]; then
  die "Could not find any header/nav candidates. Paste your repo tree or tell me the framework, and I’ll give you a targeted script."
fi

# Filter down to likely template/html files only (avoid huge noise)
FILTERED_HEADERS_FILE=".header_candidates.filtered.tmp"
: > "$FILTERED_HEADERS_FILE"
while read -r f; do
  case "$f" in
    *.html|*.htm|*.md|*.markdown|*.gohtml|*.tmpl|*.liquid|*.njk|*.hbs|*.jsx|*.tsx|*.vue)
      echo "$f" >> "$FILTERED_HEADERS_FILE"
      ;;
    *)
      # allow also partials without extension in Hugo sometimes
      if [[ "$FRAMEWORK" == "hugo" && "$f" == *"layouts/partials"* ]]; then
        echo "$f" >> "$FILTERED_HEADERS_FILE"
      fi
      ;;
  esac
done < "$HEADER_CANDIDATES_FILE"

if [[ -s "$FILTERED_HEADERS_FILE" ]]; then
  mv "$FILTERED_HEADERS_FILE" "$HEADER_CANDIDATES_FILE"
fi

echo "Header/nav candidates (pick the one that renders the top blue bar):" | tee -a "$REPORT"
nl -ba "$HEADER_CANDIDATES_FILE" | tee -a "$REPORT"
echo "----------------------------------------" | tee -a "$REPORT"

# -------- choose header file --------
echo
read -r -p "Enter the NUMBER of the correct header/nav file from the list above: " HNUM
HEADER_FILE="$(sed -n "${HNUM}p" "$HEADER_CANDIDATES_FILE" || true)"
[[ -n "${HEADER_FILE:-}" && -f "$HEADER_FILE" ]] || die "Invalid selection."

echo "Chosen header file: $HEADER_FILE" | tee -a "$REPORT"

# -------- choose logo file --------
LOGO_SRC=""
if [[ -s "$LOGO_CANDIDATES_FILE" ]]; then
  echo
  read -r -p "Enter the NUMBER of the logo file to use (or press Enter to type a path): " LNUM || true
  if [[ -n "${LNUM:-}" ]]; then
    LOGO_SRC="$(sed -n "${LNUM}p" "$LOGO_CANDIDATES_FILE" || true)"
  fi
fi

if [[ -z "${LOGO_SRC:-}" ]]; then
  echo
  read -r -p "Type the PATH to your logo image (e.g., ./images/logo.png): " LOGO_SRC
fi

[[ -f "$LOGO_SRC" ]] || die "Logo file not found: $LOGO_SRC"

echo "Chosen logo source: $LOGO_SRC" | tee -a "$REPORT"

# -------- ensure logo is in published location --------
# Key: For Hugo, put in /static/images/ so it definitely publishes.
# For plain HTML/Jekyll, /images/ is usually fine.
PUBLISHED_LOGO_PATH=""
if [[ "$FRAMEWORK" == "hugo" ]]; then
  mkdir -p "static/images"
  ext="${LOGO_SRC##*.}"
  PUBLISHED_LOGO_PATH="static/images/logo.${ext}"
  cp -f "$LOGO_SRC" "$PUBLISHED_LOGO_PATH"
  echo "Copied logo to: $PUBLISHED_LOGO_PATH (Hugo publishes /images/... from static/)" | tee -a "$REPORT"
elif [[ "$FRAMEWORK" == "jekyll" ]]; then
  mkdir -p "images"
  ext="${LOGO_SRC##*.}"
  PUBLISHED_LOGO_PATH="images/logo.${ext}"
  cp -f "$LOGO_SRC" "$PUBLISHED_LOGO_PATH"
  echo "Copied logo to: $PUBLISHED_LOGO_PATH" | tee -a "$REPORT"
else
  mkdir -p "images"
  ext="${LOGO_SRC##*.}"
  PUBLISHED_LOGO_PATH="images/logo.${ext}"
  cp -f "$LOGO_SRC" "$PUBLISHED_LOGO_PATH"
  echo "Copied logo to: $PUBLISHED_LOGO_PATH" | tee -a "$REPORT"
fi

# -------- compute the correct logo URL for templates --------
# THIS is where many attempts fail: your site is served at /blog/ not /.
LOGO_URL=""

if [[ "$FRAMEWORK" == "hugo" ]]; then
  # Use Hugo-safe URL builder
  # This will respect baseURL + any subpath like /blog/
  LOGO_URL='{{ "images/'"$(basename "$PUBLISHED_LOGO_PATH")"'" | relURL }}'
elif [[ "$FRAMEWORK" == "jekyll" ]]; then
  LOGO_URL='{{ "/images/'"$(basename "$PUBLISHED_LOGO_PATH")"'" | relative_url }}'
else
  # Generic safest guess for subpath deployments:
  # - Use an absolute that includes /blog/ if we detected it
  if [[ "${BASE_HINT:-}" == */blog* || "${BASE_HINT:-}" == "/blog" || "${BASE_HINT:-}" == "/blog/" ]]; then
    LOGO_URL="/blog/images/$(basename "$PUBLISHED_LOGO_PATH")"
  else
    # If hosted at domain root
    LOGO_URL="/images/$(basename "$PUBLISHED_LOGO_PATH")"
  fi
fi

echo "Using logo URL: $LOGO_URL" | tee -a "$REPORT"

# -------- patch header file --------
echo "Patching header file to insert logo..." | tee -a "$REPORT"

# Insert <img> into navbar brand area.
# Strategy:
# 1) If there's an <i ...></i> icon inside navbar-brand, replace it with <img>.
# 2) Else, inject <img> right after the opening <a ...navbar-brand...> tag.
# Works for many themes.

IMG_TAG="<img src=\"$LOGO_URL\" alt=\"Logo\" class=\"site-logo\">"

# Use perl for multi-line safe edits
have perl || die "perl not found (it normally exists in Git Bash)."

perl -0777 -i -pe '
  my $img = $ENV{IMG_TAG};
  # Case 1: replace icon inside navbar-brand
  if (s{(<a\b[^>]*class="[^"]*\bnavbar-brand\b[^"]*"[^>]*>.*?)(<i\b[^>]*>.*?</i>)}{$1$img}si) {
    # done
  }
  # Case 2: inject right after opening navbar-brand <a>
  elsif (s{(<a\b[^>]*class="[^"]*\bnavbar-brand\b[^"]*"[^>]*>)}{$1$img}si) {
    # done
  }
  else {
    # As a fallback, try common "site-title" container
    s{(<a\b[^>]*class="[^"]*\bsite-title\b[^"]*"[^>]*>)}{$1$img}si;
  }
' "$HEADER_FILE" IMG_TAG="$IMG_TAG"

# Confirm logo inserted
if ! grep -n "site-logo" "$HEADER_FILE" >/dev/null 2>&1; then
  echo "WARNING: Could not auto-insert logo in $HEADER_FILE. It may use different markup." | tee -a "$REPORT"
  echo "Open $HEADER_FILE and search for the site title text and add: $IMG_TAG" | tee -a "$REPORT"
else
  echo "Inserted logo markup into: $HEADER_FILE" | tee -a "$REPORT"
fi

# -------- add CSS/SCSS for logo sizing --------
echo "Adding .site-logo styles..." | tee -a "$REPORT"

STYLE_SNIPPET=$'\n\n/* Added by fix-logo.sh */\n.site-logo{\n  height: 34px;\n  width: auto;\n  margin-right: 12px;\n  vertical-align: middle;\n}\n'

STYLE_TARGET=""

# Prefer Docsy/Hugo project scss file if present
if [[ -f "assets/scss/_styles_project.scss" ]]; then
  STYLE_TARGET="assets/scss/_styles_project.scss"
elif [[ -f "assets/scss/custom.scss" ]]; then
  STYLE_TARGET="assets/scss/custom.scss"
elif [[ -f "static/css/custom.css" ]]; then
  STYLE_TARGET="static/css/custom.css"
else
  # pick a likely CSS file
  STYLE_TARGET="$(find . -maxdepth 4 -type f \( -iname "custom.css" -o -iname "main.css" -o -iname "styles.css" \) \
    ! -path "./.git/*" ! -path "./node_modules/*" ! -path "./public/*" ! -path "./resources/*" 2>/dev/null | head -n1 || true)"
fi

if [[ -z "${STYLE_TARGET:-}" ]]; then
  # Create a safe custom CSS file if none found
  mkdir -p "static/css"
  STYLE_TARGET="static/css/custom.css"
  echo "Created: $STYLE_TARGET" | tee -a "$REPORT"
fi

if grep -n "\.site-logo" "$STYLE_TARGET" >/dev/null 2>&1; then
  echo ".site-logo already exists in $STYLE_TARGET (not duplicating)." | tee -a "$REPORT"
else
  printf "%s" "$STYLE_SNIPPET" >> "$STYLE_TARGET"
  echo "Appended .site-logo styles to: $STYLE_TARGET" | tee -a "$REPORT"
fi

echo "----------------------------------------" | tee -a "$REPORT"
echo "DONE. Review changes below." | tee -a "$REPORT"

echo
echo "=== git status ==="
git status

echo
echo "=== git diff (first 200 lines) ==="
git diff | sed -n '1,200p'

echo
echo "A report was saved to: $REPORT"
echo
read -r -p "Commit these changes now? (y/n): " COMMIT
if [[ "$COMMIT" =~ ^[Yy]$ ]]; then
  git add -A
  git commit -m "Insert navbar logo safely (auto audit + fix)" >/dev/null
  echo "Committed on branch: $BR"
  echo
  echo "Next steps:"
  echo "  1) Push: git push -u origin $BR"
  echo "  2) Open a PR to merge into main (or merge locally)."
  echo "  3) After merge, GitHub Pages/Hugo build will republish."
else
  echo "Not committed. Your changes are on branch: $BR"
  echo "You can commit later with: git add -A && git commit -m \"logo fix\""
fi

