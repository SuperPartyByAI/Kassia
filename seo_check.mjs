import * as cheerio from 'cheerio';
import fetch from 'node-fetch';

async function run() {
    const res = await fetch('https://www.kassia.ro/animatori-petreceri-copii/?v=' + Date.now(), { headers: { 'Cache-Control': 'no-cache' } });
    const html = await res.text();
    const $ = cheerio.load(html);
    
    const h1 = $('h1').map((i, el) => $(el).text().trim()).get();
    const h2 = $('h2').map((i, el) => $(el).text().trim()).get();
    const h3 = $('h3').map((i, el) => $(el).text().trim()).get();
    const internalLinks = $('a[href^="/"], a[href^="https://www.kassia.ro"]').length;
    
    let schemaFound = false;
    $('script[type="application/ld+json"]').each((_, el) => {
        if ($(el).html().includes('FAQPage') || $(el).html().includes('AggregateRating')) {
            schemaFound = true;
        }
    });

    console.log(JSON.stringify({
        h1,
        h2,
        h3,
        internalLinks,
        schemaFound,
        wordCount: $('body').text().split(/\s+/).filter(w => w.length > 2).length
    }, null, 2));
}
run();
