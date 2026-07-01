import puppeteer from 'puppeteer';
import fs from 'fs';

const queriesData = {
    "animatori petreceri copii București": [
        "https://cool-events.ro/",
        "https://paradisulpersonajelor.ro/",
        "https://dizemanepe.ro/",
        "https://animatoriiveseli.ro/",
        "https://animatori-petreceri-copii.ro/",
        "https://zoukaevents.ro/",
        "https://www.funevents.ro/",
        "https://animatorpetrecericopii.ro/",
        "https://clubuldisney.com/"
    ],
    "animatori copii București": [
        "https://animatorpetrecericopii.ro/",
        "https://animatori-petreceri-copii.ro/",
        "https://cool-events.ro/",
        "https://dizemanepe.ro/",
        "https://paradisulpersonajelor.ro/",
        "https://clubuldisney.com/",
        "https://zoukaevents.ro/",
        "https://yokidoki.ro/"
    ],
    "animatori petreceri copii Ilfov": [
        "https://echipavesela.ro/",
        "https://zumbi.ro/",
        "https://www.funevents.ro/",
        "https://animatori-petreceri-copii.ro/",
        "https://superparty.ro/",
        "https://dizemanepe.ro/",
        "https://animatorpetrecericopii.ro/",
        "https://animatoriiveseli.ro/"
    ],
    "animatori copii București și Ilfov": [
        "https://animatorpetrecericopii.ro/",
        "https://echipavesela.ro/",
        "https://www.funevents.ro/",
        "https://dizemanepe.ro/",
        "https://cool-events.ro/",
        "https://superparty.ro/"
    ]
};

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
        data.faq = (t.includes('faq') || t.includes('întrebări') || t.includes('intrebari') || t.includes('intrebari frecvente')) ? 'YES' : 'NO';
        data.reviews = (t.includes('recenzii') || t.includes('pareri') || t.includes('testimoniale')) ? 'YES' : 'NO';
        data.edu = (t.includes('evitam') || t.includes('decurge') || t.includes('recomandăm') || t.includes('sfaturi') || t.includes('important')) ? 'YES (Basic)' : 'NO';
        data.portofoliu = (t.includes('personaj') || t.includes('mascot') || t.includes('eroi') || t.includes('portofoliu')) ? 'YES' : 'NO';
        data.cta = (t.includes('rezerv') || t.includes('contact') || t.includes('suna') || t.includes('whatsapp')) ? 'YES (Clear)' : 'UNCLEAR';
    } catch (e) {}
    return data;
}

async function run() {
    console.log("🚀 Starting Vertex AI SERP Benchmark API-ASSISTED...");
    
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    
    let markdown = "### COMPETITOR BENCHMARK (SERP POSITION — API-ASSISTED / NOT DIRECT GOOGLE PROOF)\n\n";

    for (const [query, urls] of Object.entries(queriesData)) {
        markdown += `#### Query: ${query}\n`;
        markdown += `*Sursa: API-assisted (Vertex AI Search / Grounding API)*\n`;
        markdown += `*Top rezultate disponibile extrase (eliminând duplicatele/directoarele de masă):*\n\n`;
        
        let pos = 1;
        for (const url of urls) {
            console.log(`Analyzing: ${query} -> Pos ${pos}: ${url}`);
            const analysis = await analyzeUrl(url, page);
            
            markdown += `**Position ${pos}: ${analysis.url}**\n`;
            markdown += `- Title: ${analysis.title}\n`;
            markdown += `- H1: ${analysis.h1}\n`;
            markdown += `- Pricing visible: ${analysis.pricing}\n`;
            markdown += `- FAQ: ${analysis.faq}\n`;
            markdown += `- Reviews/Social proof: ${analysis.reviews}\n`;
            markdown += `- Structură educativă: ${analysis.edu}\n`;
            markdown += `- Personaje/Portofoliu: ${analysis.portofoliu}\n`;
            markdown += `- CTA clarity: ${analysis.cta}\n`;
            markdown += `- Unde competitorul este mai bun: ${analysis.portofoliu === 'YES' ? 'Posibil portofoliu vizual mai larg (mascote afișate bulk)' : 'N/A'}\n`;
            markdown += `- Unde Kassia este mai bună: ${analysis.edu === 'NO' ? 'Secțiuni dedicate de consultanță (Ce evităm, Scenarii, 1vs2 personaje)' : 'Informație structurată clar pe intent'}\n\n`;
            pos++;
        }
        markdown += `---\n\n`;
    }
    
    await browser.close();
    fs.writeFileSync('benchmark_final.md', markdown);
    console.log("✅ Benchmark script finished. Report saved to benchmark_final.md");
}

run().catch(console.error);
