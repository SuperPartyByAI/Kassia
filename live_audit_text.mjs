import * as cheerio from 'cheerio';

async function run() {
    try {
        const url = `https://www.kassia.ro/animatori-petreceri-copii/?v=${Date.now()}`;
        const res = await fetch(url, { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' }});
        const html = await res.text();
        const $ = cheerio.load(html);

        $('header').remove();
        $('footer').remove();
        $('.aprecieri-clienti').remove();
        $('.site-footer').remove();
        $('.navbar').remove();
        
        const cleanText = $('body').text().replace(/\s+/g, ' ');

        const oldTextCheck = cleanText.includes("câteva săptămâni");
        const newTextCheck = cleanText.includes("să ne trimiți detaliile evenimentului din timp");

        console.log("Old text present:", oldTextCheck);
        console.log("New text present:", newTextCheck);

    } catch (err) {
        console.error(err);
    }
}
run();
