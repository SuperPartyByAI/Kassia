const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 800 });
    await page.goto('https://www.kassia.ro/animatori-petreceri-copii-sector-6/', { waitUntil: 'networkidle2' });
    await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/audit_s6_desktop.png', fullPage: true });
    await page.setViewport({ width: 375, height: 812 });
    await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/audit_s6_mobile.png', fullPage: true });
    
    // Evaluate images
    const images = await page.evaluate(() => {
        return Array.from(document.querySelectorAll('img')).map(img => {
            return {
                src: img.src,
                alt: img.alt,
                naturalWidth: img.naturalWidth,
                naturalHeight: img.naturalHeight
            };
        });
    });
    console.log(JSON.stringify(images, null, 2));
    
    await browser.close();
})();
