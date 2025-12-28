#!/usr/bin/env bash
set -euo pipefail

# 0) Ensure we are at repo root (has hugo.yaml)
test -f hugo.yaml || { echo "Run this at the repo root (where hugo.yaml exists)."; exit 1; }

# 1) Create Docsy custom print CSS
mkdir -p assets/scss
cat > assets/scss/_custom.scss <<'CSS'
/* === Print-only styling for .printable blocks (Docsy) === */
@media print {
  header, nav, .td-sidebar, aside, footer, .td-footer, .no-print { display: none !important; }
  body * { visibility: hidden !important; }
  .printable, .printable * { visibility: visible !important; }
  .printable {
    position: absolute; left: 0; top: 0; width: 100%;
    padding: 0.5in; background: #fff;
  }
  h1, h2, h3 { page-break-after: avoid; }
  .printable input[type=checkbox] { transform: scale(1.2); }
}
CSS

# 2) Add tiny print JS and wire it via hugo.yaml
mkdir -p assets/js
cat > assets/js/print.js <<'JS'
function printSection(id){
  const el = document.getElementById(id);
  if (el) el.scrollIntoView({behavior: "instant", block: "start"});
  window.print();
}
JS

# Append params.customJS if not already present
if ! grep -qE '^[[:space:]]*customJS:' hugo.yaml; then
  if ! grep -qE '^[[:space:]]*params:' hugo.yaml; then
    printf "\nparams:\n" >> hugo.yaml
  fi
  cat >> hugo.yaml <<'YAML'

  customJS:
    - js/print.js
YAML
fi

# 3) Add reusable shortcode
mkdir -p layouts/shortcodes
cat > layouts/shortcodes/printable.html <<'HTML'
{{ $id := .Get "id" | default (printf "print-%d" now.Unix) }}
<div id="{{ $id }}" class="printable">
  {{ with .Get "title" }}<h2 class="printable-title">{{ . }}</h2>{{ end }}

  <div class="no-print" style="margin:8px 0">
    <button onclick="printSection('{{ $id }}')" class="btn btn-outline-primary">
      Print this
    </button>
    <small class="text-muted ms-2">Tip: choose “Save as PDF”.</small>
  </div>

  <div class="printable-body">
    {{ .Inner }}
  </div>
</div>
HTML

# 4) Convert headings that start with "Printable:" into shortcode blocks in content/en/blog/**.md
shopt -s nullglob
mapfile -t FILES < <(find content/en/blog -type f -name '*.md' | sort)

for f in "${FILES[@]}"; do
  cp -n "$f" "$f.bak" || true

  awk '
    BEGIN { in_print=0; }
    /^[[:space:]]*#{1,6}[[:space:]]*Printable:[[:space:]]*/{
      line=$0
      sub(/^[[:space:]]*#{1,6}[[:space:]]*Printable:[[:space:]]*/,"",line)
      gsub(/^ +| +$/,"",line)
      printf "{{< printable title=\"%s\" >}}\n\n", line
      in_print=1
      next
    }
    /^[[:space:]]*#{1,6}[[:space:]]+/{
      if (in_print==1) {
        print "\n{{< /printable >}}\n"
        in_print=0
      }
      print $0
      next
    }
    { print $0 }
    END{
      if (in_print==1){
        print "\n{{< /printable >}}"
      }
    }
  ' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
done

# 5) Git commit & push
git add assets/scss/_custom.scss assets/js/print.js layouts/shortcodes/printable.html hugo.yaml content/en/blog || true

# Only commit if there are changes
if ! git diff --cached --quiet; then
  git commit -m "Printable blocks: Docsy CSS/JS, shortcode, and auto-convert 'Printable:' headings sitewide"
  git push
  echo "✅ Changes pushed."
else
  echo "ℹ️ No changes to commit."
fi

echo "Done. After your site rebuilds, each printable block will show a 'Print this' button."
