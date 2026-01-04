#!/usr/bin/env bash
set -euo pipefail

ROOT_SEARCH="/c/Users/Mohammad/Documents/Blog"
EXCLUDE_DIR="/c/Users/Mohammad/Documents/Blog/pedsgimind-docsy"
DEST_DIR="content/en/blog"

EMPTY_FILES=(
"$DEST_DIR/2025-12-25-Allergens_Introducing.md"
"$DEST_DIR/2025-12-25-Allergies.md"
"$DEST_DIR/2025-12-25-Alpha1_Antitrypsin_Deficiency.md"
"$DEST_DIR/2025-12-25-Cyclic_Vomiting.md"
"$DEST_DIR/2025-12-25-Cystic_FibrosisRelated_Liver_Disease.md"
"$DEST_DIR/2025-12-25-FPIES_Food_ProteinInduced_Enterocolitis_Syndrome.md"
"$DEST_DIR/2025-12-25-FPIIES_Food_ProteinInduced_Enterocolitis_Syndrome.md"
"$DEST_DIR/2025-12-25-Gastrointestinal_Gas.md"
"$DEST_DIR/2025-12-25-HighCalorie_Nutrition.md"
"$DEST_DIR/2025-12-25-Indigestion_Functional_Dyspepsia_NonUlcer_Dyspepsia.md"
"$DEST_DIR/2025-12-25-Metabolic_DysfunctionAssociated_Steatotic_Liver_Disease_MASLD_Formerly_NAFLD.md"
"$DEST_DIR/2025-12-25-Polyps_Gastrointestinal.md"
"$DEST_DIR/2025-12-25-Sleep.md"
"$DEST_DIR/2025-12-25-Toddlers_Diarrhea.md"
)

get_yaml_front_matter () {
  awk '
    NR==1 && $0 ~ /^---[[:space:]]*$/ {print; in_fm=1; next}
    in_fm==1 {print; if($0 ~ /^---[[:space:]]*$/ && NR>1){exit}}
  ' "$1"
}

strip_front_matter_file () {
  awk '
    BEGIN{in_fm=0; delim=""; saw_open=0; saw_close=0}
    NR==1 {
      if ($0 ~ /^---[[:space:]]*$/) {in_fm=1; delim="---"; saw_open=1; next}
      if ($0 ~ /^\+\+\+[[:space:]]*$/) {in_fm=1; delim="\\+\\+\\+"; saw_open=1; next}
    }
    in_fm==1 {
      if ($0 ~ ("^" delim "[[:space:]]*$") || $0 ~ /^\.{3}[[:space:]]*$/) {in_fm=0; saw_close=1; next}
      next
    }
    {print}
    END{ if (saw_open==1 && saw_close==0) exit 3 }
  ' "$1"
}

strip_broken_front_matter_fallback () {
  awk '
    NR==1 && ($0 ~ /^---[[:space:]]*$/ || $0 ~ /^\+\+\+[[:space:]]*$/) {in_meta=1; next}
    in_meta==1 && $0 ~ /^[[:space:]]*$/ {in_meta=0; next}
    in_meta==1 && $0 ~ /^#/{in_meta=0}
    in_meta==0 {print}
  ' "$1"
}

trim_blank () { sed '/^[[:space:]]*$/d'; }

for dest in "${EMPTY_FILES[@]}"; do
  base="$(basename "$dest")"
  nodate="${base#????-??-??-}"
  slugbase="${nodate%.md}"

  echo "==== FIXING: $dest"
  echo "     Searching for: $nodate OR $slugbase/index.md"

  src="$(find "$ROOT_SEARCH" -type f \
        \( -name "$nodate" -o -path "*/$slugbase/index.md" \) \
        ! -path "$EXCLUDE_DIR/*" 2>/dev/null | head -n 1)"

  if [[ -z "${src:-}" ]]; then
    src="$(find "$ROOT_SEARCH" -type f -iname "*${slugbase//_/}*.md" \
          ! -path "$EXCLUDE_DIR/*" 2>/dev/null | head -n 1)"
  fi

  if [[ -z "${src:-}" ]]; then
    echo "❌ No source found on disk for: $nodate"
    continue
  fi

  fm="$(get_yaml_front_matter "$dest" || true)"
  if [[ -z "${fm:-}" ]]; then
    echo "❌ Destination has no YAML front matter (expected ---). Skipping."
    continue
  fi

  body=""
  if strip_front_matter_file "$src" > /tmp/_body.txt 2>/dev/null; then
    body="$(cat /tmp/_body.txt)"
  else
    body="$(strip_broken_front_matter_fallback "$src")"
  fi

  if [[ -z "$(printf "%s\n" "$body" | trim_blank)" ]]; then
    echo "❌ Source found but still no body extracted: $src"
    continue
  fi

  cp -p "$dest" "$dest.restorebak"

  {
    printf "%s\n" "$fm"
    echo
    printf "%s\n" "$body" | sed -e 's/\r$//'
    echo
  } > "$dest"

  echo "✅ Restored body from: $src"
done

rm -f /tmp/_body.txt 2>/dev/null || true
echo "DONE."
