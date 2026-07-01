import puppeteer from 'puppeteer';
import google from 'googlethis';
import fs from 'fs';

const queries = [
    "animatori petreceri copii București",
    "animatori copii București",
    "animatori petreceri copii Ilfov",
    "animatori copii București și Ilfov"
];

// Focus on actual competitors, avoid big directories if possible, but we'll list them to show exactly top 10
const ignoreDomains = ['facebook.com', 'instagram.com', 'youtube.com', 'tiktok.com'];

async function getSerp(query) {
    console.log(`[SERP] Fetching: ${query}`);
    try {
        const options = { page: 0, safe: false, parse_ads: false, additional_params: { hl: 'ro', gl: 'ro' } };
        const response = await google.search(query, options);
        let results = [];
        let pos = 1;
        if (response && response.results) {
            for (const r of response.results) {
                const u = new URL(r.url);
                const domain = u.hostname.replace('www.', '');
                if (!ignoreDomains.includes(domain)) {
                    results.push({ pos: pos++, url: r.url });
                    if (results.length >= 10) break;
                }
            }
        }
        return results;
    } catch (e) {
        console.error(`Error searching ${query}:`, e.message);
        return [];
    }
}

async function analyzeUrl(url, page) {
    let data = { 
        url, 
        title: 'N/A', 
        h1: 'NO H1 FOUND', 
        text: '', 
        pricing: 'NO', 
        faq: 'NO', 
        reviews: 'NO', 
        edu: 'NO', 
        portofoliu: 'NO', 
        cta: 'UNCLEAR' 
    };
    
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
        
    } catch (e) {
        // failed to load or timeout
    }
    return data;
}

async function run() {
    console.log("🚀 Starting Comprehensive Benchmark API-ASSISTED...");
    
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    
    const finalReport = {};

    for (const q of queries) {
        const serp = await getSerp(q);
        finalReport[q] = [];
        
        console.log(`\n=== Query: ${q} ===`);
        for (const item of serp) {
            console.log(`Analyzing Pos ${item.pos}: ${item.url}`);
            const analysis = await analyzeUrl(item.url, page);
            
            finalReport[q].push({
                sursa: "API-assisted",
                order: item.pos,
                url: analysis.url,
                title: analysis.title,
                h1: analysis.h1,
                pricing: analysis.pricing,
                faq: analysis.faq,
                reviews: analysis.reviews,
                edu: analysis.edu,
                portofoliu: analysis.portofoliu,
                cta: analysis.cta,
                unde_competitor_mai_bun: analysis.portofoliu === 'YES' ? "Varietate vizuală mascote (dacă aplicabil)" : "N/A",
                unde_kassia_mai_buna: analysis.edu === 'NO' ? "Structură educativă superioară (Ce evităm, Scenarii)" : "Onestitate și ghidaj client"
            });
        }
    }
    
    await browser.close();
    
    fs.writeFileSync('comprehensive_benchmark_report.json', JSON.stringify(finalReport, null, 2));
    console.log("✅ Benchmark script finished. Report saved to comprehensive_benchmark_report.json");
}

run().catch(console.error);
