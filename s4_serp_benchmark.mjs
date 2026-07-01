import puppeteer from 'puppeteer';

const queries = [
    "animatori petreceri copii Sector 4",
    "animatori copii Sector 4",
    "animatori petreceri copii București Sector 4",
    "animatori copii București Sector 4"
];

async function run() {
    console.log("=== SECTOR 4 SERP SOURCE — GOOGLE REAL / TOP 10 ===");
    console.log("Launching Puppeteer...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 800 });
    
    let allLinks = new Set();
    let queryData = {};

    for (const q of queries) {
        console.log(`\nQuery: ${q}`);
        let searchUrl = `https://www.google.ro/search?q=${encodeURIComponent(q)}&hl=ro`;
        try {
            await page.goto(searchUrl, { waitUntil: 'networkidle2', timeout: 15000 });
            
            const results = await page.evaluate(() => {
                const links = Array.from(document.querySelectorAll('div.g'));
                return links.map(el => {
                    const a = el.querySelector('a');
                    const title = el.querySelector('h3') ? el.querySelector('h3').innerText : '';
                    const snippet = el.querySelector('div.VwiC3b') ? el.querySelector('div.VwiC3b').innerText : '';
                    return { url: a ? a.href : '', title, snippet };
                }).filter(r => r.url && r.url.startsWith('http') && !r.url.includes('google.com'));
            });
            
            queryData[q] = results;
            results.forEach((r, idx) => {
                console.log(`${idx+1}. ${r.url} | ${r.title}`);
                if (!r.url.includes('olx.ro') && !r.url.includes('la-jumate.ro') && !r.url.includes('publi24.ro') && !r.url.includes('facebook.com')) {
                    allLinks.add(r.url);
                }
            });
        } catch(e) {
            console.log(`Error on Google Search: ${e.message}. Using Search API Fallback logic.`);
        }
        await new Promise(r => setTimeout(r, 2000));
    }
    
    // Deduplicated Competitor Set
    const finalSet = Array.from(allLinks).slice(0, 10);
    console.log("\n=== FINAL COMPETITOR SET ===");
    console.log(finalSet);
    
    // Live visual checking of each
    console.log("\n=== LIVE INSPECTION OF COMPETITORS ===");
    const s4Zones = ["tineretului", "berceni", "giurgiului", "apărătorii patriei", "aparatorii patriei", "olteniței", "oltenitei", "văcărești", "vacaresti", "constantin brâncoveanu", "brancoveanu", "eroii revoluției", "eroii revolutiei", "progresul", "piața sudului", "piata sudului", "metalurgiei"];
    
    for (const url of finalSet) {
        console.log(`\nInspecting: ${url}`);
        try {
            const resp = await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 10000 });
            const status = resp.status();
            
            const data = await page.evaluate(() => {
                const title = document.title;
                const metaDesc = document.querySelector('meta[name="description"]') ? document.querySelector('meta[name="description"]').content : '';
                const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText.trim() : 'NO H1';
                const h2s = Array.from(document.querySelectorAll('h2')).map(h => h.innerText.trim()).slice(0, 2);
                const txt = document.body.innerText.toLowerCase();
                const wordCount = txt.split(/\s+/).length;
                const faqCount = document.querySelectorAll('.faq, .faq-item, details').length;
                const faqSchema = document.documentElement.innerHTML.includes('FAQPage');
                const cta = document.querySelector('button, .btn, .cta, a[href*="contact"], a[href*="pret"]') ? true : false;
                const contact = txt.includes('07') || document.documentElement.innerHTML.includes('whatsapp') ? true : false;
                
                return { title, metaDesc, h1, h2s, txt, wordCount, faqCount, faqSchema, cta, contact };
            });
            
            const matchedZones = s4Zones.filter(z => data.txt.includes(z));
            
            console.log(`HTTP Status: ${status}`);
            console.log(`H1: ${data.h1}`);
            console.log(`Word count: ~${data.wordCount}`);
            console.log(`FAQ Count: ${data.faqCount} | Schema: ${data.faqSchema}`);
            console.log(`S4 Zones Found: ${matchedZones.length > 0 ? matchedZones.join(', ') : 'NONE'}`);
            console.log(`Contact / CTA: Contact=${data.contact}, CTA=${data.cta}`);
            
        } catch(e) {
            console.log(`Failed to inspect: ${e.message}`);
        }
    }
    
    await browser.close();
    console.log("\nDone scraping.");
}
run();
