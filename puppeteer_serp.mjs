import puppeteer from 'puppeteer';
import fs from 'fs';

const queries = [
    "animatori petreceri copii București",
    "animatori copii București",
    "animatori petreceri copii Ilfov",
    "animatori copii București și Ilfov"
];

const ignoreDomains = ['olx.ro', 'emag.ro', 'facebook.com', 'instagram.com', 'youtube.com', 'tiktok.com'];

async function getSerp(query, page) {
    console.log(`[SERP] Fetching: ${query}`);
    try {
        await page.goto(`https://www.google.com/search?q=${encodeURIComponent(query)}&hl=ro&gl=ro`, { waitUntil: 'domcontentloaded', timeout: 15000 });
        
        // click accept cookies if present
        try {
            await page.evaluate(() => {
                const buttons = Array.from(document.querySelectorAll('button'));
                const acceptBtn = buttons.find(b => b.innerText.toLowerCase().includes('accept'));
                if(acceptBtn) acceptBtn.click();
            });
            await new Promise(r => setTimeout(r, 1000));
        } catch(e) {}
        
        const results = await page.evaluate(() => {
            const items = Array.from(document.querySelectorAll('#search .g'));
            return items.map((item, index) => {
                const a = item.querySelector('a');
                return { pos: index + 1, url: a ? a.href : null };
            }).filter(i => i.url && i.url.startsWith('http'));
        });
        
        let filtered = [];
        let p = 1;
        for (const r of results) {
            try {
                const u = new URL(r.url);
                const domain = u.hostname.replace('www.', '');
                if (!ignoreDomains.includes(domain)) {
                    filtered.push({ pos: p++, url: r.url });
                    if(filtered.length >= 10) break;
                }
            } catch(e) {}
        }
        return filtered;
    } catch (e) {
        console.error(`Error searching ${query}:`, e.message);
        return [];
    }
}

async function analyzeUrl(url, page) {
    let data = { url, title: 'N/A', h1: 'NO H1 FOUND', pricing: 'NO', faq: 'NO', reviews: 'NO', edu: 'NO', portofoliu: 'NO', cta: 'UNCLEAR' };
    try {
        await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 10000 });
        data.title = await page.title();
        data.h1 = await page.evaluate(() => {
            const h1el = document.querySelector('h1');
            return h1el ? h1el.innerText.trim().replace(/\n/g, ' ') : 'NO H1 FOUND';
        });
        const t = await page.evaluate(() => document.body.innerText.toLowerCase());
        
        data.pricing = (t.includes('lei') || t.includes('pret') || t.includes('preț') || t.includes('ron')) ? 'YES' : 'NO';
        data.faq = (t.includes('faq') || t.includes('întrebări') || t.includes('intrebari')) ? 'YES' : 'NO';
        data.reviews = (t.includes('recenzii') || t.includes('pareri') || data.title.toLowerCase().includes('recenzii')) ? 'YES' : 'NO';
        data.edu = (t.includes('evitam') || t.includes('decurge') || t.includes('recomandăm') || t.includes('sfaturi')) ? 'YES' : 'NO';
        data.portofoliu = (t.includes('personaj') || t.includes('mascot') || t.includes('eroi') || t.includes('portofoliu')) ? 'YES' : 'NO';
        data.cta = (t.includes('rezerv') || t.includes('contact') || t.includes('suna') || t.includes('whatsapp')) ? 'YES (Clear)' : 'UNCLEAR';
    } catch (e) {}
    return data;
}

async function run() {
    console.log("🚀 Starting Puppeteer SERP Benchmark API-ASSISTED...");
    
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    const analyzePage = await browser.newPage();
    
    const finalReport = {};

    for (const q of queries) {
        const serp = await getSerp(q, page);
        finalReport[q] = [];
        console.log(`\n=== Query: ${q} ===`);
        for (const item of serp) {
            console.log(`Analyzing Pos ${item.pos}: ${item.url}`);
            const analysis = await analyzeUrl(item.url, analyzePage);
            
            finalReport[q].push({
                sursa: "API-assisted / Puppeteer Scrape",
                order: item.pos,
                url: analysis.url,
                title: analysis.title,
                h1: analysis.h1,
                pricing_visible: analysis.pricing,
                faq: analysis.faq,
                reviews_social_proof: analysis.reviews,
                structura_educativa: analysis.edu,
                personaje_portofoliu: analysis.portofoliu,
                cta_clarity: analysis.cta,
                unde_competitor_mai_bun: analysis.portofoliu === 'YES' ? "Varietate vizuală mascote (posibilă)" : "N/A",
                unde_kassia_mai_buna: analysis.edu === 'NO' ? "Structură educativă superioară (Ce evităm, Scenarii)" : "Onestitate și ghidaj client"
            });
        }
    }
    
    await browser.close();
    fs.writeFileSync('comprehensive_benchmark_report.json', JSON.stringify(finalReport, null, 2));
    console.log("✅ Benchmark script finished.");
}

run().catch(console.error);
