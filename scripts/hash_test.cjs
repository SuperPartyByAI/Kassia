const http = require('http');
const crypto = require('crypto');

function fetchHash(url, headers = {}) {
  return new Promise((resolve) => {
    http.get(url, { headers }, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        resolve(crypto.createHash('sha256').update(data).digest('hex'));
      });
    }).on('error', () => resolve('error'));
  });
}

async function run() {
  const url = 'http://localhost:3050/animatori-petreceri-copii/';
  const h1 = await fetchHash(url);
  const h2 = await fetchHash(url, { 'User-Agent': 'Googlebot/2.1 (+http://www.google.com/bot.html)' });
  const h3 = await fetchHash(url, { 'Cache-Control': 'no-cache' });
  console.log(`Normal:    ${h1}`);
  console.log(`Googlebot: ${h2}`);
  console.log(`No-cache:  ${h3}`);
  console.log(h1 === h2 && h2 === h3 ? 'PASS: Perfect SSR match!' : 'FAIL: Hashes differ');
}
run();
