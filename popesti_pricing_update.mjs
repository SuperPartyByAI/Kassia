import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = '7bd530f1-2f5b-4c2a-b591-aae69f2ab473';
const slug = 'animatori-petreceri-copii-popesti-leordeni';

async function run() {
    console.log("=== PRE-WRITE BACKUP ===");
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('id', PAGE_ID).single();
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', PAGE_ID);
    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', PAGE_ID);
    
    const backupObj = { page, sections, faqs };
    const backupPath = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/popesti_pricing_backup.json';
    fs.writeFileSync(backupPath, JSON.stringify(backupObj, null, 2));
    console.log(`Backup saved to: ${backupPath}`);
    
    console.log("=== EXECUTING WRITE ===");
    const { error: updErr } = await supabase.from('kassia_pages').update({ 
        show_pricing_preview: true, 
        updated_at: new Date().toISOString() 
    }).eq('id', PAGE_ID);
    if (updErr) throw updErr;
    
    console.log("Updated show_pricing_preview to true and bumped updated_at.");
    
    console.log("Waiting 10 seconds for CDN / Next.js ISR propagation...");
    await new Promise(r => setTimeout(r, 10000));
    
    console.log("=== LIVE QA ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    const liveUrl = `https://www.kassia.ro/${slug}/`;
    
    const response = await p.goto(liveUrl, { waitUntil: 'networkidle2' });
    const httpStatus = response.status();
    
    const pageData = await p.evaluate(() => {
        let schemaCount = 0;
        const scripts = document.querySelectorAll('script[type="application/ld+json"]');
        scripts.forEach(s => {
            try {
                const j = JSON.parse(s.innerText);
                const checkFAQ = (obj) => {
                    if (obj['@type'] === 'FAQPage') {
                        schemaCount += obj.mainEntity ? obj.mainEntity.length : 0;
                    } else if (obj['@graph']) {
                        obj['@graph'].forEach(checkFAQ);
                    }
                };
                checkFAQ(j);
            } catch(e) {}
        });

        const pricingCards = document.querySelectorAll('.pricing-preview-cards .pricing-card');

        return {
            canonical: document.querySelector('link[rel="canonical"]')?.href,
            robots: document.querySelector('meta[name="robots"]')?.content,
            faqCount: document.querySelectorAll('details, .faq-details').length,
            schemaCount: schemaCount,
            hasPricingComponent: !!document.querySelector('.pricing-preview-cards') || !!document.querySelector('.pricing-preview-section'),
            pricingCardCount: pricingCards.length,
            hasReviews: !!document.querySelector('.aprecieri-clienti'),
            imgCount: document.querySelectorAll('img').length,
            visibleImgCount: Array.from(document.querySelectorAll('img')).filter(img => img.width > 0 && img.height > 0).length,
            hasHardcodedPricing: Array.from(document.querySelectorAll('h1, h2, h3, h4')).some(h => h.innerText.toLowerCase().includes('variante de program') && h.nextElementSibling?.tagName === 'UL')
        };
    });
    
    await browser.close();
    
    console.log(JSON.stringify({ httpStatus, pageData }, null, 2));
}

run().catch(console.error);
