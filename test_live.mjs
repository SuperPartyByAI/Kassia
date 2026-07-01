import fetch from 'node-fetch';
import * as cheerio from 'cheerio';
async function run() {
    const r = await fetch('https://www.kassia.ro/?bust=' + Date.now());
    const h = await r.text();
    const $ = cheerio.load(h);
    const txt = $('body').text().replace(/\s+/g, ' ');
    console.log('spectaculoase:', txt.includes('spectaculoase'));
    console.log('sigure:', txt.includes('sigure'));
    
    // find exactly where it is
    $('*').each((i, el) => {
        const elText = $(el).text().trim();
        if(elText.includes('spectaculoase') && $(el).children().length === 0) {
            console.log('Found spectaculoase in tag:', el.tagName, 'Class:', $(el).attr('class'));
            console.log('Text:', elText);
        }
        if(elText.includes('sigure') && $(el).children().length === 0) {
            console.log('Found sigure in tag:', el.tagName, 'Class:', $(el).attr('class'));
            console.log('Text:', elText);
        }
    });
}
run();
