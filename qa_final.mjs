import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function runQA() {
    const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db';
    console.log("=== DB SECTIONS ===");
    const { data: sections } = await supabase.from('kassia_page_sections').select('heading, section_type, order_index').eq('page_id', pageId).order('order_index');
    sections.forEach(s => console.log(`[${s.order_index}] ${s.section_type} | ${s.heading}`));
    
    console.log("\n=== PUPPETEER LIVE QA ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    const response = await p.goto('https://www.kassia.ro/animatori-petreceri-copii/', { waitUntil: 'networkidle0' });
    const html = await p.content();
    
    // Extrage headings
    const headings = await p.evaluate(() => {
        return Array.from(document.querySelectorAll('h1, h2, h3')).map(h => `${h.tagName}: ${h.innerText.trim()}`);
    });
    console.log("\nLive Headings:");
    headings.forEach(h => console.log(h));
    
    // Check missing sections (content_block delete side effects)
    console.log(`\ncontent_block delete side effects: ${html.includes('Citește mai jos câteva recenzii') ? 'YES (still present)' : 'NO'}`);
    
    // FAQ validation
    const faqs = await p.evaluate(() => {
        return Array.from(document.querySelectorAll('.faq-item, [itemprop="mainEntity"]')).length; // Approximate
    });
    const schemaMatch = html.match(/"@type":"Question"/g) || [];
    console.log(`FAQ HTML visual count: ${html.match(/Când alegem un personaj animator/g)?.length}`);
    console.log(`FAQ Schema count: ${schemaMatch.length}`);
    
    // Canonical & Robots
    console.log(`Canonical: ${html.includes('rel="canonical" href="https://www.kassia.ro/animatori-petreceri-copii/"')}`);
    console.log(`Robots index/follow: ${html.includes('name="robots" content="index, follow"')}`);
    
    // Pricing
    console.log(`Pricing 280: ${html.includes('280 lei')}`);
    console.log(`Pricing 490: ${html.includes('490 lei')}`);
    console.log(`Pricing 830: ${html.includes('830 lei')}`);
    
    // Link Personaje
    console.log(`Link Personaje: ${html.includes('/personaje-animatori-copii-bucuresti/')}`);
    
    // Reviews / Badge
    console.log(`Google Badge: ${html.includes('google-trust-badge')}`);
    
    // Negative checks
    console.log(`\n=== NEGATIVE CHECKS ===`);
    console.log(`experiență excelentă: ${html.includes('experiență excelentă')}`);
    console.log(`1-3 ore: ${html.includes('1-3 ore')}`);
    console.log(`FUN FACTORY: ${html.includes('FUN FACTORY')}`);
    console.log(`pictură pe față (in body): ${html.includes('pictură pe față')}`);
    
    // Console errors?
    console.log(`Status code: ${response.status()}`);
    
    await browser.close();
}

runQA().catch(console.error);
