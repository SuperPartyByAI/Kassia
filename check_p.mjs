import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
const targetUrl = 'https://www.kassia.ro/animatori-petreceri-copii-sector-1/?v=' + Date.now();
fetch(targetUrl, { headers: { 'Cache-Control': 'no-cache' } }).then(res => res.text()).then(html => {
    const $ = cheerio.load(html);
    const fullText = $('body').text().replace(/\s+/g, ' ');
    const idx = fullText.indexOf('<p>');
    if (idx !== -1) {
        console.log('Found <p> context:', fullText.substring(Math.max(0, idx - 40), Math.min(fullText.length, idx + 40)));
    } else {
        console.log('No <p> found in text');
    }
});
