const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch({ headless: "new", args: ['--no-sandbox'] });
    const page = await browser.newPage();
    
    await page.goto('https://www.kassia.ro/?v=' + Date.now(), { waitUntil: 'networkidle2' });
    await page.click('.gss-trigger');
    await page.waitForSelector('#global-service-search-overlay.open', { timeout: 5000 });
    
    await page.type('#gss-search-input', 'balooane');
    await new Promise(r => setTimeout(r, 1000)); // wait a full second
    
    const visible = await page.evaluate(() => {
        const cards = Array.from(document.querySelectorAll('.gss-card'));
        return cards.map(c => ({
            title: c.getAttribute('data-title'),
            display: c.style.display
        }));
    });
    
    console.log(JSON.stringify(visible, null, 2));
    
    await browser.close();
})();
