import { search } from 'duck-duck-scrape';
import puppeteer from 'puppeteer';
import fs from 'fs';

const queries = [
    "animatori petreceri copii București",
    "animatori copii București",
    "animatori petreceri copii Ilfov",
    "animatori copii București și Ilfov"
];

const ignoreDomains = ['olx.ro', 'emag.ro', 'facebook.com', 'instagram.com', 'youtube.com', 'tiktok.com', 'kassia.ro'];

async function getSerp(query) {
    console.log(`[SERP] Fetching DDG: ${query}`);
    try {
        const results = await search(query, { safeSearch: search.SafeSearchType.STRICT, region: 'ro-ro' });
        let filtered = [];
        let p = 1;
        for (const r of results.results) {
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
    console.log("🚀 Starting DDG SERP Benchmark API-ASSISTED...");
    
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
                sursa: "API-assisted (DDG)",
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
                unde_competitor_mai_bun: analysis.portofoliu === 'YES' ? "Varietate vizuală mascote afișată" : "N/A",
                unde_kassia_mai_buna: analysis.edu === 'NO' ? "Structură educativă superioară (Ce evităm, Scenarii)" : "Onestitate și ghidaj client"
            });
        }
    }
    
    await browser.close();
    fs.writeFileSync('comprehensive_benchmark_report.json', JSON.stringify(finalReport, null, 2));
    console.log("✅ Benchmark script finished.");
}

run().catch(console.error);
