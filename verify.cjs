const fs = require('fs');
const http = require('http');
const https = require('https');

const routes = [
  '/',
  '/animatori-petreceri-copii/',
  '/animatori-petreceri-copii-bucuresti/',
  '/catalog-costume/',
  '/ursitoare-botez-bucuresti/',
  '/mascote-petreceri-copii-bucuresti/',
  '/blog/',
  '/robots.txt',
  '/sitemap.xml',
  '/random-404-ruta-inexistenta',
  '/random.xml',
  '/sitemap_index.xml/',
  '/sitemap-index.xml'
];

async function fetchRoute(path) {
  return new Promise((resolve, reject) => {
    http.get({
      hostname: '127.0.0.1',
      port: 3050,
      path: path,
      headers: { 'Host': 'www.kassia.ro' }
    }, (res) => {
      let body = '';
      res.on('data', chunk => body += chunk);
      res.on('end', () => resolve({ statusCode: res.statusCode, headers: res.headers, body }));
    }).on('error', reject);
  });
}

async function run() {
  let log = '';
  for(const r of routes) {
    const res = await fetchRoute(r);
    log += `Route ${r}: ${res.statusCode}\n`;
    if(r.includes('animatori')) {
      if(res.body.includes('430 lei') || res.body.includes('560 lei') || res.body.includes('860 lei')) {
        log += `WARNING: Bad price found on ${r}\n`;
      }
    }
    fs.writeFileSync('/opt/kassia-site/evidence_' + r.replace(/\//g, '_') + '.html', res.body);
  }
  fs.writeFileSync('/opt/kassia-site/routing_matrix.txt', log);
  console.log('Verification done');
}
run();
