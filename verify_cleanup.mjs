import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';

async function verify() {
    console.log("Starting Live Verification for Main Hub...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const page = await browser.newPage();
    const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
    
    await page.goto(url, { waitUntil: 'networkidle0' });
    const html = await page.content();
    const $ = cheerio.load(html);
    
    // Negative strings
    const negativeTerms = ['pictură pe față', 'pictura pe fata'];
    console.log("=== A. NEGATIVE GREP ===");
    negativeTerms.forEach(t => {
        let count = 0;
        let protectedCount = 0;
        $('*').each((i, el) => {
            const isProtected = $(el).closest('header, footer, .reviews-class, .elfsight-app, [class*="review"], [id*="review"]').length > 0;
            const text = $(el).clone().children().remove().end().text();
            if (text.toLowerCase().includes(t.toLowerCase())) {
                if (isProtected) protectedCount++;
                else count++;
            }
        });
        console.log(`[NEG] "${t}": ${count} in editable content, ${protectedCount} in protected blocks.`);
    });
    
    console.log("\n=== B. POSITIVE GREP ===");
    const positiveTerms = [
        'atelierele creative',
        'momente creative individuale',
        'activitățile individuale (ateliere creative, modelaj de baloane)',
        'materialele pentru activitățile creative',
        'ateliere creative'
    ];
    positiveTerms.forEach(t => {
        const fullText = $.text().toLowerCase();
        const found = fullText.includes(t.toLowerCase());
        console.log(`[POS] "${t}": ${found ? 'FOUND' : 'NOT FOUND'}`);
    });
    
    console.log("\n=== C. INTACT ELEMENTS ===");
    const text = $.text();
    console.log(`[CHK] pricing preview (280/490/830): ${text.includes('280') && text.includes('490') && text.includes('830') ? 'INTACT' : 'MISSING'}`);
    console.log(`[CHK] 1-3 ore absent: ${!text.includes('1-3 ore') ? 'INTACT (Absent)' : 'FAILED (Present)'}`);
    console.log(`[CHK] paragraful 1 vs 2 personaje curat (fara 'momentele de momentele'): ${!text.includes('momentele de momentele') ? 'INTACT' : 'FAILED'}`);
    console.log(`[CHK] reviews/stele intacte: ${$('.elfsight-app, [class*="review"]').length > 0 || text.includes('4.9') ? 'INTACT' : 'MISSING'}`);
    const faqCount = $('[class*="faq"], [id*="faq"]').length;
    console.log(`[CHK] FAQ count minimum 8: ${faqCount >= 8 ? `INTACT (${faqCount})` : `FAILED (${faqCount})`}`);
    
    await browser.close();
}

verify().catch(console.error);
