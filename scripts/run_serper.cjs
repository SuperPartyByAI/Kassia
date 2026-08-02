const https = require('https');
const fs = require('fs');
require('dotenv').config({ path: '/opt/kassia-site/.env.local' });
if (!process.env.SERPER_API_KEY) require('dotenv').config({ path: '/opt/kassia-site/.env' });

const API_KEY = process.env.SERPER_API_KEY;

const queries = ['animatori petreceri copii'];

async function fetchSerper(query) {
  return new Promise((resolve, reject) => {
    const data = JSON.stringify({
      q: query,
      gl: "ro",
      hl: "ro",
      location: "Bucharest, Romania",
      num: 15
    });

    const options = {
      hostname: 'google.serper.dev',
      path: '/search',
      method: 'POST',
      headers: {
        'X-API-KEY': API_KEY,
        'Content-Type': 'application/json',
        'Content-Length': data.length
      }
    };

    const req = https.request(options, res => {
      let responseBody = '';
      res.on('data', chunk => responseBody += chunk);
      res.on('end', () => resolve(responseBody));
    });

    req.on('error', error => reject(error));
    req.write(data);
    req.end();
  });
}

async function run() {
  for (const q of queries) {
    const res = await fetchSerper(q);
    console.log(res);
  }
}
run();
