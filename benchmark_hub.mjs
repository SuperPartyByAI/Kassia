import puppeteer from 'puppeteer';
import google from 'googlethis';
import fs from 'fs';

const queries = [
    "animatori petreceri copii București",
    "animatori copii București",
    "animatori petreceri copii Ilfov",
    "animatori copii București și Ilfov"
];

// Domains to ignore (directories, generic sites)
const ignoreDomains = ['olx.ro', 'emag.ro', 'facebook.com', 'instagram.com', 'tiktok.com', 'youtube.com', 'kassia.ro'];

async function getTopCompetitors() {
    let allUrls = [];
    for (const q of queries) {
        console.log(`[SERP] Searching for: ${q}`);
        try {
            const options = { page: 0, safe: false, parse_ads: false, additional_params: { hl: 'ro', gl: 'ro' } };
            const response = await google.search(q, options);
            if (response && response.results) {
                response.results.forEach(r => allUrls.push(r.url));
            }
        } catch (e) {
            console.error(`Error searching ${q}:`, e.message);
        }
        await new Promise(r => setTimeout(r, 1000));
    }
    
    // Filter and unique
    const uniqueCompetitors = [];
    const seenDomains = new Set();
    for (const url of allUrls) {
        try {
            const u = new URL(url);
            const domain = u.hostname.replace('www.', '');
            if (!ignoreDomains.includes(domain) && !seenDomains.has(domain)) {
                seenDomains.add(domain);
                uniqueCompetitors.push(url);
            }
        } catch(e) {}
    }
    
    // Take top 8 unique to keep it manageable
    return uniqueCompetitors.slice(0, 8);
}

async function runBenchmark() {
    console.log("🚀 Starting Competitor Benchmark API-ASSISTED...");
    const competitors = await getTopCompetitors();
    console.log(`Found ${competitors.length} unique top competitors.`);
    
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    
    const results = [];
    
    for (const url of competitors) {
        console.log(`-> Inspecting: ${url}`);
        let data = { url, title: '', h1: '', text: '' };
        try {
            await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 15000 });
            data.title = await page.title();
            data.h1 = await page.evaluate(() => {
                const h1el = document.querySelector('h1');
                return h1el ? h1el.innerText.trim().replace(/\n/g, ' ') : 'NO H1 FOUND';
            });
            data.text = await page.evaluate(() => document.body.innerText.toLowerCase());
        } catch (e) {
            console.log(`   Failed to fully load: ${e.message}`);
        }
        
        // Analyze text
        const t = data.text;
        const pricingVisible = t.includes('lei') || t.includes('pret') || t.includes('preț') || t.includes('ron');
        const faq = t.includes('faq') || t.includes('întrebări frecvente') || t.includes('intrebari frecvente');
        const reviews = t.includes('recenzii') || t.includes('pareri') || document.querySelector('.reviews');
        // educated structure -> do they have advice?
        const edu = t.includes('evitam') || t.includes('evităm') || t.includes('decurge programul') || t.includes('recomandăm') || t.includes('sfaturi');
        const mascote = t.includes('personaje') || t.includes('mascote') || t.includes('eroi');
        const cta = (t.includes('rezerv') || t.includes('contact') || t.includes('suna') || t.includes('whatsapp')) ? 'YES (Clear)' : 'UNCLEAR';
        
        results.push({
            URL: data.url,
            "Title/H1": `${data.title} / ${data.h1}`,
            "Pricing visible": pricingVisible ? "YES" : "NO",
            "FAQ": faq ? "YES" : "NO",
            "Reviews/Social proof": reviews ? "YES" : "NO",
            "Structură educativă": edu ? "YES (Basic)" : "NO",
            "Personaje/Portofoliu": mascote ? "YES" : "NO",
            "CTA clarity": cta,
            "Gaps față de Kassia": edu ? "Minor gaps" : "Lacks structured educational content (Ce evităm, Scenarii, etc.)",
        });
    }
    
    await browser.close();
    
    console.log("\n=== BENCHMARK REPORT ===");
    console.log(JSON.stringify(results, null, 2));
    fs.writeFileSync('benchmark_report.json', JSON.stringify(results, null, 2));
    console.log("✅ Benchmark script finished. Report saved to benchmark_report.json");
}

runBenchmark().catch(console.error);
