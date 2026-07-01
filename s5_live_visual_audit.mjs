import puppeteer from 'puppeteer';
import fs from 'fs';

const artifactDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227';
const competitors = [
    "https://superparty.ro/animatori-petreceri-copii/",
    "https://cool-events.ro/",
    "https://magicvalentino.ro/",
    "https://www.funevents.ro/animatori-copii/",
    "https://dizemanepe.ro/animatori-copii/",
    "https://yokidoki.ro/",
    "https://zoomzy.ro/",
    "https://kyp.ro/",
    "https://locdejoacatopolino.ro/",
    "https://play-caffe.ro/"
];
const s5Zones = ["rahova", "ferentari", "13 septembrie", "panduri", "cotroceni", "ghencea", "sebastian", "mărgeanului", "margeanului", "salaj", "sălaj", "izvor"];

async function run() {
    console.log("Launching Puppeteer for S5 LIVE VISUAL AUDIT...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 800 });
    
    for (let i = 0; i < competitors.length; i++) {
        const url = competitors[i];
        console.log(`\n-> Opening ${url}`);
        try {
            const resp = await page.goto(url, { waitUntil: 'networkidle2', timeout: 15000 });
            const status = resp ? resp.status() : 'Unknown';
            
            const data = await page.evaluate(() => {
                const title = document.title;
                const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText.trim() : 'NO H1';
                const metaDesc = document.querySelector('meta[name="description"]') ? document.querySelector('meta[name="description"]').content : '';
                const txt = document.body.innerText.toLowerCase();
                const wordCount = txt.split(/\s+/).length;
                const faqCount = document.querySelectorAll('.faq, .faq-item, details, [itemtype*="Question"]').length;
                const faqSchema = document.documentElement.innerHTML.includes('FAQPage');
                const cta = document.querySelector('button, .btn, .cta, a[href*="contact"], a[href*="pret"]') ? true : false;
                const contact = txt.includes('07') || document.documentElement.innerHTML.includes('whatsapp') ? true : false;
                const firstFold = document.body.innerText.substring(0, 500).replace(/\n/g, ' ');
                const hasReviews = txt.includes('review') || txt.includes('recenzii');
                return { title, h1, metaDesc, txt, wordCount, faqCount, faqSchema, cta, contact, firstFold, hasReviews };
            });
            
            const matchedZones = s5Zones.filter(z => data.txt.includes(z));
            const isLocal = matchedZones.length > 0 || data.title.toLowerCase().includes('sector 5') || data.h1.toLowerCase().includes('sector 5');
            
            console.log(`HTTP: ${status}`);
            console.log(`Title: ${data.title}`);
            console.log(`H1: ${data.h1}`);
            console.log(`First Fold Text (approx): ${data.firstFold}`);
            console.log(`Words: ~${data.wordCount} | FAQs: ${data.faqCount} | Schema: ${data.faqSchema}`);
            console.log(`S5 Zones Found: ${matchedZones.length > 0 ? matchedZones.join(', ') : 'NONE'}`);
            console.log(`S5 Dedicated: ${isLocal}`);
            console.log(`CTA: ${data.cta} | Contact: ${data.contact} | Reviews: ${data.hasReviews}`);
            
            const screenshotPath = `${artifactDir}/s5_competitor_${i+1}.png`;
            await page.screenshot({ path: screenshotPath });
            console.log(`Saved screenshot: s5_competitor_${i+1}.png`);
            
        } catch(e) {
            console.log(`Failed to inspect ${url}: ${e.message}`);
        }
    }
    
    await browser.close();
    console.log("\nDone live visual inspection.");
}
run();
