import * as cheerio from 'cheerio';
import fetch from 'node-fetch';

async function run() {
    const res = await fetch('https://www.kassia.ro/animatori-petreceri-copii/?v=' + Date.now(), { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' } });
    const html = await res.text();
    const $ = cheerio.load(html);
    
    $('.apreciere-item').each((_, el) => {
        const name = $(el).find('.apreciere-nume').text().trim();
        const text = $(el).find('.apreciere-text').text().trim();
        console.log(`[${name}] ${text}`);
    });
}
run();
