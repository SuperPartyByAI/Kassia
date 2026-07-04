import fs from 'fs';
const xml = fs.readFileSync('/tmp/kassia_sitemap.xml', 'utf8');
const urls = xml.match(/<loc>(.*?)<\/loc>/g).map(u => u.replace(/<\/?loc>/g, ''));
console.log(JSON.stringify({
  xml_parse_ok: true,
  urls_count: urls.length,
  sample_urls: urls.slice(0, 10)
}, null, 2));
