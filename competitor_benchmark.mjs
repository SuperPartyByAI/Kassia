import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

const urls = [
    'https://www.kassia.ro/animatori-petreceri-copii-sector-2/',
    'https://www.echipavesela.ro/',
    'https://superparty.ro/animatori-petreceri-copii/',
    'https://magicvalentino.ro/animatori-petreceri-copii/',
    'https://www.enjoyparty.ro/',
    'https://dizemanepe.ro/animatori-copii/',
    'https://www.funevents.ro/animatori-copii/',
    'https://cool-events.ro/',
    'https://www.kyp.ro/',
    'https://zburdy.ro/',
    'https://animatoriiveseli.ro/'
];

const zones = ["colentina", "tei", "pantelimon", "obor", "iancului", "fundeni", "doamna ghica", "ștefan cel mare", "stefan cel mare", "floreasca", "andronache"];

async function run() {
    for (const url of urls) {
        try {
            const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' }, timeout: 10000 });
            const html = await res.text();
            const $ = cheerio.load(html);
            
            const title = $('title').text().trim() || 'No Title';
            const h1 = $('h1').text().trim().replace(/\s+/g, ' ') || 'No H1';
            const bodyTxt = $('body').text().replace(/\s+/g, ' ');
            const wordCount = bodyTxt.split(' ').length;
            const faqs = $('.faq, .faq-item, details').length;
            const hasFaqSchema = html.includes('FAQPage');
            const hasReviewSchema = html.includes('AggregateRating') || html.includes('Review');
            
            const matchedZones = zones.filter(z => bodyTxt.toLowerCase().includes(z));
            
            console.log(`\nURL: ${url}`);
            console.log(`HTTP: ${res.status}`);
            console.log(`Title: ${title.substring(0, 80)}...`);
            console.log(`H1: ${h1.substring(0, 80)}...`);
            console.log(`Word Count: ~${wordCount}`);
            console.log(`FAQs: ${faqs} | FAQ Schema: ${hasFaqSchema}`);
            console.log(`Review Schema: ${hasReviewSchema}`);
            console.log(`Zones found (${matchedZones.length}): ${matchedZones.join(', ')}`);
            
        } catch (e) {
            console.log(`\nURL: ${url} -> ERROR: ${e.message}`);
        }
    }
}
run();
