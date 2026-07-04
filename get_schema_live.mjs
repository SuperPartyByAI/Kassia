import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

async function run() {
    const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
    const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' } });
    const html = await res.text();
    const $ = cheerio.load(html);
    
    $('script[type="application/ld+json"]').each((i, el) => {
        console.log("SCHEMA BLOCK", i);
        try {
            const parsed = JSON.parse($(el).html());
            console.log(JSON.stringify(parsed, null, 2));
        } catch(e) {
            console.error("Failed to parse JSON-LD script", i, e);
        }
    });
}
run();
