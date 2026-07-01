import puppeteer from 'puppeteer';
import fs from 'fs';
import path from 'path';

const BACKUP_DIR = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2';

const competitors = [
    { name: 'Dizemanepe', paths: ['/animatori-petreceri-copii-sector-2/', '/'] },
    { name: 'Cool-Events', paths: ['/animatori-petreceri-copii-sector-2/', '/pachete-animatori/'] },
    { name: 'SuperParty', paths: ['/animatori-petreceri-copii-sector-2/', '/'] },
    { name: 'AnimatoriVeseli', paths: ['/animatori-petreceri-copii-sector-2/', '/'] },
    { name: 'EnjoyParty', paths: ['/animatori-petreceri-copii-sector-2/', '/'] },
    { name: 'MagicValentino', paths: ['/animatori-petreceri-copii-sector-2/', '/'] },
    { name: 'GalaxyFun', paths: ['/animatori-petreceri-copii-sector-2/', '/'] },
    { name: 'AnimatieCopii', paths: ['/animatori-petreceri-copii-sector-2/', '/'] },
    { name: 'FunEvents', paths: ['/animatori-petreceri-copii-sector-2/', '/'] }
];

async function run() {
    const browser = await puppeteer.launch({ headless: "new", args: ['--no-sandbox', '--disable-setuid-sandbox', '--window-size=1280,800'] });
    let analysis = [];
    
    for (let i = 0; i < competitors.length; i++) {
        const c = competitors[i];
        const page = await browser.newPage();
        await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36');
        
        let foundData = null;
        for (const p of c.paths) {
            const url = `https://${c.name.toLowerCase()}.ro${p}`;
            try {
                const response = await page.goto(url, { waitUntil: 'networkidle2', timeout: 15000 });
                const title = await page.title();
                if (response && response.status() !== 404 && !title.toLowerCase().includes('not found') && !title.toLowerCase().includes('404')) {
                    await page.screenshot({ path: path.join(BACKUP_DIR, `serp_comp_${c.name}.png`) });
                    
                    foundData = await page.evaluate((url) => {
                        const text = document.body.innerText.toLowerCase();
                        const html = document.documentElement.innerHTML.toLowerCase();
                        const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText.trim() : '';
                        const isSector2Dedicated = url.includes('sector-2') || text.includes('sector 2') || text.includes('sectorul 2');
                        const hasPrices = !!text.match(/\d{2,3}\s*(lei|ron|euro)/i);
                        const hasFaq = text.includes('întrebări frecvente') || text.includes('intrebari frecvente') || text.includes('faq');
                        const hasFaqSchema = html.includes('faqpage');
                        const areas = ['colentina', 'obor', 'pantelimon', 'iancului', 'fundeni', 'mosilor', 'baicului', 'doamna ghica', 'tei'];
                        const localAreasList = areas.filter(a => text.includes(a));
                        const hasReviews = text.includes('review') || text.includes('păreri') || html.includes('google');
                        const hasCTA = document.querySelectorAll('a, button').length > 5;
                        return { url, h1, isSector2Dedicated, hasPrices, hasFaq, hasFaqSchema, hasLocalAreas: localAreasList.length > 0, localAreasList, hasReviews, hasCTA };
                    }, url);
                    break; // Stop trying paths if we got a valid page
                }
            } catch (e) { } // Ignore timeout and try next
        }
        if (foundData) analysis.push({ name: c.name, status: 'PASS', data: foundData });
        else analysis.push({ name: c.name, status: 'UNKNOWN/BLOCKED' });
        
        await page.close();
    }
    
    await browser.close();
    console.log(JSON.stringify(analysis, null, 2));
}
run().catch(console.error);
