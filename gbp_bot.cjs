const puppeteer = require('puppeteer-extra');
const StealthPlugin = require('puppeteer-extra-plugin-stealth');
puppeteer.use(StealthPlugin());

(async () => {
    console.log("Launching browser in background...");
    const browser = await puppeteer.launch({
        headless: "new",
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    const page = await browser.newPage();
    
    await page.setViewport({ width: 1280, height: 800 });
    
    console.log("Navigating to Google Login...");
    await page.goto('https://accounts.google.com/ServiceLogin');
    
    try {
        console.log("Entering email...");
        await page.waitForSelector('input[type="email"]');
        await page.type('input[type="email"]', 'gmkassia21@gmail.com', {delay: 50});
        await page.keyboard.press('Enter');
        
        console.log("Waiting for password field...");
        await page.waitForSelector('input[type="password"]', {visible: true, timeout: 10000});
        await page.type('input[type="password"]', 'Andrei209512!', {delay: 50});
        await page.keyboard.press('Enter');
        
        console.log("Waiting for login to complete...");
        await page.waitForNavigation({waitUntil: 'networkidle2', timeout: 15000});
        
        const url = page.url();
        if (url.includes('signin/v2/challenge') || url.includes('speedbump')) {
            console.log("2FA Challenge detected. Please approve on your phone...");
            await page.waitForNavigation({waitUntil: 'networkidle2', timeout: 60000});
        }
        
        console.log("Login successful! Navigating to Business Create...");
        await page.goto('https://business.google.com/create', {waitUntil: 'networkidle2'});
        
        console.log("Starting Step 1...");
        await page.waitForSelector('input[type="text"]');
        const inputs = await page.$$('input[type="text"]');
        await inputs[0].type('Kassia Events', {delay: 50});
        await page.waitForTimeout(1000);
        await page.keyboard.press('ArrowDown');
        await page.keyboard.press('Enter');
        
        await inputs[1].type("Children's party service", {delay: 50});
        await page.waitForTimeout(1000);
        await page.keyboard.press('ArrowDown');
        await page.keyboard.press('Enter');
        
        await page.evaluate(() => {
            const spans = document.querySelectorAll('span');
            for(let span of spans) {
                if(span.innerText && span.innerText.trim() === 'Înainte') {
                    span.closest('button').click();
                }
            }
        });
        
        console.log("Step 1 done. Waiting for Step 2...");
        await page.waitForTimeout(3000);
        
        await page.screenshot({path: '/Users/universparty/wa-web-launcher/kassia-site/gbp_state.png'});
        console.log("State saved to gbp_state.png");
        
    } catch (e) {
        console.error("Error during automation:", e);
        await page.screenshot({path: '/Users/universparty/wa-web-launcher/kassia-site/gbp_error.png'});
    }
    
    console.log("Keeping browser open for debugging...");
})();
