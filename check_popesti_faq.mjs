import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii-popesti-leordeni').single();
    
    if (page) {
        const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
        const faqSections = sections.filter(s => s.section_type === 'faq' || JSON.stringify(s).toLowerCase().includes('întrebări frecvente') || JSON.stringify(s).toLowerCase().includes('faq'));
        console.log("DB FAQ SECTIONS COUNT:", faqSections.length);
        console.log("DB FAQ DETAILS:", JSON.stringify(faqSections, null, 2));
    }
    
    console.log("\n=== PUPPETEER CHECK ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    await p.goto('https://www.kassia.ro/animatori-petreceri-copii-popesti-leordeni/', { waitUntil: 'networkidle2' });
    
    const faqs = await p.evaluate(() => {
        const headings = Array.from(document.querySelectorAll('h1, h2, h3, h4')).filter(h => h.innerText.toLowerCase().includes('întrebări'));
        
        let schemaCount = 0;
        let schemaQuestions = [];
        const scripts = document.querySelectorAll('script[type="application/ld+json"]');
        scripts.forEach(s => {
            try {
                const j = JSON.parse(s.innerText);
                // Schema structure could be array or single object
                const checkFAQ = (obj) => {
                    if (obj['@type'] === 'FAQPage') {
                        schemaCount += obj.mainEntity ? obj.mainEntity.length : 0;
                        if (obj.mainEntity) {
                            schemaQuestions.push(...obj.mainEntity.map(e => e.name));
                        }
                    } else if (obj['@graph']) {
                        obj['@graph'].forEach(checkFAQ);
                    }
                };
                checkFAQ(j);
            } catch(e) {}
        });

        // Try to find FAQ containers more broadly
        // Look for typical FAQ structures like details/summary, or accordion wrappers
        const details = document.querySelectorAll('details');
        const questionTexts = [];
        if (details.length > 0) {
            details.forEach(d => {
                const summary = d.querySelector('summary');
                if (summary) questionTexts.push(summary.innerText.trim());
            });
        }
        
        return {
            headings: headings.map(h => h.innerText),
            detailsElements: details.length,
            extractedQuestions: questionTexts,
            schemaCount: schemaCount,
            schemaQuestions: schemaQuestions
        };
    });
    
    console.log(JSON.stringify(faqs, null, 2));
    await browser.close();
}

run().catch(console.error);
