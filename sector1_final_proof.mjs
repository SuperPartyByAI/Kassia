import * as cheerio from 'cheerio';
import fetch from 'node-fetch';

const targetUrl = 'https://www.kassia.ro/animatori-petreceri-copii-sector-1/';

async function run() {
    console.log("--- TASK 1-3: DOM & CONTENT AUDIT ---");
    const res = await fetch(targetUrl, { headers: { 'Cache-Control': 'no-cache' } });
    const html = await res.text();
    const $ = cheerio.load(html);
    
    const title = $('title').text();
    const metaDesc = $('meta[name="description"]').attr('content');
    const h1Count = $('h1').length;
    const h1Text = $('h1').text().trim();
    
    // Extract non-review content
    // Let's get all paragraphs, spans, lis inside main sections except the review block
    // We assume reviews are in a block that contains "rating" or "review" or "Google"
    // Just simple text extraction for now
    let fullText = $('body').text().replace(/\s+/g, ' ');
    
    const problemWords = [
        "câteva săptămâni", "Desigur", "<p>", "lei", "ideal", "perfect", "excelent", "profesional", "calitate", "garantat", "sigur"
    ];
    
    let foundProblems = [];
    problemWords.forEach(w => {
        if (fullText.includes(w)) {
            // Find surrounding context
            let idx = fullText.indexOf(w);
            let context = fullText.substring(Math.max(0, idx - 30), Math.min(fullText.length, idx + 30));
            foundProblems.push({ word: w, context });
        }
    });

    const neighborhoods = [
        "Băneasa", "Dorobanți", "Floreasca", "Domenii", "Aviației", 
        "Primăverii", "Bucureștii Noi", "Pajura", "Dămăroaia", 
        "Gara de Nord", "Grivița", "Romană", "Victoriei", "Romana"
    ];
    
    let foundNeighborhoods = [];
    neighborhoods.forEach(n => {
        if (fullText.includes(n)) {
            foundNeighborhoods.push(n);
        }
    });

    console.log(JSON.stringify({
        status: res.status,
        h1Count,
        h1Text,
        title,
        foundProblems,
        foundNeighborhoods
    }, null, 2));
}

run();
