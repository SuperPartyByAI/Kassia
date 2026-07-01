import puppeteer from 'puppeteer';
async function run() {
    const browser = await puppeteer.launch({ headless: 'new', args: ['--no-sandbox'] });
    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 800 });
    await page.goto("https://www.google.ro/search?q=animatori+sector+1", { waitUntil: 'networkidle2' });
    await page.screenshot({ path: 'google_test.png' });
    await browser.close();
}
run();
