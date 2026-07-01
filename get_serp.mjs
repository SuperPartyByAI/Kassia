import puppeteer from 'puppeteer-extra';
import StealthPlugin from 'puppeteer-extra-plugin-stealth';
import path from 'path';
import fs from 'fs';

puppeteer.use(StealthPlugin());

const BACKUP_DIR = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2';

async function run() {
    console.log("Starting stealth browser...");
    const browser = await puppeteer.launch({ 
        headless: 'new',
        args: ['--no-sandbox', '--disable-setuid-sandbox'] 
    });
    const page = await browser.newPage();
    await page.setViewport({ width: 1440, height: 900 });

    try {
        console.log("Navigating to Google Romania...");
        await page.goto('https://www.google.ro/', { waitUntil: 'networkidle2' });
        
        try {
            await page.waitForSelector('button#L2AGLb', { timeout: 3000 });
            await page.click('button#L2AGLb');
            await page.waitForNavigation({ waitUntil: 'networkidle2' });
        } catch (e) {
            console.log("No cookie consent found or clicked already.");
        }

        console.log("Typing query...");
        await page.waitForSelector('textarea[name="q"], input[name="q"]');
        await page.type('textarea[name="q"], input[name="q"]', 'organizare petreceri copii București');
        await page.keyboard.press('Enter');
        
        await page.waitForNavigation({ waitUntil: 'networkidle2' });
        
        console.log("Taking SERP screenshots...");
        await page.screenshot({ path: path.join(BACKUP_DIR, 'serp_real_1.png') });
        await page.evaluate(() => window.scrollBy(0, 800));
        await new Promise(r => setTimeout(r, 1000));
        await page.screenshot({ path: path.join(BACKUP_DIR, 'serp_real_2.png') });

        // Extract organic URLs
        const results = await page.evaluate(() => {
            const resultBlocks = document.querySelectorAll('div.g');
            const urls = [];
            const localPack = document.querySelector('.VkpGBb') || document.querySelector('.rllt__link');
            
            resultBlocks.forEach(block => {
                if(block.closest('.Wt5Tfe')) return; 
                if(block.querySelector('.v5yQqb')) return; 
                
                const link = block.querySelector('a');
                const title = block.querySelector('h3');
                if (link && link.href && title && title.innerText && title.innerText !== "") {
                    if (!link.href.includes('google.') && !link.href.includes('/search?')) {
                        if (!urls.find(u => u.url === link.href)) {
                            urls.push({
                                title: title.innerText.trim(),
                                url: link.href
                            });
                        }
                    }
                }
            });
            
            return {
                localPack: !!localPack,
                organic: urls.slice(0, 10)
            };
        });

        console.log("\nTop 10 Organic URLs:");
        results.organic.forEach((r, i) => {
            console.log(`${i + 1}. URL: ${r.url} | Title: ${r.title}`);
        });

        fs.writeFileSync('top10_urls.json', JSON.stringify(results, null, 2));

    } catch (e) {
        console.error("Error during scraping:", e);
    } finally {
        await browser.close();
    }
}

run();
