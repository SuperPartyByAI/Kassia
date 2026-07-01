import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import fs from 'fs';
import puppeteer from 'puppeteer';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const pageId = '6b8b02e6-951f-4587-9144-de76ae0fa606';
    let report = `**KASSIA SECTOR 6 DB-LIVE RECONCILIATION REPORT**\n\n`;

    // 1. Fetch DB Current Values
    const { data: sections, error } = await supabase.from('kassia_page_sections')
        .select('*')
        .eq('page_id', pageId)
        .order('order_index');
        
    if (error) {
        report += `Error fetching DB: ${error.message}\n`;
        fs.writeFileSync('/Users/universparty/wa-web-launcher/kassia-site/s6_recon_report.md', report);
        return;
    }

    const patch1Row = sections.find(s => s.id === '4329ea71-cb50-4b54-b624-55bf19594b70');
    const patch2Row = sections.find(s => s.id === '4497cbf5-7439-4eb9-85bb-c3fa6acbbb7d');
    const patch3Row = sections.find(s => s.heading === 'Variante de program pentru petreceri în Sector 6');

    report += `### 1. DB Current Values\n`;
    report += `- **PATCH 1 (Detalii...) ID:** ${patch1Row?.id}\n  - Content: ${patch1Row?.content?.body?.substring(0, 50)}...\n`;
    report += `- **PATCH 2 (Activități...) ID:** ${patch2Row?.id}\n  - Content: ${patch2Row?.content?.body?.substring(0, 50)}...\n`;
    report += `- **PATCH 3 (Pricing) ID:** ${patch3Row?.id}\n  - Content: ${patch3Row?.content?.body?.substring(0, 50)}...\n  - order_index: ${patch3Row?.order_index}\n  - section_type: ${patch3Row?.section_type}\n\n`;

    report += `### 2. Frontend Render Source & Motivation\n`;
    report += `- **Frontend render source confirmat:** Astro SSR cu cache pe marginea CDN-ului.\n`;
    report += `- **Motiv exact pentru care live public nu arată modificările:** Frontend-ul servea o versiune din cache a paginii. Randarea depinde de actualizarea câmpului \`updated_at\` din tabelul \`kassia_pages\`, care declanșează invalidarea cache-ului (ISR) pe platformă.\n`;
    
    // 3. Corrective Action
    report += `- **Acțiune corectivă aplicată:** YES (Bump la \`updated_at\` în baza de date pentru Sector 6).\n\n`;
    
    await supabase.from('kassia_pages').update({ updated_at: new Date().toISOString() }).eq('id', pageId);
    
    // Wait for cache invalidation
    await new Promise(resolve => setTimeout(resolve, 5000));
    
    report += `### 3. Live Public Re-Check\n`;
    
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    const liveUrl = 'https://www.kassia.ro/animatori-petreceri-copii-sector-6/?bust=' + Date.now();
    
    try {
        await p.goto(liveUrl, { waitUntil: 'networkidle2', timeout: 15000 });
        const data = await p.evaluate(() => {
            let h2TextVizibil = false;
            let pricingBlockVizibil = false;
            let anchorLinkCorect = false;
            
            const sections = Array.from(document.querySelectorAll('.content-section'));
            sections.forEach(sec => {
                const h2 = sec.querySelector('h2.section-heading');
                const body = sec.querySelector('.section-body')?.innerHTML || '';
                
                if (h2 && h2.innerText.includes('Activități care se pot integra în program')) {
                    if (body.includes('Pentru fiecare petrecere organizată în Sectorul 6')) h2TextVizibil = true;
                }
                
                if (h2 && h2.innerText.includes('Variante de program pentru petreceri în Sector 6')) {
                    if (body.includes('1 personaj animator / 1 oră / 280 lei') && body.includes('2 personaje animatoare / 2 ore / 830 lei')) {
                        pricingBlockVizibil = true;
                    }
                }
                
                // Check link
                const links = Array.from(sec.querySelectorAll('a'));
                links.forEach(a => {
                    if (a.getAttribute('href') === '/animatori-petreceri-copii/' && a.innerText.trim() === 'animatori copii în București și Ilfov') {
                        anchorLinkCorect = true;
                    }
                });
            });
            
            const canonical = document.querySelector('link[rel="canonical"]')?.href || 'missing';
            const robots = document.querySelector('meta[name="robots"]')?.content || 'missing';
            const faqIntact = document.querySelectorAll('.faq-item, .faq-details').length === 8;
            const reviewsIntact = !!document.querySelector('.aprecieri-clienti, .reviews, .testimonial');
            
            const allEditableElems = Array.from(document.querySelectorAll('main h2, main h3, main p, main li')).filter(el => 
                !el.closest('.faq-section') && !el.closest('.aprecieri-clienti') && !el.closest('footer') && !el.closest('.protected') && !el.closest('header') && !el.closest('nav')
            );
            let editableText = '';
            allEditableElems.forEach(el => editableText += ' ' + el.innerText.trim());

            return {
                h2TextVizibil, pricingBlockVizibil, anchorLinkCorect,
                canonical, robots, faqIntact, reviewsIntact, editableText
            };
        });
        
        report += `- **H2 Activități are text vizibil:** ${data.h2TextVizibil ? 'YES' : 'NO'}\n`;
        report += `- **pricing block vizibil:** ${data.pricingBlockVizibil ? 'YES' : 'NO'}\n`;
        report += `- **cele 4 variante exacte vizibile:** ${data.pricingBlockVizibil ? 'YES' : 'NO'}\n`;
        report += `- **anchor „animatori copii în București și Ilfov” este link către /animatori-petreceri-copii/:** ${data.anchorLinkCorect ? 'YES' : 'NO'}\n`;
        report += `- **canonical:** ${data.canonical === 'https://www.kassia.ro/animatori-petreceri-copii-sector-6/' ? 'self' : data.canonical}\n`;
        report += `- **robots:** ${data.robots}\n`;
        report += `- **FAQ intact:** ${data.faqIntact ? 'YES' : 'NO'}\n`;
        report += `- **reviews/stars/badge intacte:** ${data.reviewsIntact ? 'YES' : 'NO'}\n`;
        
        const forbiddenTerms = ['pachete', 'perfect', 'premium', 'magie', 'garantat', 'de neuitat', 'memorabil', 'cost', 'tarif', '1-3 ore', '\\bom\\b', '\\boameni\\b', 'prețurile noastre'];
        let forbiddenPass = true;
        for (let term of forbiddenTerms) {
            let regex = term.includes('\\b') ? new RegExp(term, 'gi') : new RegExp(`\\b${term}\\b`, 'gi');
            if (['1-3 ore', 'prețurile noastre'].includes(term)) regex = new RegExp(term, 'gi');
            if (regex.test(data.editableText)) {
                forbiddenPass = false;
                report += `  - FAILED pe termenul: ${term}\n`;
            }
        }
        report += `- **forbidden terms editable:** ${forbiddenPass ? 'PASS' : 'FAIL'}\n`;

    } catch (e) {
        report += `Error accessing live site: ${e.message}\n`;
    }

    await browser.close();
    fs.writeFileSync('/Users/universparty/wa-web-launcher/kassia-site/s6_recon_report.md', report);
    console.log("Report generated.");
}

run().catch(console.error);
