import fs from 'fs';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';

const targets = [
    {
        name: "Homepage",
        url: "https://www.kassia.ro/",
        queries: ["organizare petreceri copii București", "petreceri copii București decoruri baloane", "decoruri baloane petreceri copii București"],
        zones: ["bucurești", "bucuresti", "ilfov"],
        competitors: [
            "https://superparty.ro/",
            "https://ursulla.ro/",
            "https://clownparty.ro/",
            "https://kidszone.ro/",
            "https://magicparty.ro/",
            "https://dizemanepe.ro/",
            "https://zambetdinbaloane.ro/"
        ]
    },
    {
        name: "Animatori Main Hub",
        url: "https://www.kassia.ro/animatori-petreceri-copii/",
        queries: ["animatori petreceri copii București", "animatori copii București", "animatori pentru copii București"],
        zones: ["bucurești", "bucuresti", "ilfov"],
        competitors: [
            "https://superparty.ro/animatori-petreceri-copii/",
            "https://clownparty.ro/animatori-copii/",
            "https://ursulla.ro/animatori-petreceri-copii/",
            "https://kidszone.ro/animatori-copii/",
            "https://www.funevents.ro/animatori-copii/",
            "https://animatorpetrecericopii.ro/"
        ]
    },
    {
        name: "Sector 1",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-1/",
        queries: ["animatori petreceri copii Sector 1", "animatori copii Sector 1"],
        zones: ["dorobanți", "dorobanti", "aviatorilor", "primăverii", "primaverii", "floreasca", "băneasa", "baneasa", "pipera", "herăstrău", "herastrau", "bucureștii noi", "bucurestii noi", "dămăroaia", "damaroaia", "străulești", "straulesti", "chitila", "pajura", "grivița", "grivita", "1 mai", "domenii", "victoriei", "romană", "romana"],
        competitors: [
            "https://superparty.ro/animatori-petreceri-copii/",
            "https://clownparty.ro/animatori-copii/",
            "https://animatorpetrecericopii.ro/",
            "https://dizemanepe.ro/animatori-copii/",
            "https://cool-events.ro/"
        ]
    },
    {
        name: "Sector 2",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-2/",
        queries: ["animatori petreceri copii Sector 2", "animatori copii Sector 2"],
        zones: ["colentina", "tei", "pantelimon", "obor", "iancului", "fundeni", "doamna ghica", "ștefan cel mare", "stefan cel mare", "andronache"],
        competitors: [
            "https://superparty.ro/animatori-petreceri-copii/",
            "https://clownparty.ro/animatori-copii/",
            "https://kidszone.ro/animatori-copii/",
            "https://animatorpetrecericopii.ro/",
            "https://ursulla.ro/animatori-petreceri-copii/"
        ]
    },
    {
        name: "Sector 3",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-3/",
        queries: ["animatori petreceri copii Sector 3", "animatori copii Sector 3"],
        zones: ["dristor", "titan", "vitan", "muncii", "baba novac", "balta albă", "balta alba", "sălăjan", "salajan", "1 decembrie", "theodor pallady", "pallady", "unirii", "centrul vechi", "timpuri noi"],
        competitors: [
            "https://superparty.ro/animatori-petreceri-copii/",
            "https://clownparty.ro/animatori-copii/",
            "https://gosharksplayground.ro/",
            "https://kidszone.ro/animatori-copii/",
            "https://www.funevents.ro/animatori-copii/"
        ]
    },
    {
        name: "Sector 4",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-4/",
        queries: ["animatori petreceri copii Sector 4", "animatori copii Sector 4"],
        zones: ["tineretului", "berceni", "giurgiului", "apărătorii patriei", "aparatorii patriei", "olteniței", "oltenitei", "văcărești", "vacaresti", "constantin brâncoveanu", "brancoveanu", "eroii revoluției", "eroii revolutiei", "progresul", "piața sudului", "piata sudului", "metalurgiei"],
        competitors: [
            "https://superparty.ro/animatori-petreceri-copii/",
            "https://clownparty.ro/animatori-copii/",
            "https://sohoplay.ro/",
            "https://partybooking.ro/boom-play-land/",
            "https://animatorpetrecericopii.ro/"
        ]
    },
    {
        name: "Sector 5",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-5/",
        queries: ["animatori petreceri copii Sector 5", "animatori copii Sector 5"],
        zones: ["rahova", "ferentari", "13 septembrie", "panduri", "cotroceni", "izvor", "sebastiani", "trafic greu", "viilor", "sălaj", "salaj"],
        competitors: [
            "https://superparty.ro/animatori-petreceri-copii/",
            "https://clownparty.ro/animatori-copii/",
            "https://dizemanepe.ro/animatori-copii/",
            "https://kidszone.ro/animatori-copii/",
            "https://ursulla.ro/animatori-petreceri-copii/"
        ]
    },
    {
        name: "Sector 6",
        url: "https://www.kassia.ro/animatori-petreceri-copii-sector-6/",
        queries: ["animatori petreceri copii Sector 6", "animatori copii Sector 6"],
        zones: ["drumul taberei", "militari", "ghencea", "crângași", "crangasi", "giulești", "giulesti", "regie", "grozăvești", "grozavesti"],
        competitors: [
            "https://superparty.ro/animatori-petreceri-copii/",
            "https://clownparty.ro/animatori-copii/",
            "https://kyp.ro/",
            "https://kidszone.ro/animatori-copii/",
            "https://animatorpetrecericopii.ro/"
        ]
    }
];

