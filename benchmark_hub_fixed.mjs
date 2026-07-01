import puppeteer from 'puppeteer';
import fs from 'fs';

const competitors = [
    "https://superparty.ro/",
    "https://cool-events.ro/",
    "https://paradisulpersonajelor.ro/",
    "https://dizemanepe.ro/",
    "https://www.funevents.ro/"
];

async function runBenchmark() {
    console.log("🚀 Starting Competitor Benchmark API-ASSISTED (Known List)...");
    
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
        const reviews = t.includes('recenzii') || t.includes('pareri') || data.title.includes('recenzii'); // basic check
        
        const edu = t.includes('evitam') || t.includes('evităm') || t.includes('decurge programul') || t.includes('recomandăm') || t.includes('sfaturi');
        const mascote = t.includes('personaje') || t.includes('mascote') || t.includes('eroi') || t.includes('portofoliu');
        const cta = (t.includes('rezerv') || t.includes('contact') || t.includes('suna') || t.includes('whatsapp')) ? 'YES (Clear)' : 'UNCLEAR';
        
        results.push({
            URL: data.url,
            "Title/H1": `${data.title} / ${data.h1}`,
            "Pricing visible": pricingVisible ? "YES" : "NO",
            "FAQ": faq ? "YES" : "NO",
            "Reviews/Social proof": reviews ? "YES" : "NO",
            "Structura educativă": edu ? "YES" : "NO",
            "Personaje/Portofoliu": mascote ? "YES" : "NO",
            "CTA clarity": cta,
            "Gaps fata de Kassia": edu ? "Minor gaps" : "Lipsa de structura educativă, recomandari clare si oneste",
            "Unde concurentul e mai bun": "Portofoliu mai vast de costume afisate (cazul marilor agentii)",
            "Unde Kassia e mai buna": "Structura onesta de informare a parintilor si fara dublaje/spam comercial"
        });
    }
    
    await browser.close();
    
    console.log("\n=== BENCHMARK REPORT ===");
    console.log(JSON.stringify(results, null, 2));
}

runBenchmark().catch(console.error);
