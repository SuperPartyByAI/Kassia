echo "=== SITEMAP PROOF ==="
curl -sI https://www.kassia.ro/sitemap.xml | grep -iE "^HTTP|^location|^content-type"
echo "---"
curl -sI https://www.kassia.ro/sitemap.xml/ | grep -iE "^HTTP|^location|^content-type"
echo "---"
curl -sI https://www.kassia.ro/sitemap_index.xml | grep -iE "^HTTP|^location|^content-type"
echo "---"
curl -sI https://www.kassia.ro/sitemap_index.xml/ | grep -iE "^HTTP|^location|^content-type"
echo "---"
curl -sI https://www.kassia.ro/sitemap-index.xml | grep -iE "^HTTP|^location|^content-type"
echo "---"
curl -sI https://www.kassia.ro/sitemap-index.xml/ | grep -iE "^HTTP|^location|^content-type"
echo "---"
curl -sI https://www.kassia.ro/robots.txt | grep -iE "^HTTP|^location|^content-type"
echo "=== FOLLOW REDIRECTS ==="
curl -sIL https://www.kassia.ro/sitemap.xml/ | grep -iE "^HTTP|^location|^content-type"
echo "---"
curl -sIL https://www.kassia.ro/sitemap_index.xml | grep -iE "^HTTP|^location|^content-type"
echo "---"
curl -sIL https://www.kassia.ro/sitemap-index.xml | grep -iE "^HTTP|^location|^content-type"
echo "=== XML VALIDATION ==="
curl -sL --compressed https://www.kassia.ro/sitemap.xml -o /tmp/kassia_sitemap.xml
python3 - <<'PY'
import xml.etree.ElementTree as ET
from pathlib import Path
txt = Path("/tmp/kassia_sitemap.xml").read_text(encoding="utf-8", errors="ignore")
root = ET.fromstring(txt)
ns = {"sm": "http://www.sitemaps.org/schemas/sitemap/0.9"}
urls = root.findall(".//sm:url/sm:loc", ns) or root.findall(".//loc")
locs = [u.text for u in urls]
import json
print(json.dumps({
  "xml_parse_ok": True,
  "urls_count": len(locs),
  "has_animatori": "https://www.kassia.ro/animatori-petreceri-copii/" in locs,
  "has_catalog": "https://www.kassia.ro/catalog-costume/" in locs,
  "sample": locs[:3]
}, indent=2))
PY
