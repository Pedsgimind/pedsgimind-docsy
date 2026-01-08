#!/usr/bin/env python3
import csv
import re
from pathlib import Path

try:
    import yaml
except ImportError:
    raise SystemExit("Missing PyYAML. Install with: pip install pyyaml")

ROOT = Path(__file__).resolve().parents[1]
FM_RE = re.compile(r"^---\s*\n(.*?)\n---\s*\n", re.DOTALL)

# ✅ Update this list to EXACTLY match the terms you want to allow.
# Based on your edited CSV, you currently use these 9:
ALLOWED_SYSTEMS = {
    "Upper GI",
    "Lower GI",
    "Liver & Biliary",
    "Pancreas",
    "Nutrition & Growth",
    "GI Bleeding",
    "Allergy/EGID",
    "Brain-Gut Axis Disorders",
    "Imagings & Procedures",
}

def split_fm(text: str):
    m = FM_RE.match(text)
    if not m:
        return None, None, text
    return m.group(0), m.group(1), text[m.end():]

def split_list(cell: str):
    # CSV uses ";" between items
    if cell is None:
        return []
    cell = str(cell).strip()
    if not cell:
        return []
    return [x.strip() for x in cell.split(";") if x.strip()]

def main():
    csv_path = ROOT / "systems-audit.csv"
    if not csv_path.exists():
        raise SystemExit("systems-audit.csv not found in repo root. Put it next to your hugo config and run again.")

    updates = 0

    # NOTE: Excel sometimes writes BOM; utf-8-sig handles it safely.
    with csv_path.open("r", encoding="utf-8-sig", newline="") as f:
        r = csv.DictReader(f)
        for row in r:
            rel = (row.get("file") or "").strip()
            if not rel:
                continue

            # Handle Windows backslashes from CSV
            rel = rel.replace("\\", "/")

            md = ROOT / rel
            if not md.exists():
                # Skip silently (or raise if you want strict behavior)
                continue

            txt = md.read_text(encoding="utf-8")
            _, fm_raw, body = split_fm(txt)
            if fm_raw is None:
                continue

            fm = yaml.safe_load(fm_raw) or {}
            if not isinstance(fm, dict):
                fm = {}

            systems = split_list(row.get("systems", ""))

            bad = [s for s in systems if s not in ALLOWED_SYSTEMS]
            if bad:
                raise SystemExit(
                    f"{rel}: invalid systems {bad}\n"
                    f"Allowed systems are: {sorted(ALLOWED_SYSTEMS)}\n"
                    "Fix the 'systems' cell in systems-audit.csv and run again."
                )

            # Apply systems (set or remove)
            if systems:
                fm["systems"] = systems
            else:
                fm.pop("systems", None)

            # Apply categories if column exists (set or remove)
            if "categories" in row:
                categories = split_list(row.get("categories", ""))
                if categories:
                    fm["categories"] = categories
                else:
                    fm.pop("categories", None)

            # OPTIONAL: apply tags too (uncomment if you edited tags in CSV)
            # if "tags" in row:
            #     tags = split_list(row.get("tags", ""))
            #     if tags:
            #         fm["tags"] = tags
            #     else:
            #         fm.pop("tags", None)

            new_fm_raw = yaml.safe_dump(fm, sort_keys=False, allow_unicode=True).strip()
            new_txt = f"---\n{new_fm_raw}\n---\n{body}"
            md.write_text(new_txt, encoding="utf-8")
            updates += 1

    print(f"Updated {updates} files.")

if __name__ == "__main__":
    main()
