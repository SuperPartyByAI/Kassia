import puppeteer from 'puppeteer';

async function run() {
    const browser = await puppeteer.launch({ headless: false, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    try {
        console.log("Navigating to GSC...");
        await p.goto('https://search.google.com/search-console', { waitUntil: 'networkidle2' });
        
        // Wait for user to intervene if login is needed
        console.log("Waiting 30 seconds for manual login if required...");
        await new Promise(r => setTimeout(r, 30000));

        // Let's see what's on the screen
        const url = p.url();
        console.log("Current URL after 30s: " + url);
        
        // If not logged in, we can't proceed. 
        // We could just stop here.
    } catch(e) {
        console.error(e);
    }
    
    // await browser.close();
}

run().catch(console.error);
