import http from 'http';
import fs from 'fs';

const paths = [
    '/',
    '/animatori-petreceri-copii/',
    '/preturi-animatori-copii-bucuresti/',
    '/catalog-costume/',
    '/blog/',
    '/ursitoare-botez-bucuresti/',
    '/mascote-petreceri-copii-bucuresti/',
    '/decoruri-baloane-bucuresti/',
    '/pachete-animatori-copii-bucuresti/',
    '/animatori-copii-bucuresti/',
    '/random-slug-with-slash/',
    '/random-slug-with-slash',
    '/inexistent.html',
    '/inexistent.js',
    '/path//double-slash/',
    '/invalid%encode',
    '/invalid?query=string',
    '/sitemap-index.xml',
    '/sitemap_index.xml/',
    '/sitemap.xml',
    '/robots.txt'
];

async function fetchPath(path, agent, noCache) {
    return new Promise((resolve) => {
        let headers = { 'Host': 'www.kassia.ro' };
        if (agent === 'googlebot') headers['User-Agent'] = 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/W.X.Y.Z Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)';
        if (noCache) {
            headers['Cache-Control'] = 'no-cache';
            path += (path.includes('?') ? '&' : '?') + 'cachebuster=' + Date.now();
        }
        http.get({ hostname: '127.0.0.1', port: 3050, path, headers }, (res) => {
            let body = '';
            res.on('data', chunk => body += chunk);
            res.on('end', () => resolve({ code: res.statusCode, headers: res.headers, body }));
        }).on('error', () => resolve({ code: 0, headers: {}, body: '' }));
    });
}

async function runMatrix() {
    let outNormal = 'Path,StatusCode,ContentType\n';
    let outBot = 'Path,StatusCode,ContentType\n';
    let outNoCache = 'Path,StatusCode,ContentType\n';
    
    for (const p of paths) {
        const rNorm = await fetchPath(p, 'normal', false);
        outNormal += `${p},${rNorm.code},${rNorm.headers['content-type']}\n`;
        
        const rBot = await fetchPath(p, 'googlebot', false);
        outBot += `${p},${rBot.code},${rBot.headers['content-type']}\n`;
        
        const rNC = await fetchPath(p, 'normal', true);
        outNoCache += `${p},${rNC.code},${rNC.headers['content-type']}\n`;
    }
    fs.writeFileSync('/opt/kassia-site/evidence_tmp/11_http_matrix_normal.csv', outNormal);
    fs.writeFileSync('/opt/kassia-site/evidence_tmp/12_http_matrix_googlebot.csv', outBot);
    fs.writeFileSync('/opt/kassia-site/evidence_tmp/13_http_matrix_nocache.csv', outNoCache);
}
runMatrix();