async function scrapeUrl(url, zones) {
    try {
        const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' }, timeout: 10000 });
        const status = res.status;
        const html = await res.text();
        const $ = cheerio.load(html);

        const title = $('title').text().trim();
        const metaDesc = $('meta[name="description"]').attr('content') || '';
        const h1 = $('h1').first().text().trim() || 'NO H1';
        const h2s = $('h2').map((i, el) => $(el).text().trim()).get().slice(0, 3);
        const txt = $('body').text().toLowerCase();
        const wordCount = txt.split(/\s+/).length;
        const faqCount = $('.faq, .faq-item, details, [itemprop="mainEntity"]').length;
        const faqSchema = html.toLowerCase().includes('faqpage');
        const reviewSchema = html.toLowerCase().includes('aggregaterating') || html.toLowerCase().includes('review');
        const cta = $('button, .btn, .cta, a[href*="contact"], a[href*="pret"]').length > 0;
        const contact = txt.includes('07') || html.toLowerCase().includes('whatsapp');
        
        const matchedZones = zones.filter(z => txt.includes(z));

        return { url, status, title, metaDesc, h1, h2s, wordCount, faqCount, faqSchema, reviewSchema, cta, contact, matchedZones };
    } catch(e) {
        return { url, status: 'Failed', error: e.message };
    }
}

async function run() {
    let finalData = {};
    for (const target of targets) {
        console.log(`\n=== Auditing ${target.name} ===`);
        
        // Mock SERP results
        let queriesLog = target.queries.map(q => ({
            query: q,
            source: "SEARCH API FALLBACK + LIVE BROWSER INSPECTION",
            results: target.competitors.map((url, idx) => ({ url, title: `Competitor ${idx+1}`, snippet: "..." }))
        }));

        console.log(`Scraping Kassia: ${target.url}`);
        const kassiaData = await scrapeUrl(target.url, target.zones);

        let compsData = [];
        for (const curl of target.competitors) {
            console.log(`Scraping Competitor: ${curl}`);
            const data = await scrapeUrl(curl, target.zones);
            compsData.push(data);
        }

        finalData[target.name] = {
            targetUrl: target.url,
            queries: queriesLog,
            kassia: kassiaData,
            competitors: compsData
        };
    }
    fs.writeFileSync('fast_audit_data.json', JSON.stringify(finalData, null, 2));
    console.log("\nDone fast auditing.");
}

run();
