import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const slug = 'animatori-petreceri-copii-popesti-leordeni';

async function run() {
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

        const textContent = document.body.innerText.toLowerCase();
        
        // Forbidden check in text content (excluding review area broadly)
        const forbidden = ['perfect', 'premium', 'corporate', 'pachete', 'pachet', 'cost', 'tarif', 'memorabil', 'de neuitat', 'garantat', 'magie', '1-3 ore', 'om', 'oameni'];
        let forbiddenFound = false;
        
        return {
            canonical: document.querySelector('link[rel="canonical"]')?.href,
            robots: document.querySelector('meta[name="robots"]')?.content,
            faqCount: document.querySelectorAll('details, .faq-details').length,
            schemaCount: schemaCount,
            hasPricingComponent: !!document.querySelector('.pricing-preview-cards') || !!document.querySelector('.pricing-preview-section'),
            hasHardcodedPricing: Array.from(document.querySelectorAll('h1, h2, h3, h4')).some(h => h.innerText.toLowerCase().includes('variante de program') && h.nextElementSibling?.tagName === 'UL'),
            hasReviews: !!document.querySelector('.aprecieri-clienti'),
            hasHeader: !!document.querySelector('header'),
            hasFooter: !!document.querySelector('footer'),
            imgCount: document.querySelectorAll('img').length,
            visibleImgCount: Array.from(document.querySelectorAll('img')).filter(img => img.width > 0 && img.height > 0).length,
        };
    });
    
    const oldResponse = await p.goto(`https://www.kassia.ro/animatori-copii-popesti-leordeni/`);
    const oldUrlChain = oldResponse.request().redirectChain().map(r => r.response().status());
    
    await browser.close();
    
    console.log(JSON.stringify({ httpStatus, pageData, oldUrlChain }, null, 2));
}

run().catch(console.error);
