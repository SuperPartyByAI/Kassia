import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';

async function verify() {
    console.log("Starting Final Live Verification for Main Hub...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const page = await browser.newPage();
    const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
    
    await page.goto(url, { waitUntil: 'networkidle0' });
    const html = await page.content();
    const $ = cheerio.load(html);
    const fullText = $.text().toLowerCase();
    
    console.log("=== A. FAQ MICRO-FIX VERIFICATION ===");
    
    const negFAQ = 'materialele pentru atelierele creative, materialele pentru activitățile creative';
    console.log(`[NEG] FAQ Broken Phrase: ${fullText.includes(negFAQ.toLowerCase()) ? 'FAILED (Present)' : 'INTACT (Absent)'}`);
    
    const posFAQ = 'accesoriile pentru jocuri, materialele pentru activitățile creative și baloanele speciale de modelat';
    console.log(`[POS] FAQ Fixed Phrase: ${fullText.includes(posFAQ.toLowerCase()) ? 'FOUND' : 'NOT FOUND'}`);

    console.log("\n=== B. PICTURA PE FATA VERIFICATION ===");
    
    const t = 'pictură pe față';
    let countEdit = 0;
    let countProtected = 0;
    $('*').each((i, el) => {
        const isProtected = $(el).closest('header, footer, .reviews-class, .elfsight-app, [class*="review"], [id*="review"]').length > 0;
        const text = $(el).clone().children().remove().end().text();
        if (text.toLowerCase().includes(t.toLowerCase())) {
            if (isProtected) countProtected++;
            else countEdit++;
        }
    });
    console.log(`[NEG] "pictură pe față" in editable: ${countEdit === 0 ? 'INTACT (0)' : 'FAILED ('+countEdit+')'}`);
    console.log(`[CHK] "pictură pe față" in protected/header/footer: ${countProtected} (READ-ONLY)`);

    console.log("\n=== C. INTACT ELEMENTS ===");
    console.log(`[CHK] pricing preview (280/490/830): ${fullText.includes('280') && fullText.includes('490') && fullText.includes('830') ? 'INTACT' : 'MISSING'}`);
    console.log(`[CHK] reviews/stele intacte: ${$('.elfsight-app, [class*="review"]').length > 0 || fullText.includes('4.9') ? 'INTACT' : 'MISSING'}`);
    
    await browser.close();
}

verify().catch(console.error);
