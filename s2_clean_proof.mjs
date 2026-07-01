import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import { execSync } from 'child_process';
import * as cheerio from 'cheerio';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = 'f1e7d23a-c1a7-4c92-b4ff-5716df63309a'; // Sector 2
const URL = 'https://www.kassia.ro/animatori-petreceri-copii-sector-2/';

async function run() {
    console.log("=== Live canonical proof ===");
    console.log(execSync(`curl -sI ${URL}`).toString().trim());
    const html = execSync(`curl -sL ${URL}`).toString();
    const $ = cheerio.load(html);
    console.log("canonical grep:", $('link[rel="canonical"]').attr('href'));
    console.log("robots grep:", $('meta[name="robots"]').attr('content'));

    console.log("\n=== Sitemap proof ===");
    try {
        console.log(execSync('curl -sL https://www.kassia.ro/sitemap.xml | grep "animatori-petreceri-copii-sector-2"').toString().trim());
    } catch(e) { console.log("NOT FOUND IN SITEMAP"); }

    console.log("\n=== Pricing proof ===");
    const prices = ['Alege Pachetul Potrivit', '280\\s*lei', '490\\s*lei', '830\\s*lei'];
    prices.forEach(p => {
        const re = new RegExp(p, 'gi');
        console.log(`grep live ${p}: ${html.match(re) ? 'FOUND' : 'NOT FOUND'}`);
    });

    console.log("\n=== Micro-block proof ===");
    const mbTerms = [
        'Cum adaptăm programul pentru locațiile din Sectorul 2',
        'Colentina',
        '10-12 copii',
        'peste 12-15 copii'
    ];
    mbTerms.forEach(t => {
        console.log(`grep live ${t}: ${html.includes(t) ? 'FOUND' : 'NOT FOUND'}`);
    });

    console.log("\n=== FAQ proof ===");
    const faqs = $('details.faq-details');
    console.log(`FAQ visible count: ${faqs.length}`);
    console.log(`FAQ schema count: ${html.match(/@type":\s*"FAQPage/gi) ? 'YES' : 'NO'}`);
    let faqList = [];
    faqs.each((i, el) => {
        faqList.push({ q: $(el).find('summary').text().trim(), a: $(el).find('.faq-answer').text().trim() });
    });
    console.log("lista celor 8 FAQ live:");
    console.log(JSON.stringify(faqList, null, 2));
    
    // Check duplication
    const uniqueFaqs = new Set(faqList.map(f => f.q));
    console.log(`FAQ nu s-a duplicat: ${uniqueFaqs.size === faqList.length && faqList.length === 8 ? 'YES' : 'NO'}`);

    console.log("\n=== Forbidden proof ===");
    const editableText = $('#content').text().toLowerCase() + $('.faq-section').text().toLowerCase();
    const protectedText = $('footer').text().toLowerCase() + $('.reviews-carousel').text().toLowerCase();
    
    const pictura = "pictură pe față";
    const pachete = "/pachete-animatori-copii-bucuresti/";
    
    console.log("editable matches:");
    console.log(`pictură pe față: ${editableText.includes(pictura) ? 'FAIL' : 'PASS (NOT FOUND)'}`);
    console.log(`/pachete-animatori-copii-bucuresti/: ${editableText.includes(pachete) ? 'FAIL' : 'PASS (NOT FOUND)'}`);
    
    console.log("protected matches:");
    console.log(`pictură pe față: ${protectedText.includes(pictura) ? 'FOUND (IGNORED)' : 'NOT FOUND'}`);

    console.log("\n=== DB proof ===");
    const { data: page } = await supabase.from('kassia_pages').select('id,slug,show_pricing_preview,status,index_status,include_in_sitemap,canonical_url').eq('id', PAGE_ID).single();
    console.log("kassia_pages row:");
    console.log(JSON.stringify(page, null, 2));

    const { data: mbRow } = await supabase.from('kassia_page_sections').select('page_id,section_type,order_index,heading,subheading,content').eq('heading', 'Cum adaptăm programul pentru locațiile din Sectorul 2').eq('page_id', PAGE_ID).single();
    console.log("micro-block row complet:");
    console.log(JSON.stringify(mbRow, null, 2));

    const { data: faqRow } = await supabase.from('kassia_faqs').select('id,question,answer').eq('id', 'f6ef8400-0138-45f7-b406-b80bb6634fb5').single();
    console.log("FAQ row modificat complet:");
    console.log(JSON.stringify(faqRow, null, 2));

}
run().catch(console.error);
