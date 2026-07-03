import fs from 'fs';
import path from 'path';
import * as cheerio from 'cheerio';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const SERPER_API_KEY = process.env.SERPER_API_KEY;
const outDir = path.join(process.cwd(), 'audit_kassia_full_site_v2_2');

async function run() {
    console.log("Starting SERP Competitor Analysis...");
    
    // 1. Fetch Top 10 from Serper API
    const query = "animatori petreceri copii bucuresti";
    let top10Urls = [];
    try {
        const response = await fetch('https://google.serper.dev/search', {
            method: 'POST',
            headers: {
                'X-API-KEY': SERPER_API_KEY,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                q: query,
                gl: "ro",
                hl: "ro",
                num: 15
            })
        });
        
        const data = await response.json();
        if (data.organic) {
            top10Urls = data.organic.map(r => ({
                title: r.title,
                link: r.link,
                snippet: r.snippet,
                position: r.position
            })).filter(r => !r.link.includes('kassia.ro')).slice(0, 10);
            
            fs.writeFileSync(path.join(outDir, 'serp_results.json'), JSON.stringify(top10Urls, null, 2));
            console.log(`Saved ${top10Urls.length} SERP competitors.`);
        }
    } catch(e) {
        console.error("SERP API Error:", e);
        return;
    }
    
    // 2. Scrape Competitors
    const competitorData = [];
    for (const comp of top10Urls) {
        console.log(`Scraping competitor: ${comp.link}`);
        try {
            const req = await fetch(comp.link, {
                headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' },
                signal: AbortSignal.timeout(10000)
            });
            const html = await req.text();
            const $ = cheerio.load(html);
            
            // Extract text from body
            $('script, style, nav, footer, header, aside, .sidebar').remove();
            const textContent = $('body').text().replace(/\s+/g, ' ').trim();
            const wordCount = textContent.split(' ').length;
            
            const headings = [];
            $('h1, h2, h3').each((i, el) => headings.push($(el).text().replace(/\s+/g, ' ').trim()));
            
            const hasPrices = html.toLowerCase().includes('lei') || html.toLowerCase().includes('ron') || html.toLowerCase().includes('pret');
            const hasReviews = html.toLowerCase().includes('recenzii') || html.toLowerCase().includes('pareri') || html.toLowerCase().includes('review');
            
            competitorData.push({
                position: comp.position,
                url: comp.link,
                title: comp.title,
                wordCount,
                headings: headings.slice(0, 15),
                hasPrices,
                hasReviews,
                snippet: comp.snippet
            });
        } catch(e) {
            console.error(`Failed to scrape ${comp.link}`);
        }
    }
    
    // 3. Scrape Kassia
    let kassiaData = {};
    console.log(`Scraping Kassia...`);
    try {
        const req = await fetch('https://www.kassia.ro/animatori-petreceri-copii/');
        const html = await req.text();
        const $ = cheerio.load(html);
        $('script, style, nav, footer, header').remove();
        const textContent = $('body').text().replace(/\s+/g, ' ').trim();
        const wordCount = textContent.split(' ').length;
        const headings = [];
        $('h1, h2, h3').each((i, el) => headings.push($(el).text().replace(/\s+/g, ' ').trim()));
        
        kassiaData = {
            url: 'https://www.kassia.ro/animatori-petreceri-copii/',
            wordCount,
            headings: headings.slice(0, 15),
            hasPrices: html.toLowerCase().includes('lei') || html.toLowerCase().includes('ron') || html.toLowerCase().includes('pret'),
            hasReviews: html.toLowerCase().includes('recenzii') || html.toLowerCase().includes('pareri')
        };
    } catch(e) {
        console.error("Failed to scrape Kassia");
    }
    
    fs.writeFileSync(path.join(outDir, 'competitor_analysis_raw.json'), JSON.stringify({
        kassia: kassiaData,
        competitors: competitorData
    }, null, 2));
    
    console.log("Competitor analysis raw data saved!");
}

run();
