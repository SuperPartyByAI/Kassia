import puppeteer from 'puppeteer-extra';
import StealthPlugin from 'puppeteer-extra-plugin-stealth';
import fs from 'fs';
import path from 'path';

puppeteer.use(StealthPlugin());

const urls = [
    "https://enjoyparty.ro/organizare-petreceri-copii/",
    "https://dizemanepe.ro/",
    "https://www.clownparty.ro/",
    "https://eziuamea.ro/",
    "https://www.animatorpetrecericopii.ro/",
    "https://www.mimakids.ro/",
    "https://www.kyp.ro/",
    "https://enjoyparty.ro/",
    "https://gokid.ro/locuri-de-petreceri-in-aer-liber-pentru-copii-bucuresti-si-imprejurimi/",
    "https://domeniilesaftica.ro/evenimente/evenimente-private/organizare-petreceri-copii/"
];

async function run() {
    console.log("Starting analysis of 10 competitors...");
    const browser = await puppeteer.launch({ 
        headless: 'new',
        args: ['--no-sandbox', '--disable-setuid-sandbox'] 
    });
    
    let results = [];
    
    for (let i = 0; i < urls.length; i++) {
        const url = urls[i];
        console.log(`\nAnalyzing [${i+1}/10]: ${url}`);
        
        const page = await browser.newPage();
        await page.setViewport({ width: 1440, height: 900 });
        
        let status = null;
        let finalUrl = url;
        
        try {
            const response = await page.goto(url, { waitUntil: 'networkidle2', timeout: 20000 });
            status = response ? response.status() : 'Unknown';
            finalUrl = page.url();
            
            // extract data
            const data = await page.evaluate(() => {
                const title = document.title;
                const metaDescEl = document.querySelector('meta[name="description"]');
                const metaDesc = metaDescEl ? metaDescEl.content : '';
                const canonicalEl = document.querySelector('link[rel="canonical"]');
                const canonical = canonicalEl ? canonicalEl.href : '';
                const robotsEl = document.querySelector('meta[name="robots"]');
                const robots = robotsEl ? robotsEl.content : '';
                
                const h1El = document.querySelector('h1');
                const h1 = h1El ? h1El.innerText.trim() : 'NO H1';
                
                const h2Els = Array.from(document.querySelectorAll('h2')).map(el => el.innerText.trim()).filter(t => t);
                const h3Els = Array.from(document.querySelectorAll('h3')).map(el => el.innerText.trim()).filter(t => t);
                
                const bodyText = document.body.innerText || '';
                const wordCount = bodyText.split(/\s+/).length;
                
                const faqCount = document.querySelectorAll('.faq, .elementor-toggle-item, .accordion, details, [itemtype*="Question"]').length;
                const hasSchema = document.documentElement.innerHTML.includes('schema.org');
                const hasFaqSchema = document.documentElement.innerHTML.includes('FAQPage');
                
                const hasPrices = bodyText.includes('lei') || bodyText.includes('RON') || bodyText.includes('pret');
                const ctaCount = document.querySelectorAll('button, .btn, .cta, a[href*="contact"], a[href*="pret"], a[href^="tel:"], a[href^="mailto:"]').length;
                
                const imagesCount = document.querySelectorAll('img').length;
                const hasReviews = bodyText.toLowerCase().includes('recenzii') || bodyText.toLowerCase().includes('pareri') || document.documentElement.innerHTML.includes('Rating');
                
                return {
                    title, metaDesc, canonical, robots, h1, 
                    h2Count: h2Els.length, h3Count: h3Els.length,
                    wordCount, faqCount, hasSchema, hasFaqSchema, hasPrices, ctaCount, imagesCount, hasReviews
                };
            });
            
            results.push({
                url: url,
                finalUrl: finalUrl,
                status: status,
                ...data
            });
            console.log(`HTTP ${status} | H1: ${data.h1} | Words: ~${data.wordCount}`);
            
        } catch (e) {
            console.error("Error analyzing URL:", e.message);
            results.push({ url, status: 'Error', error: e.message });
        } finally {
            await page.close();
        }
    }
    
    await browser.close();
    
    fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/kassia_top10_analysis.json', JSON.stringify(results, null, 2));
    console.log("Done.");
}

run();
