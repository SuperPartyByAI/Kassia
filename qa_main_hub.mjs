import puppeteer from 'puppeteer';
import fs from 'fs';
import path from 'path';

const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
const brainDir = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/';

async function runQA() {
    console.log("🚀 Starting QA for Main Hub...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    
    console.log(`Navigating to ${url}`);
    const response = await page.goto(url, { waitUntil: 'networkidle0', timeout: 60000 });
    
    const status = response.status();
    console.log(`[HTTP Status]: ${status}`);
    
    // Evaluate DOM
    const technicalData = await page.evaluate(() => {
        const canonical = document.querySelector('link[rel="canonical"]')?.href || 'MISSING';
        const robots = document.querySelector('meta[name="robots"]')?.content || 'MISSING';
        const title = document.title;
        const metaDesc = document.querySelector('meta[name="description"]')?.content || 'MISSING';
        const h1 = document.querySelector('h1')?.innerText || 'MISSING';
        
        const textContent = document.body.innerText;
        const has280 = textContent.includes('280');
        const has490 = textContent.includes('490');
        const has830 = textContent.includes('830');
        const has1_3 = textContent.includes('1-3 ore') || textContent.includes('1 - 3 ore');
        
        const hasReviews = !!document.querySelector('.reviews-class, .elfsight-app, [class*="review"], [id*="review"]'); 
        // fallback check string
        const textHasReviews = textContent.toLowerCase().includes('recenzii') || textContent.toLowerCase().includes('google');
        
        return {
            canonical, robots, title, metaDesc, h1, 
            has280, has490, has830, has1_3, hasReviews: hasReviews || textHasReviews
        };
    });
    
    console.log("=== Technical Data ===");
    console.log(JSON.stringify(technicalData, null, 2));

    // Wait and hide cookie banner if any
    await page.evaluate(() => {
        document.querySelectorAll('iframe, .cookie-banner, #cookie-notice').forEach(e => e.style.display = 'none');
    });

    console.log("📸 Taking Desktop Screenshots...");
    await page.setViewport({ width: 1280, height: 800 });
    // Desktop Above fold
    await page.screenshot({ path: path.join(brainDir, 'main_hub_desktop_above_fold.png') });
    
    // Scroll to pricing
    await page.evaluate(() => window.scrollBy(0, 800));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_desktop_pricing.png') });
    
    // Scroll to educational blocks
    await page.evaluate(() => window.scrollBy(0, 1500));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_desktop_blocuri.png') });

    console.log("📸 Taking Mobile Screenshots...");
    await page.setViewport({ width: 375, height: 667, isMobile: true });
    await page.goto(url, { waitUntil: 'networkidle0' }); // reload for mobile layout
    await page.evaluate(() => {
        document.querySelectorAll('iframe, .cookie-banner, #cookie-notice').forEach(e => e.style.display = 'none');
    });

    // Mobile Above fold
    await page.screenshot({ path: path.join(brainDir, 'main_hub_mobile_above_fold.png') });
    
    // Mobile pricing
    await page.evaluate(() => window.scrollBy(0, 1000));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_mobile_pricing.png') });
    
    // Mobile reviews
    await page.evaluate(() => window.scrollTo(0, document.body.scrollHeight - 1500));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_mobile_reviews.png') });

    await browser.close();
    console.log("✅ QA Script finished.");
}

runQA().catch(console.error);
