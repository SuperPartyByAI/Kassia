import puppeteer from 'puppeteer';

async function run() {
    console.log("Launching Chrome to trigger Mac permissions prompt...");
    // Use headless: false so the user can see the browser and interact with any prompts
    const browser = await puppeteer.launch({ headless: false, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    await p.goto('https://search.google.com/search-console', { waitUntil: 'networkidle2' });
    console.log("Chrome launched. Please accept any permission prompts on your Mac.");
    console.log("Waiting 30 seconds for you to accept...");
    await new Promise(r => setTimeout(r, 30000));
    await browser.close();
    console.log("Done.");
}

run().catch(console.error);
