import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import puppeteer from 'puppeteer';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function runDetailedQA() {
    console.log("=== DB AUDIT ===");
    const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db';
    
    // Read backup
    let backupSections = [];
    if (fs.existsSync('mainhub_backup.json')) {
        const backupData = JSON.parse(fs.readFileSync('mainhub_backup.json', 'utf8'));
        backupSections = backupData.sections.sort((a, b) => a.order_index - b.order_index);
    }
    
    // Read current
    const { data: currentSectionsRaw } = await supabase.from('kassia_page_sections')
        .select('*').eq('page_id', pageId).order('order_index');
    
    console.log(`Backup Sections Count: ${backupSections.length}`);
    console.log(`Current Sections Count: ${currentSectionsRaw.length}`);
    console.log(`\nDeleted row info (Social Proof Intro):`);
    const deletedRow = backupSections.find(s => !currentSectionsRaw.some(c => c.id === s.id) && s.section_type === 'content_block');
    if (deletedRow) {
        console.log(`ID: ${deletedRow.id} | Type: ${deletedRow.section_type} | Order: ${deletedRow.order_index} | Heading: ${deletedRow.heading || 'null'} | Content: ${JSON.stringify(deletedRow.content).substring(0, 50)}...`);
    } else {
        console.log("No specific deleted row found or multiple found.");
    }
    
    console.log(`\nFull Backup DB List:`);
    backupSections.forEach(s => console.log(`[${s.order_index}] ${s.section_type} | ${s.heading}`));
    
    console.log(`\nFull Current DB List:`);
    currentSectionsRaw.forEach(s => console.log(`[${s.order_index}] ${s.section_type} | ${s.heading}`));
    
    console.log("\n=== PUPPETEER LIVE QA ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    
    const errors = [];
    const failedRequests = [];
    
    const p = await browser.newPage();
    
    p.on('console', msg => {
        if (msg.type() === 'error') {
            errors.push(`Console Error: ${msg.text()}`);
        }
    });
    p.on('pageerror', err => {
        errors.push(`Page Error: ${err.message}`);
    });
    p.on('requestfailed', request => {
        failedRequests.push(`Request Failed: ${request.url()} - ${request.failure()?.errorText}`);
    });
    p.on('response', response => {
        if (response.status() >= 400 && response.request().resourceType() !== 'fetch') {
            failedRequests.push(`Asset >= 400: ${response.url()} [${response.status()}]`);
        }
    });

    const response = await p.goto('https://www.kassia.ro/animatori-petreceri-copii/', { waitUntil: 'networkidle0' });
    const html = await p.content();
    
    console.log(`HTTP status: ${response.status()}`);
    console.log(`Canonical: ${html.includes('rel="canonical" href="https://www.kassia.ro/animatori-petreceri-copii/"')}`);
    console.log(`Robots: ${html.includes('name="robots" content="index, follow"')}`);
    
    // Reviews Render Check
    const reviewData = await p.evaluate(() => {
        const carousel = document.querySelector('.aprecieri-slider');
        const badge = document.querySelector('.google-trust-badge');
        const stele = Array.from(document.querySelectorAll('.apreciere-stele')).length > 0;
        const eapps = document.querySelector('[class*="elfsight-app-"]');
        return {
            carouselVisible: !!carousel,
            steleVisible: !!stele,
            googleBadgeVisible: !!badge,
            elfsightVisible: !!eapps
        };
    });
    
    await p.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/desktop_reviews.png', fullPage: true });
    
    console.log(`\nProtected Reviews Render Audit:`);
    console.log(`carousel/testimonials visible: ${reviewData.carouselVisible ? 'YES' : 'NO'}`);
    console.log(`stele visible: ${reviewData.steleVisible ? 'YES' : 'NO'}`);
    console.log(`google badge visible: ${reviewData.googleBadgeVisible ? 'YES' : 'NO'}`);
    console.log(`elfsight widget: ${reviewData.elfsightVisible ? 'YES' : 'NO'}`);
    console.log(`Screenshots saved: YES (desktop_reviews.png)`);
    
    // FAQ Count Check
    const domFaqs = await p.evaluate(() => {
        // Find specific FAQ wrappers based on text
        const headings = Array.from(document.querySelectorAll('div, h3, p')).filter(el => 
            el.innerText && el.innerText.includes('Când alegem un personaj animator și când sunt necesare două')
        );
        return headings.map(h => h.innerText.trim());
    });
    
    const schemaMatch = html.match(/"@type":"Question"/g) || [];
    console.log(`\nFAQ Schema count: ${schemaMatch.length}`);
    console.log(`DOM FAQ specific title occurrences ('Când alegem un personaj...'): ${domFaqs.length}`);
    
    const allTitles = await p.evaluate(() => {
        // Collect all potential FAQ titles based on the FAQ structure
        const nodes = Array.from(document.querySelectorAll('.faq-item summary, .faq-question, h3'));
        return nodes.map(n => n.innerText.trim()).filter(t => t.endsWith('?'));
    });
    const uniqueTitles = new Set(allTitles);
    const duplicates = allTitles.filter((item, index) => allTitles.indexOf(item) !== index);
    
    console.log(`unique FAQ titles count: ${uniqueTitles.size}`);
    console.log(`duplicate FAQ titles list: ${duplicates.length > 0 ? duplicates.join(', ') : 'NONE'}`);
    
    // Pictură pe față occurrences
    console.log(`\nRe-checking "pictură pe față"...`);
    const picturaNodes = await p.evaluate(() => {
        const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, null, false);
        const results = [];
        let node;
        while (node = walker.nextNode()) {
            if (node.nodeValue.toLowerCase().includes('pictură pe față') || node.nodeValue.toLowerCase().includes('pictura pe fata')) {
                let parent = node.parentElement;
                let container = parent.tagName;
                let id = parent.id ? `#${parent.id}` : '';
                let cls = parent.className ? `.${parent.className.replace(/ /g, '.')}` : '';
                
                // Find closest semantic parent (header, footer, main, section)
                let semanticParent = parent.closest('footer, header, nav, .aprecieri-clienti, .elfsight-app');
                let protectedArea = !!semanticParent;
                let areaName = semanticParent ? semanticParent.tagName.toLowerCase() : 'editable_content';
                
                results.push({
                    text: node.nodeValue.trim(),
                    container: `${container}${id}${cls}`,
                    areaName: areaName,
                    isProtected: protectedArea
                });
            }
        }
        return results;
    });
    
    if (picturaNodes.length === 0) {
        console.log("No occurrences found.");
    } else {
        picturaNodes.forEach((n, i) => {
            console.log(`[Occurrence ${i+1}]`);
            console.log(`- Snippet: "${n.text}"`);
            console.log(`- Container/Section: ${n.container} (inside ${n.areaName})`);
            console.log(`- Protected: ${n.isProtected ? 'YES' : 'NO'}`);
            console.log(`- In meta / FAQ / editable content: ${n.isProtected ? 'NO' : 'YES'}`);
        });
    }
    
    console.log(`\nrequestfailed list: ${failedRequests.length > 0 ? failedRequests.join(' | ') : 'NONE'}`);
    console.log(`console.error list: ${errors.length > 0 ? errors.join(' | ') : 'NONE'}`);
    
    await browser.close();
}

runDetailedQA().catch(console.error);
