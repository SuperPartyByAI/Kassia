import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

async function run() {
    const res = await fetch('https://www.kassia.ro/?bust=' + Date.now());
    const html = await res.text();
    const $ = cheerio.load(html);
    const txt = $('body').text().toLowerCase().replace(/\s+/g, ' ');

    const terms = ["câteva săptămâni", "ofertă", "spectaculoase", "excelentă", "sigure"];
    terms.forEach(t => {
        const found = txt.includes(t.toLowerCase());
        console.log(`Term '${t}' found in DOM: ${found}`);
    });
}
run();
