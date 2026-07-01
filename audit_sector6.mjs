import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function runAudit() {
    console.log("=== SECTOR 6 DB AUDIT ===");
    
    const slug = 'animatori-petreceri-copii-sector-6';
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('slug', slug).single();
    
    if (!page) {
        console.error("Page not found in DB.");
        return;
    }
    
    console.log(`Page DB Row: id=${page.id}, title="${page.title}", status=${page.status}, show_pricing_preview=${page.show_pricing_preview}`);
    
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id).order('order_index');
    console.log(`Sections count: ${sections.length}`);
    sections.forEach(s => {
        console.log(`- [${s.order_index}] type: ${s.section_type}, heading: "${s.heading}"`);
    });
    
    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id);
    console.log(`FAQ count DB: ${faqs.length}`);
    
    const prohibitedWords = [
        'pachete', 'perfect', 'premium', 'magie', 'garantat', 'de neuitat', 'memorabil', 
        'asigur', 'prețurile noastre', 'pictură pe față', 'face-painting', 'cost', 'tarif', '1-3 ore'
    ];
    
    let badWordsFound = [];
    sections.forEach(s => {
        const text = JSON.stringify(s.content).toLowerCase();
        prohibitedWords.forEach(w => {
            if (text.includes(w.toLowerCase())) badWordsFound.push(`Word '${w}' found in section '${s.heading}'`);
        });
    });
    faqs.forEach(f => {
        const text = (f.question + " " + f.answer).toLowerCase();
        prohibitedWords.forEach(w => {
            if (text.includes(w.toLowerCase())) badWordsFound.push(`Word '${w}' found in FAQ '${f.question}'`);
        });
    });
    
    console.log("\nEditorial Audit Issues:");
    if (badWordsFound.length === 0) console.log("None!");
    else badWordsFound.forEach(i => console.log("- " + i));
    
    
    console.log("\n=== SECTOR 6 LIVE AUDIT ===");
    const url = `https://www.kassia.ro/${slug}/`;
    console.log("Checking URL:", url);
    
    try {
        const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
        const p = await browser.newPage();
        const response = await p.goto(url, { waitUntil: 'networkidle0' });
        
        console.log(`HTTP Status: ${response.status()}`);
        
        const liveData = await p.evaluate(() => {
            const h1 = document.querySelector('h1')?.innerText;
            const title = document.title;
            const metaRobots = document.querySelector('meta[name="robots"]')?.content;
            const canonical = document.querySelector('link[rel="canonical"]')?.href;
            
            const h2s = Array.from(document.querySelectorAll('h2')).map(h => h.innerText);
            const faqsRendered = document.querySelectorAll('.faq-details').length;
            const pricingPreview = document.querySelector('.pricing-preview') !== null;
            const googleBadges = document.querySelectorAll('.google-trust-badge').length;
            const ctas = document.querySelectorAll('.btn-primary').length;
            const images = document.querySelectorAll('img').length;
            
            return {
                h1, title, metaRobots, canonical, h2s, faqsRendered, pricingPreview, googleBadges, ctas, images
            };
        });
        
        console.log("Live State:", liveData);
        await browser.close();
    } catch(e) {
        console.error("Puppeteer error:", e);
    }
}

runAudit().catch(console.error);
