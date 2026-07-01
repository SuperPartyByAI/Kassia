import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';

async function verify() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const page = await browser.newPage();
    const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
    
    await page.goto(url, { waitUntil: 'networkidle0' });
    const html = await page.content();
    const $ = cheerio.load(html);
    
    const t = 'pictură pe față';
    $('*').each((i, el) => {
        const isProtected = $(el).closest('header, footer, .reviews-class, .elfsight-app, [class*="review"], [id*="review"]').length > 0;
        const text = $(el).clone().children().remove().end().text();
        if (text.toLowerCase().includes(t.toLowerCase()) && !isProtected) {
            console.log("Found in editable content:", text.trim());
        }
    });
    
    await browser.close();
}

verify().catch(console.error);
