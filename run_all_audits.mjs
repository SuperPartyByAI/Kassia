import puppeteer from 'puppeteer';
import fs from 'fs';

const pagesToAudit = [
    {
        name: "Homepage",
        url: "https://www.kassia.ro/",
        queries: [
            "organizare petreceri copii București",
            "petreceri copii București decoruri baloane",
            "decoruri baloane petreceri copii București",
            "organizare evenimente copii București"
        ],
        zones: ["bucurești", "bucuresti", "ilfov"]
    },
    {
        name: "Animatori Main Hub",
        url: "https://www.kassia.ro/animatori-petreceri-copii/",
        queries: [
            "animatori petreceri copii București",
            "animatori copii București",
            "animatori petreceri copii Ilfov",
            "animatori pentru copii București"
        ],
        zones: ["bucurești", "bucuresti", "ilfov"]
    },
    {
        name: "Sector 1",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-1/",
        queries: [
            "animatori petreceri copii Sector 1",
            "animatori copii Sector 1",
            "animatori petreceri copii București Sector 1",
            "animatori copii București Sector 1"
        ],
        zones: ["dorobanți", "dorobanti", "aviatorilor", "primăverii", "primaverii", "floreasca", "băneasa", "baneasa", "pipera", "herăstrău", "herastrau", "bucureștii noi", "bucurestii noi", "dămăroaia", "damaroaia", "străulești", "straulesti", "chitila", "pajura", "grivița", "grivita", "1 mai", "domenii", "victoriei", "romană", "romana"]
    },
    {
        name: "Sector 2",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-2/",
        queries: [
            "animatori petreceri copii Sector 2",
            "animatori copii Sector 2",
            "animatori petreceri copii București Sector 2",
            "animatori copii București Sector 2"
        ],
        zones: ["colentina", "tei", "pantelimon", "obor", "iancului", "fundeni", "doamna ghica", "ștefan cel mare", "stefan cel mare", "andronache"]
    },
    {
        name: "Sector 3",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-3/",
        queries: [
            "animatori petreceri copii Sector 3",
            "animatori copii Sector 3",
            "animatori petreceri copii București Sector 3",
            "animatori copii București Sector 3"
        ],
        zones: ["dristor", "titan", "vitan", "muncii", "baba novac", "balta albă", "balta alba", "sălăjan", "salajan", "1 decembrie", "theodor pallady", "pallady", "unirii", "centrul vechi", "timpuri noi"]
    },
    {
        name: "Sector 4",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-4/",
        queries: [
            "animatori petreceri copii Sector 4",
            "animatori copii Sector 4",
            "animatori petreceri copii București Sector 4",
            "animatori copii București Sector 4"
        ],
        zones: ["tineretului", "berceni", "giurgiului", "apărătorii patriei", "aparatorii patriei", "olteniței", "oltenitei", "văcărești", "vacaresti", "constantin brâncoveanu", "brancoveanu", "eroii revoluției", "eroii revolutiei", "progresul", "piața sudului", "piata sudului", "metalurgiei"]
    },
    {
        name: "Sector 5",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-5/",
        queries: [
            "animatori petreceri copii Sector 5",
            "animatori copii Sector 5",
            "animatori petreceri copii București Sector 5",
            "animatori copii București Sector 5"
        ],
        zones: ["rahova", "ferentari", "13 septembrie", "panduri", "cotroceni", "izvor", "sebastiani", "trafic greu", "viilor", "sălaj", "salaj"]
    },
    {
        name: "Sector 6",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-6/",
        queries: [
            "animatori petreceri copii Sector 6",
            "animatori copii Sector 6",
            "animatori petreceri copii București Sector 6",
            "animatori copii București Sector 6"
        ],
        zones: ["drumul taberei", "militari", "ghencea", "crângași", "crangasi", "giulești", "giulesti", "regie", "grozăvești", "grozavesti"]
    }
];

const BANNED_DOMAINS = ['olx.ro', 'la-jumate.ro', 'publi24.ro', 'facebook.com', 'google.com', 'kassia.ro', 'storia.ro', 'romimo.ro'];

const resultsFile = 'full_audit_data.json';
let finalData = {};
if (fs.existsSync(resultsFile)) {
    finalData = JSON.parse(fs.readFileSync(resultsFile, 'utf-8'));
}

