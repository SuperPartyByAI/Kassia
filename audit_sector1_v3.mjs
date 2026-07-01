import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import puppeteer from 'puppeteer';
import { execSync } from 'child_process';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const SECTOR1_SLUG = 'animatori-petreceri-copii-sector-1';
const VOLUNTARI_SLUG = 'animatori-petreceri-copii-voluntari';

async function run() {
    console.log("=== FAQ SCHEMA RECONCILIATION ===");
    
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const checkSchema = async (slug) => {
        const p = await browser.newPage();
        await p.goto(`https://www.kassia.ro/${slug}/`, { waitUntil: 'networkidle2' });
        return await p.evaluate(() => {
            const scripts = document.querySelectorAll('script[type="application/ld+json"]');
            let schemaCount = 0;
            let parseError = null;
            let foundFAQPage = false;
            let rawText = null;
            scripts.forEach(s => {
                if (s.innerText.includes('FAQPage')) {
                    foundFAQPage = true;
                    rawText = s.innerText;
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
                    } catch(e) {
                        parseError = e.message;
                    }
                }
            });
            return {
                faqVisibleCount: document.querySelectorAll('details, .faq-details').length,
                schemaFaqCount: schemaCount,
                foundFAQPage,
                parseError,
                rawTextSnippet: rawText ? rawText.substring(0, 200) + "..." : null
            };
        });
    };

    const s1Schema = await checkSchema(SECTOR1_SLUG);
    const volSchema = await checkSchema(VOLUNTARI_SLUG);
    await browser.close();

    console.log("Sector 1 Schema Data:", JSON.stringify(s1Schema, null, 2));
    console.log("Voluntari Schema Data:", JSON.stringify(volSchema, null, 2));

    const { data: s1Page } = await supabase.from('kassia_pages').select('id, slug, page_type').eq('slug', SECTOR1_SLUG).single();
    const { data: volPage } = await supabase.from('kassia_pages').select('id, slug, page_type').eq('slug', VOLUNTARI_SLUG).single();
    const { data: s1Faqs } = await supabase.from('kassia_faqs').select('id, question, answer, page_id, order_index').eq('page_id', s1Page.id);
    const { data: volFaqs } = await supabase.from('kassia_faqs').select('id, question, answer, page_id, order_index').eq('page_id', volPage.id);

    console.log(`Sector 1 DB FAQs count: ${s1Faqs.length}`);
    console.log(`Voluntari DB FAQs count: ${volFaqs.length}`);

    console.log("\n=== FULL RAW TEXT FOR FORBIDDEN TERMS ===");
    const { data: s1Sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', s1Page.id).order('order_index', { ascending: true });
    
    s1Sections.forEach(s => {
        if (s.id === '17493caa-ab66-46f5-85f1-96dd35a2e3b7' || s.id === '13321937-c24f-4bcd-a731-ebe4d24ec239') {
            console.log(`\n--- Section ID: ${s.id} ---`);
            console.log(`Type: ${s.section_type}, Order: ${s.order_index}`);
            console.log(`Full body text:\n${s.content?.body}`);
        }
    });

    s1Faqs.forEach(f => {
        if (f.id === '823e50f8-0144-44f9-8ff9-04c8cbbebf56') {
            console.log(`\n--- FAQ ID: ${f.id} ---`);
            console.log(`Question: ${f.question}`);
            console.log(`Full answer text:\n${f.answer}`);
        }
    });

    console.log("\n=== URL CHECK: /preturi-animatori-copii-bucuresti/ ===");
    try {
        const out = execSync(`curl -sI 'https://www.kassia.ro/preturi-animatori-copii-bucuresti/'`).toString();
        const html = execSync(`curl -sL 'https://www.kassia.ro/preturi-animatori-copii-bucuresti/'`).toString();
        const canon = html.match(/<link rel="canonical" href="([^"]+)"/);
        const robots = html.match(/<meta name="robots" content="([^"]+)"/);
        console.log("Headers:\n", out.split('\n').filter(l => l.toLowerCase().startsWith('http/')).join('\n'));
        console.log("Canonical:", canon ? canon[1] : 'Not found');
        console.log("Robots:", robots ? robots[1] : 'Not found');
    } catch(e) { console.log(e.message); }

    console.log("\n=== ORDER MAP ROW BY ROW ===");
    s1Sections.forEach(s => {
        console.log(JSON.stringify({
            section_id: s.id,
            section_type: s.section_type,
            current_order_index: s.order_index,
            heading: s.heading
        }));
    });
}

run().catch(console.error);
