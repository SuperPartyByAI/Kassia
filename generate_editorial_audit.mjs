import puppeteer from 'puppeteer';
import fs from 'fs';

const urls = [
    'https://www.kassia.ro/animatori-petreceri-copii-sector-2/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-3/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-4/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-5/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-6/',
    'https://www.kassia.ro/animatori-petreceri-copii-popesti-leordeni/',
    'https://www.kassia.ro/animatori-petreceri-copii-berceni/',
    'https://www.kassia.ro/animatori-petreceri-copii-voluntari/',
    'https://www.kassia.ro/animatori-printese-bucuresti/',
    'https://www.kassia.ro/animatori-supereroi-bucuresti/'
];

const forbiddenTerms = [
    'pachete', 'perfect', 'premium', 'magie', 'garantat', 'de neuitat', 'memorabil',
    'asigur', 'asigură', 'asigurăm', 'prețurile noastre', 'pictură pe față', 'face-painting',
    'cost', 'tarif', '1-3 ore', '\\bom\\b', '\\boameni\\b'
];

function findForbidden(text) {
    if (!text) return [];
    const found = [];
    for (let term of forbiddenTerms) {
        let regex;
        if (term.includes('\\b')) {
            regex = new RegExp(term, 'gi');
        } else {
            regex = new RegExp(`\\b${term}\\b`, 'gi');
        }
        
        if (['pictură pe față', 'face-painting', '1-3 ore', 'prețurile noastre'].includes(term)) {
             regex = new RegExp(term, 'gi');
        }
        
        if (regex.test(text)) {
            found.push(term.replace(/\\b/g, ''));
        }
    }
    if (/\basigur(a|ă|am|ăm|ati|ați|au)?\b/gi.test(text)) found.push('asigur/ă/ăm');
    return [...new Set(found)];
}

function findContamination(text) {
    if (!text) return null;
    const contaminationRegex = /\b(baloane|nuntă|nunți|corporate)\b/i;
    const match = text.match(contaminationRegex);
    if (match) {
        // extract snippet of 100 characters around the match
        const index = match.index;
        const start = Math.max(0, index - 50);
        const end = Math.min(text.length, index + 50);
        let snippet = text.substring(start, end).replace(/\n/g, ' ').trim();
        return { matched: true, snippet: '... ' + snippet + ' ...' };
    }
    return { matched: false };
}

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    let output = `**KASSIA SOURCE PAGE EDITORIAL RISK AUDIT — BATCH 1**\n\n`;

    for (let i = 0; i < urls.length; i++) {
        const url = urls[i];
        
        try {
            const response = await p.goto(url, { waitUntil: 'networkidle2', timeout: 15000 });
            const liveStatus = response.status();
            
            const data = await p.evaluate(() => {
                const canonical = document.querySelector('link[rel="canonical"]')?.href || 'missing';
                const robots = document.querySelector('meta[name="robots"]')?.content || 'missing';
                const h1 = document.querySelector('h1')?.innerText.trim() || 'missing';
                
                const mainContent = document.querySelector('main') || document.body;
                
                // Get all editable text
                const allEditableElems = Array.from(mainContent.querySelectorAll('h2, h3, p, li')).filter(el => 
                    !el.closest('.faq-section') && 
                    !el.closest('.aprecieri-clienti') && 
                    !el.closest('footer') && 
                    !el.closest('.protected')
                );
                
                let allEditableText = '';
                allEditableElems.forEach(el => allEditableText += ' ' + el.innerText);
                
                // Check if structure has blocks (e.g. pricing, review blocks, areas) typical of Main Hub/Voluntari
                const hasPricing = !!document.querySelector('.pricing-block, .pachete-pricing, [data-component="pricing"]');
                const hasReviews = !!document.querySelector('.aprecieri-clienti, .reviews');
                
                return {
                    canonical,
                    robots,
                    h1,
                    allEditableText,
                    hasPricing,
                    hasReviews
                };
            });
            
            const forbiddenFound = findForbidden(data.allEditableText);
            const contam = findContamination(data.allEditableText);
            
            let mainIntent = 'Servicii animatori local/tematic';
            if (url.includes('voluntari')) mainIntent = 'Animatori Ilfov - Voluntari';
            
            let isUnderVoluntari = (data.hasPricing && data.hasReviews) ? 'NO' : 'YES';
            
            let recommended = 'CLEANUP REQUIRED';
            if (forbiddenFound.length === 0 && !contam.matched && isUnderVoluntari === 'NO') {
                recommended = 'SAFE FOR LINK ONLY';
            }
            if (url.includes('voluntari')) {
                recommended = 'MARK AS REFERENCE PAGE — DO NOT MODIFY';
            }
            
            output += `### ${i+1}. ${url}\n`;
            output += `- **source URL:** ${url}\n`;
            output += `- **live status:** HTTP ${liveStatus}\n`;
            output += `- **canonical:** ${data.canonical}\n`;
            output += `- **robots:** ${data.robots}\n`;
            output += `- **H1:** ${data.h1}\n`;
            output += `- **main intent:** ${mainIntent}\n`;
            
            if (contam.matched) {
                output += `- **contaminare baloane/nuntă/corporate:** YES (${contam.snippet})\n`;
            } else {
                output += `- **contaminare baloane/nuntă/corporate:** NO\n`;
            }
            
            output += `- **forbidden terms:** ${forbiddenFound.length > 0 ? forbiddenFound.join(', ') : 'NONE'}\n`;
            
            // Assume the contamination was found in editable text since we only scanned allEditableText
            output += `- **protected area sau editable:** Editable Content\n`;
            output += `- **structură sub Voluntari/Main Hub:** ${isUnderVoluntari}\n`;
            output += `- **recomandare:** ${recommended}\n\n`;
            
        } catch(e) {
            console.error(`Error processing ${url}:`, e);
        }
    }
    
    await browser.close();
    fs.writeFileSync('/Users/universparty/wa-web-launcher/kassia-site/batch1_audit.md', output);
    console.log("Audit generated successfully.");
}

run().catch(console.error);
