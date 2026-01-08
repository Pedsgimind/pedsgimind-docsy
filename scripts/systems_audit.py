#!/usr/bin/env python3
import csv
import re
from pathlib import Path

try:
    import yaml
except ImportError:
    raise SystemExit("Missing PyYAML. Install with: pip install pyyaml")

ROOT = Path(__file__).resolve().parents[1]
CONTENT_DIR = ROOT / "content" / "en" / "blog"

FM_RE = re.compile(r"^---\s*\n(.*?)\n---\s*\n", re.DOTALL)

def read_front_matter(text: str):
    m = FM_RE.match(text)
    if not m:
        return None, text
    fm_raw = m.group(1)
    body = text[m.end():]
    fm = yaml.safe_load(fm_raw) or {}
    if not isinstance(fm, dict):
        fm = {}
    return fm, body

def norm(v):
    if v is None:
        return ""
    if isinstance(v, str):
        return v
    if isinstance(v, list):
        return "; ".join(str(x) for x in v)
    return str(v)

def main():
    if not CONTENT_DIR.exists():
        raise SystemExit(
            f"CONTENT_DIR not found: {CONTENT_DIR}\n"
            "If your posts are not in content/en/blog, adjust CONTENT_DIR in this script."
        )

    rows = []
    for md in sorted(CONTENT_DIR.rglob("*.md")):
        txt = md.read_text(encoding="utf-8")
        fm, _ = read_front_matter(txt)
        if fm is None:
            continue

        rows.append({
            "file": str(md.relative_to(ROOT)),
            "title": fm.get("title", ""),
            "systems": norm(fm.get("systems", "")),
            "categories": norm(fm.get("categories", "")),
            "tags": norm(fm.get("tags", "")),
            "date": str(fm.get("date", "")),
        })

    out = ROOT / "systems-audit.csv"
    with out.open("w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=["file", "title", "systems", "categories", "tags", "date"])
        w.writeheader()
        w.writerows(rows)

    print(f"Wrote: {out} ({len(rows)} posts)")

if __name__ == "__main__":
    main()
