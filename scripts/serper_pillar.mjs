import dotenv from 'dotenv';
import fs from 'fs';

dotenv.config({ path: '.env.local' });

async function run() {
  const query = "animatori petreceri copii bucuresti";
  const res = await fetch('https://google.serper.dev/search', {
    method: 'POST',
    headers: {
      'X-API-KEY': process.env.SERPER_API_KEY,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ q: query, gl: 'ro', hl: 'ro', num: 10 })
  });
  const data = await res.json();
  fs.writeFileSync('serp_pillar.json', JSON.stringify(data, null, 2));
  console.log("Saved serp_pillar.json");
  console.log("Top results:");
  data.organic.forEach((r, i) => console.log(`${i+1}. ${r.title} - ${r.link}`));
}
run();
