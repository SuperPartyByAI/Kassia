import puppeteer from 'puppeteer';
import fs from 'fs';
import path from 'path';

const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
const brainDir = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/';

async function runQA() {
    console.log("🚀 Taking Exact Screenshots...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    
    await page.goto(url, { waitUntil: 'networkidle0', timeout: 60000 });
    
    // Hide any cookie banners if present
    await page.evaluate(() => {
        document.querySelectorAll('iframe, .cookie-banner, #cookie-notice').forEach(e => e.style.display = 'none');
    });

    // --- DESKTOP ---
    await page.setViewport({ width: 1280, height: 800 });
    
    // Desktop Above fold
    await page.evaluate(() => window.scrollTo(0, 0));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_desktop_above_fold.png') });
    
    // Desktop pricing
    await page.evaluate(() => window.scrollTo(0, 800));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_desktop_pricing.png') });
    
    // Desktop blocuri
    await page.evaluate(() => window.scrollTo(0, 1500));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_desktop_blocuri.png') });

    // Desktop FAQ / Reviews
    await page.evaluate(() => window.scrollTo(0, document.body.scrollHeight - 1800));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_desktop_faq_reviews.png') });

    // --- MOBILE ---
    await page.setViewport({ width: 375, height: 667, isMobile: true });
    await page.goto(url, { waitUntil: 'networkidle0' }); 
    await page.evaluate(() => {
        document.querySelectorAll('iframe, .cookie-banner, #cookie-notice').forEach(e => e.style.display = 'none');
    });

    // Mobile Above fold
    await page.evaluate(() => window.scrollTo(0, 0));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_mobile_above_fold.png') });
    
    // Mobile pricing
    await page.evaluate(() => window.scrollTo(0, 1000));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_mobile_pricing.png') });
    
    // Mobile blocuri
    await page.evaluate(() => window.scrollTo(0, 1800));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_mobile_blocuri.png') });

    // Mobile FAQ / Reviews
    await page.evaluate(() => window.scrollTo(0, document.body.scrollHeight - 2000));
    await new Promise(r => setTimeout(r, 500));
    await page.screenshot({ path: path.join(brainDir, 'main_hub_mobile_faq_reviews.png') });

    await browser.close();
    console.log("✅ Screenshot Script finished.");
}

runQA().catch(console.error);
