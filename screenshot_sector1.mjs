import puppeteer from 'puppeteer';

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 800 });
    
    console.log("Navigating to Sector 1 page...");
    await page.goto('https://www.kassia.ro/animatori-petreceri-copii-sector-1/', { waitUntil: 'networkidle0' });
    
    const screenshotPath = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/sector1_current.png';
    await page.screenshot({ path: screenshotPath, fullPage: true });
    
    console.log(`Screenshot saved to ${screenshotPath}`);
    await browser.close();
}

run().catch(console.error);
