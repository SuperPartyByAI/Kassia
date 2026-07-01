require('dotenv').config({path: '.env.local'});
const fs = require('fs');

async function run() {
  const queries = [
    "animatori copii restaurant București",
    "animatori copii eveniment corporate București"
  ];

  const results = {};

  for (const q of queries) {
    const res = await fetch('https://google.serper.dev/search', {
      method: 'POST',
      headers: {
        'X-API-KEY': process.env.SERPER_API_KEY,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ q, gl: 'ro', hl: 'ro' })
    });
    results[q] = await res.json();
  }

  fs.writeFileSync('/tmp/serper_batchA.json', JSON.stringify(results, null, 2));
  console.log("Serper results saved.");
}

run();
