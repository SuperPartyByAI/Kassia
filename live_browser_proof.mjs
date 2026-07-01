import puppeteer from 'puppeteer';
import fs from 'fs';

const artifactDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227';
const zones = ["vitan", "dristor", "titan", "balta albă", "balta alba", "sălăjan", "salajan"];

async function run() {
    console.log("Launching Puppeteer browser...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 800 });
    
    const competitors = [
        "https://superparty.ro/animatori-petreceri-copii/",
        "https://cool-events.ro/",
        "https://www.funevents.ro/animatori-copii/",
        "https://eziuamea.ro/",
        "https://yokidoki.ro/"
    ];
    
    console.log("Visiting Top 5 Live Competitors for Visual Inspection...\n");
    
    for (let i = 0; i < competitors.length; i++) {
        const url = competitors[i];
        console.log(`\n-> Opening ${url}`);
        try {
            await page.goto(url, { waitUntil: 'networkidle2', timeout: 15000 });
            const title = await page.title();
            const h1 = await page.evaluate(() => {
                const h1el = document.querySelector('h1');
                return h1el ? h1el.innerText.trim() : 'NO H1 FOUND';
            });
            const text = await page.evaluate(() => document.body.innerText.toLowerCase());
            
            const matchedZones = zones.filter(z => text.includes(z));
            const hasFAQ = text.includes('intrebari frecvente') || text.includes('faq') || text.includes('întrebări frecvente');
            
            console.log(`Title: ${title}`);
            console.log(`Visual H1: ${h1}`);
            console.log(`Sector 3 Zones Found: ${matchedZones.length > 0 ? matchedZones.join(', ') : 'NONE'}`);
            console.log(`FAQ Section Detected Visually: ${hasFAQ ? 'YES' : 'NO'}`);
            
            const screenshotPath = `${artifactDir}/competitor_${i+1}_screenshot.png`;
            await page.screenshot({ path: screenshotPath });
            console.log(`Saved screenshot as proof: competitor_${i+1}_screenshot.png`);
            
        } catch(e) {
            console.log(`Failed to load ${url}: ${e.message}`);
        }
    }
    
    await browser.close();
    console.log("\nDone visual inspection.");
}

run();
