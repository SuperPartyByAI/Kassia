import * as cheerio from 'cheerio';
async function run() {
    const url = `https://www.kassia.ro/animatori-petreceri-copii/?v=${Date.now()}`;
    const res = await fetch(url);
    const html = await res.text();
    const $ = cheerio.load(html);
    
    let hasDimensions = 0;
    $('img').each((_, el) => {
        if ($(el).attr('width') && $(el).attr('height')) {
            hasDimensions++;
        }
    });
    console.log(`Images with explicit width/height: ${hasDimensions} out of ${$('img').length}`);
}
run();
