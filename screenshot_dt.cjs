const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 800 });
    await page.goto('https://www.kassia.ro/animatori-copii-drumul-taberei/', { waitUntil: 'networkidle2' });
    await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/audit_dt_legacy.png', fullPage: true });
    await browser.close();
    console.log('Screenshot saved to artifact dir.');
})();
