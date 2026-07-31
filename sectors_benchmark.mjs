import puppeteer from 'puppeteer';
import fs from 'fs';
import path from 'path';

const BACKUP_DIR = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch';

if (!fs.existsSync(BACKUP_DIR)) {
    fs.mkdirSync(BACKUP_DIR, { recursive: true });
}

async function run() {
    console.log("Launching Puppeteer...");
    const browser = await puppeteer.launch({ headless: "new", args: ['--no-sandbox', '--disable-setuid-sandbox', '--window-size=1280,800'] });
    
    let fullAnalysis = {};

    for (let s = 1; s <= 6; s++) {
        console.log(`\n=== Analyzing Sector ${s} ===`);
        const page = await browser.newPage();
        await page.setViewport({ width: 1280, height: 800 });

        try {
            console.log(`Searching Google for Sector ${s}...`);
            await page.goto(`https://www.google.ro/search?q=animatori+petreceri+copii+sector+${s}&hl=ro`, { waitUntil: 'networkidle2' });
            
            // Accept cookies if present
            try {
                const acceptBtn = await page.$('button#L2AGLb');
                if (acceptBtn) {
                    await acceptBtn.click();
                    await page.waitForTimeout(1000);
                }
            } catch(e) {}

            // Extract organic results
            const results = await page.evaluate(() => {
                const items = document.querySelectorAll('div.g');
                const links = [];
                items.forEach((item, index) => {
                    const a = item.querySelector('a');
                    if (a && a.href && !a.href.includes('google.com') && !a.href.includes('translate.google')) {
                        links.push({
                            url: a.href,
                            title: item.querySelector('h3') ? item.querySelector('h3').innerText : '',
                            position: index + 1
                        });
                    }
                });
                return links.slice(0, 10);
            });

            console.log(`Top 10 URLs found for Sector ${s}:`);
            console.log(results.map(r => r.url));

            let analysis = [];

            for (let i = 0; i < results.length; i++) {
                const r = results[i];
                console.log(`Analyzing ${r.position}: ${r.url}`);
                
                let status = 'UNKNOWN';
                let pageData = {
                    url: r.url,
                    title: r.title,
                    h1: '',
                    hasSectorKeyword: false,
                    hasPrices: false,
                    hasFaq: false,
                    hasFaqSchema: false,
                    hasImages: false,
                    hasReviews: false,
                    hasCTA: false
                };

                try {
                    const response = await page.goto(r.url, { waitUntil: 'networkidle2', timeout: 15000 });
                    if (response && response.ok()) {
                        status = 'PASS';
                        
                        pageData = await page.evaluate((url, sector) => {
                            const text = document.body.innerText.toLowerCase();
                            const html = document.documentElement.innerHTML.toLowerCase();
                            
                            const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText.trim() : '';
                            
                            const hasSectorKeyword = url.includes(`sector-${sector}`) || url.includes(`sector${sector}`) || text.includes(`sector ${sector}`) || text.includes(`sectorul ${sector}`);
                            const hasPrices = !!text.match(/\d{2,3}\s*(lei|ron|euro)/i);
                            const hasFaq = text.includes('întrebări frecvente') || text.includes('intrebari frecvente') || text.includes('faq');
                            const hasFaqSchema = html.includes('@type":"faqpage') || html.includes('"@type": "faqpage');
                            
                            const hasImages = document.querySelectorAll('img').length > 2;
                            const hasReviews = text.includes('review') || text.includes('păreri') || text.includes('pareri') || html.includes('trustpilot') || html.includes('google');
                            const hasCTA = document.querySelectorAll('a, button').length > 5; // rudimentary check
                            
                            return {
                                url, title: document.title, h1, hasSectorKeyword, hasPrices, hasFaq, hasFaqSchema, hasImages, hasReviews, hasCTA
                            };
                        }, r.url, s);
                    } else {
                        status = 'BLOCKED_OR_ERROR';
                    }
                } catch (e) {
                    status = 'TIMEOUT_OR_BLOCKED';
                }
                
                analysis.push({
                    position: r.position,
                    status: status,
                    data: pageData
                });
            }

            fullAnalysis[`sector_${s}`] = analysis;
            
        } catch (e) {
            console.error(`Script failed for Sector ${s}:`, e);
        } finally {
            await page.close();
        }
    }

    fs.writeFileSync(path.join(BACKUP_DIR, 'all_sectors_analysis.json'), JSON.stringify(fullAnalysis, null, 2));
    console.log("=== FINAL ANALYSIS SAVED ===");
    await browser.close();
    console.log("Browser closed.");
}
run();
