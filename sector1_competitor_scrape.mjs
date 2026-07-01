import * as cheerio from 'cheerio';
import fetch from 'node-fetch';

const urls = [
    'https://www.superparty.ro/',
    'https://www.funevents.ro/animatori-copii/',
    'https://www.cool-events.ro/',
    'https://caravanapersonajelor.ro/',
    'https://magicvalentino.ro/'
];

async function scrapeUrl(url) {
    try {
        const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' }, timeout: 10000 });
        if (!res.ok) return { url, status: res.status };
        const html = await res.text();
        const $ = cheerio.load(html);
        
        const h1 = $('h1').text().replace(/\s+/g, ' ').trim();
        const wordCount = $('body').text().split(/\s+/).filter(w => w.length > 2).length;
        const schema = $('script[type="application/ld+json"]').html() || '';
        const hasFaqSchema = schema.includes('FAQPage');
        const textLower = html.toLowerCase();
        
        // Check for specific Sector 1 local relevance
        const hasSector1 = textLower.includes('sector 1') || textLower.includes('sectorul 1');
        const hasNeighborhoods = ['baneasa', 'dorobanti', 'floreasca', 'primaverii'].some(n => textLower.includes(n));
        
        const ctaCount = $('a[href*="contact"], a[href*="tel:"], a.btn, button').length;
        
        return { 
            url, 
            status: res.status, 
            h1: h1.substring(0, 60), 
            wordCount, 
            hasFaqSchema, 
            hasSector1,
            hasNeighborhoods,
            ctaCount 
        };
    } catch (e) {
        return { url, error: e.message };
    }
}

async function run() {
    console.log("Fetching Sector 1 competitors...");
    const results = await Promise.all(urls.map(scrapeUrl));
    console.log(JSON.stringify(results, null, 2));
}

run();
