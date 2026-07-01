import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const slug = 'animatori-petreceri-copii-popesti-leordeni';
const oldSlug = 'animatori-copii-popesti-leordeni';

async function run() {
    console.log("=== DB QA ===");
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('slug', slug).single();
    if (!page) { console.log('Page not found'); return; }
    
    const { data: oldPage } = await supabase.from('kassia_pages').select('status, canonical_url').eq('slug', oldSlug).single();
    
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
    
    console.log("Pricing source:", page.show_pricing_preview ? "kassia_pricing_programs YES" : "NO");
    
    // Editorial QA
    const forbidden = ['perfect', 'premium', 'corporate', 'pachete', 'pachet', 'cost', 'tarif', 'memorabil', 'de neuitat', 'garantat', 'magie', '1-3 ore', 'om', 'oameni'];
    let forbiddenCounts = {};
    forbidden.forEach(t => forbiddenCounts[t] = 0);
    let isLocalized = false;
    let oldHardcodedPricing = false;
    
    sections.forEach(sec => {
        const text = JSON.stringify(sec).toLowerCase();
        if (text.includes('popești') || text.includes('leordeni') || text.includes('confort city') || text.includes('splaiul unirii') || text.includes('metrou') || text.includes('berceni') || text.includes('sudului')) {
            isLocalized = true;
        }
        if (text.includes('280 lei') || text.includes('1 oră') || sec.heading.toLowerCase().includes('variante de program')) {
            if(sec.heading.includes('Variante')) {
               oldHardcodedPricing = true;
            }
        }
        forbidden.forEach(term => {
            if (new RegExp('\\b' + term + '\\b').test(text)) {
                forbiddenCounts[term]++;
            }
        });
    });
    
    console.log("Localized real:", isLocalized ? "YES" : "NO");
    console.log("Hardcoded pricing:", oldHardcodedPricing ? "YES" : "NO");
    console.log("Forbidden terms found:", Object.entries(forbiddenCounts).filter(([k,v])=>v>0));
    
    console.log("=== LIVE QA ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    const liveUrl = `https://www.kassia.ro/${slug}/`;
    
    const response = await p.goto(liveUrl, { waitUntil: 'networkidle2' });
    const httpStatus = response.status();
    
    const pageData = await p.evaluate(() => {
        return {
            canonical: document.querySelector('link[rel="canonical"]')?.href,
            robots: document.querySelector('meta[name="robots"]')?.content,
            schemas: document.querySelectorAll('script[type="application/ld+json"]').length,
            faqCount: document.querySelectorAll('.faq-item, [itemprop="mainEntity"]').length,
            hasPricingComponent: !!document.querySelector('.pricing-preview-cards') || !!document.querySelector('.pricing-preview-section'),
            hasReviews: !!document.querySelector('.aprecieri-clienti'),
            hasHeader: !!document.querySelector('header'),
            hasFooter: !!document.querySelector('footer'),
            imgCount: document.querySelectorAll('img').length,
            visibleImgCount: Array.from(document.querySelectorAll('img')).filter(img => img.width > 0 && img.height > 0).length,
        };
    });
    
    await p.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/popesti_qa.png', fullPage: true });
    
    const oldResponse = await p.goto(`https://www.kassia.ro/${oldSlug}/`);
    const oldStatus = oldResponse.status();
    const oldUrlChain = oldResponse.request().redirectChain().map(r => r.response().status());
    
    await browser.close();
    
    console.log("HTTP status:", httpStatus);
    console.log("Canonical:", pageData.canonical);
    console.log("Robots:", pageData.robots);
    console.log("Old URL redirect chain:", oldUrlChain.length > 0 ? oldUrlChain[0] : oldStatus);
    console.log("Schemas:", pageData.schemas);
    console.log("FAQ count:", pageData.faqCount);
    console.log("Pricing component active:", pageData.hasPricingComponent);
    console.log("Reviews/stars active:", pageData.hasReviews);
    console.log("Header/Footer active:", pageData.hasHeader && pageData.hasFooter);
    console.log("Images visible:", pageData.visibleImgCount, "/", pageData.imgCount);
}

run().catch(console.error);