async function run() {
    console.log("Launching Puppeteer...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 800 });

    for (const target of pagesToAudit) {
        if (finalData[target.name] && finalData[target.name].competitors && finalData[target.name].competitors.length > 0) {
            console.log(`Skipping ${target.name}, already scraped.`);
            continue;
        }
        
        console.log(`\n============================`);
        console.log(`Starting Audit for: ${target.name}`);
        console.log(`============================\n`);
        
        let allLinks = new Set();
        let queryLogs = [];

        // 1. Google SERP
        for (const q of target.queries) {
            console.log(`Searching: ${q}`);
            let searchUrl = `https://www.google.ro/search?q=${encodeURIComponent(q)}&hl=ro`;
            try {
                await page.goto(searchUrl, { waitUntil: 'domcontentloaded', timeout: 15000 });
                const results = await page.evaluate(() => {
                    const links = Array.from(document.querySelectorAll('div.g'));
                    return links.map(el => {
                        const a = el.querySelector('a');
                        const title = el.querySelector('h3') ? el.querySelector('h3').innerText : '';
                        const snippet = el.querySelector('div.VwiC3b') ? el.querySelector('div.VwiC3b').innerText : '';
                        return { url: a ? a.href : '', title, snippet };
                    }).filter(r => r.url && r.url.startsWith('http'));
                });
                
                queryLogs.push({ query: q, source: "GOOGLE REAL BROWSER", results });
                
                results.forEach((r, idx) => {
                    if (!BANNED_DOMAINS.some(bd => r.url.includes(bd))) {
                        allLinks.add(r.url);
                    }
                });
            } catch(e) {
                console.log(`Error on Google Search: ${e.message}`);
                queryLogs.push({ query: q, source: "BLOCKED", results: [] });
            }
            await new Promise(r => setTimeout(r, 2000 + Math.random()*2000));
        }
        
        const competitorSet = Array.from(allLinks).slice(0, 10);
        console.log(`Found ${competitorSet.length} competitors to analyze.`);
        
        // 2. Scrape Competitors
        let competitorData = [];
        for (const url of competitorSet) {
            console.log(`Inspecting Competitor: ${url}`);
            try {
                const resp = await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 15000 });
                const status = resp ? resp.status() : 'Error';
                
                const data = await page.evaluate(() => {
                    const title = document.title;
                    const metaDesc = document.querySelector('meta[name="description"]') ? document.querySelector('meta[name="description"]').content : '';
                    const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText.trim() : 'NO H1';
                    const h2s = Array.from(document.querySelectorAll('h2')).map(h => h.innerText.trim()).slice(0, 3);
                    const txt = document.body.innerText.toLowerCase();
                    const html = document.documentElement.innerHTML.toLowerCase();
                    const wordCount = txt.split(/\\s+/).length;
                    const faqCount = document.querySelectorAll('.faq, .faq-item, details, [itemprop="mainEntity"]').length;
                    const faqSchema = html.includes('faqpage');
                    const reviewSchema = html.includes('aggregaterating') || html.includes('review');
                    const cta = document.querySelector('button, .btn, .cta, a[href*="contact"], a[href*="pret"]') ? true : false;
                    const contact = txt.includes('07') || html.includes('whatsapp') ? true : false;
                    
                    return { title, metaDesc, h1, h2s, txt, wordCount, faqCount, faqSchema, reviewSchema, cta, contact };
                });
                
                const matchedZones = target.zones.filter(z => data.txt.includes(z));
                data.matchedZones = matchedZones;
                data.url = url;
                data.status = status;
                // Don't save full text to save space
                delete data.txt;
                
                competitorData.push(data);
            } catch(e) {
                console.log(`Failed to inspect: ${url} - ${e.message}`);
                competitorData.push({ url, status: 'Failed', error: e.message });
            }
        }
        
        // 3. Scrape Kassia
        console.log(`Inspecting Kassia: ${target.url}`);
        let kassiaData = {};
        try {
            const resp = await page.goto(target.url, { waitUntil: 'domcontentloaded', timeout: 15000 });
            const status = resp ? resp.status() : 'Error';
            
            kassiaData = await page.evaluate(() => {
                const canonical = document.querySelector('link[rel="canonical"]') ? document.querySelector('link[rel="canonical"]').href : '';
                const title = document.title;
                const metaDesc = document.querySelector('meta[name="description"]') ? document.querySelector('meta[name="description"]').content : '';
                const h1s = Array.from(document.querySelectorAll('h1')).map(h => h.innerText.trim());
                const txt = document.body.innerText.toLowerCase();
                const html = document.documentElement.innerHTML.toLowerCase();
                const wordCount = txt.split(/\\s+/).length;
                const faqCount = document.querySelectorAll('.faq-details, details').length;
                const faqSchema = html.includes('faqpage');
                const cta = true; // known
                
                return { status, canonical, title, metaDesc, h1s, wordCount, faqCount, faqSchema, txt };
            });
            
            kassiaData.matchedZones = target.zones.filter(z => kassiaData.txt && kassiaData.txt.includes(z));
            delete kassiaData.txt; // save space
        } catch(e) {
            console.log(`Failed to inspect Kassia: ${e.message}`);
        }

        finalData[target.name] = {
            targetUrl: target.url,
            queries: queryLogs,
            kassia: kassiaData,
            competitors: competitorData
        };

        fs.writeFileSync(resultsFile, JSON.stringify(finalData, null, 2));
    }

    await browser.close();
    console.log("All pages audited successfully!");
}

run().catch(console.error);
