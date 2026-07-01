import * as cheerio from 'cheerio';
import fetch from 'node-fetch';

async function verifyPage(url) {
    const res = await fetch(url + '?v=' + Date.now(), { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' } });
    const html = await res.text();
    const $ = cheerio.load(html);
    
    let images = [];
    $('.section-image-placeholder img, .hero-image, .service-card-image img').each((_, el) => {
        const src = $(el).attr('src');
        if (src && src.includes('/images/animatori/')) {
            images.push({
                src: src,
                alt: $(el).attr('alt'),
                width: $(el).attr('width'),
                height: $(el).attr('height')
            });
        }
    });
    return { url, http200: res.status === 200, imagesFound: images };
}

async function run() {
    const p1 = await verifyPage('https://www.kassia.ro/preturi-animatori-copii-bucuresti/');
    const p2 = await verifyPage('https://www.kassia.ro/animatori-petreceri-copii/');
    console.log(JSON.stringify({ page1: p1, page2: p2 }, null, 2));
}
run();
