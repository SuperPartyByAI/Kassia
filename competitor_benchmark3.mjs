import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

const urls = [
    'https://www.kassia.ro/animatori-petreceri-copii-sector-3/',
    'https://superparty.ro/animatori-petreceri-copii/',
    'https://cool-events.ro/',
    'https://www.funevents.ro/animatori-copii/',
    'https://yokidoki.ro/',
    'https://eziuamea.ro/',
    'https://kinderili.ro/',
    'https://joacafit.ro/',
    'https://kidsvilla.ro/',
    'https://indaparty.ro/',
    'https://magicland-pallady.ro/',
    'https://loculdepoveste.ro/'
];

const zones = ["vitan", "dristor", "titan", "balta albă", "balta alba", "sălăjan", "salajan", "timpuri noi", "unirii"];

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
