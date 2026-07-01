import * as cheerio from 'cheerio';
import fetch from 'node-fetch';

const urls = [
    'https://www.cool-events.ro/',
    'https://paradisulpersonajelor.ro/',
    'https://www.funevents.ro/animatori-copii/',
    'https://www.dizemanepe.ro/',
    'https://www.superparty.ro/',
    'https://clubuldisney.com/',
    'https://animatori-petreceri-copii.ro/',
    'https://zoukaevents.ro/'
];

async function scrapeUrl(url) {
    try {
        const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' }, timeout: 10000 });
        if (!res.ok) return { url, status: res.status };
        const html = await res.text();
        const $ = cheerio.load(html);
        
        const h1 = $('h1').text().replace(/\s+/g, ' ').trim();
        const title = $('title').text().trim();
        const wordCount = $('body').text().split(/\s+/).filter(w => w.length > 2).length;
        const faqCount = html.toLowerCase().split('faq').length - 1;
        const schema = $('script[type="application/ld+json"]').html() || '';
        const hasFaqSchema = schema.includes('FAQPage');
        const hasBucuresti = html.toLowerCase().includes('bucuresti') || html.toLowerCase().includes('bucurești');
        const ctaCount = $('a[href*="contact"], a[href*="tel:"], a.btn, button').length;
        
        return { url, status: res.status, h1: h1.substring(0, 60), wordCount, hasFaqSchema, hasBucuresti, ctaCount };
    } catch (e) {
        return { url, error: e.message };
    }
}

async function run() {
    console.log("Fetching competitors...");
    const results = await Promise.all(urls.map(scrapeUrl));
    console.log(JSON.stringify(results, null, 2));
}

run();
