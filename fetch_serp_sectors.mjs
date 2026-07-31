import google from 'googlethis';
import fs from 'fs';

async function getSerp() {
  const sectors = [1, 2, 3, 4, 5, 6];
  const results = {};
  
  for (const s of sectors) {
    const query = `animatori petreceri copii sector ${s}`;
    console.log(`Searching: ${query}`);
    try {
      const response = await google.search(query, {
        page: 0, 
        safe: false, 
        parse_ads: false,
        additional_params: {
          hl: 'ro',
          gl: 'RO'
        }
      });
      results[`sector_${s}`] = response.results.slice(0, 10).map(r => ({ title: r.title, url: r.url, snippet: r.description }));
      // wait a bit to avoid rate limits
      await new Promise(r => setTimeout(r, 2000));
    } catch (e) {
      console.error(e);
    }
  }
  
  fs.writeFileSync('serp_results_sectors.json', JSON.stringify(results, null, 2));
  console.log('Saved to serp_results_sectors.json');
}

getSerp();
