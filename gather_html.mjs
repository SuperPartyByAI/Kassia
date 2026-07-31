import http from 'http';
import fs from 'fs';

const paths = [
    '/', '/animatori-petreceri-copii/', '/preturi-animatori-copii-bucuresti/', '/catalog-costume/', '/blog/', '/robots.txt', '/sitemap.xml', '/sitemap-index.xml', '/random-404'
];

fs.mkdirSync('/opt/kassia-site/evidence_tmp/14_raw_headers', { recursive: true });
fs.mkdirSync('/opt/kassia-site/evidence_tmp/15_raw_html', { recursive: true });

async function fetchPath(p) {
    return new Promise((resolve) => {
        http.get({ hostname: '127.0.0.1', port: 3050, path: p, headers: { 'Host': 'www.kassia.ro' } }, (res) => {
            let body = '';
            res.on('data', chunk => body += chunk);
            res.on('end', () => resolve({ headers: res.headers, body }));
        }).on('error', () => resolve({ headers: {}, body: '' }));
    });
}

async function run() {
    for (const p of paths) {
        const res = await fetchPath(p);
        const safeName = p.replace(/\//g, '_') || 'root';
        fs.writeFileSync('/opt/kassia-site/evidence_tmp/14_raw_headers/' + safeName + '.json', JSON.stringify(res.headers, null, 2));
        fs.writeFileSync('/opt/kassia-site/evidence_tmp/15_raw_html/' + safeName + '.html', res.body);
        if (p === '/sitemap.xml') fs.writeFileSync('/opt/kassia-site/evidence_tmp/16_sitemap.xml', res.body);
        if (p === '/robots.txt') fs.writeFileSync('/opt/kassia-site/evidence_tmp/17_robots.txt', res.body);
    }
}
run();
