import puppeteer from 'puppeteer';
async function run() {
    const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    await page.goto("https://www.google.ro/search?q=animatori+sector+1", { waitUntil: 'networkidle2' });
    
    // Accept cookies if present
    try {
        await page.evaluate(() => {
            const btns = Array.from(document.querySelectorAll('button'));
            const acceptBtn = btns.find(b => b.innerText.includes('Accept') || b.innerText.includes('De acord'));
            if (acceptBtn) acceptBtn.click();
        });
        await new Promise(r => setTimeout(r, 2000));
    } catch(e) {}

    const html = await page.content();
    console.log("div.g count:", html.split('div class="g"').length - 1);
    console.log("search block count:", html.split('id="search"').length - 1);
    
    await browser.close();
}
run();
