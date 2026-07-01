import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';

async function audit() {
    console.log("Starting audit for 'pictură pe față' on Main Hub...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const page = await browser.newPage();
    const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
    
    await page.goto(url, { waitUntil: 'networkidle0' });
    const html = await page.content();
    const $ = cheerio.load(html);
    
    const term1 = 'pictură pe față';
    const term2 = 'pictura pe fata';
    const hasTerm = (t) => t.toLowerCase().includes(term1) || t.toLowerCase().includes(term2);
    
    const results = {
        editable_content: [],
        faq: [],
        meta: [],
        protected_reviews: [],
        footer_header: []
    };
    
    // Check Meta
    $('meta').each((i, el) => {
        const content = $(el).attr('content');
        if (content && hasTerm(content)) {
            results.meta.push(content);
        }
    });
    
    // Check FAQ
    $('[class*="faq"], [id*="faq"]').each((i, el) => {
        const text = $(el).text();
        if (hasTerm(text)) {
            results.faq.push($(el).text().trim().replace(/\n/g, ' ').substring(0, 100));
        }
    });
    
    // Check Reviews
    $('.reviews-class, .elfsight-app, [class*="review"], [id*="review"]').each((i, el) => {
        const text = $(el).text();
        if (hasTerm(text)) {
            results.protected_reviews.push($(el).text().trim().replace(/\n/g, ' ').substring(0, 100));
        }
    });
    
    // Check Header/Footer
    $('header, footer').each((i, el) => {
        const text = $(el).text();
        if (hasTerm(text)) {
            results.footer_header.push($(el).text().trim().replace(/\n/g, ' ').substring(0, 100));
        }
    });
    
    // Check Main Content (excluding above)
    $('body').find('*').each((i, el) => {
        // filter out elements we already checked
        if ($(el).closest('header, footer, [class*="faq"], [id*="faq"], .reviews-class, .elfsight-app, [class*="review"], [id*="review"]').length > 0) return;
        
        // check direct text nodes
        const text = $(el).clone().children().remove().end().text();
        if (hasTerm(text)) {
            results.editable_content.push(text.trim().substring(0, 100));
        }
    });

    console.log(JSON.stringify(results, null, 2));
    await browser.close();
}

audit().catch(console.error);
