const fs = require('fs');
const txt = fs.readFileSync('/tmp/kassia_sitemap.xml', 'utf8');
const locs = [...txt.matchAll(/<loc>(.*?)<\/loc>/g)].map(m => m[1]);

console.log(JSON.stringify({
  xml_parse_ok: locs.length > 0,
  urls_count: locs.length,
  has_animatori: locs.includes('https://www.kassia.ro/animatori-petreceri-copii/'),
  has_catalog: locs.includes('https://www.kassia.ro/catalog-costume/'),
  sample: locs.slice(0, 3)
}, null, 2));
