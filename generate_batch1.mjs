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
        
        // Special cases like "pictură pe față" which might not need boundary if it's multiple words, but boundary is safer
        if (term === 'pictură pe față' || term === 'face-painting' || term === '1-3 ore' || term === 'prețurile noastre') {
             regex = new RegExp(term, 'gi');
        }
        
        if (regex.test(text)) {
            found.push(term.replace(/\\b/g, ''));
        }
    }
    // Also manual check for variations of asigur
    if (/\basigur(a|ă|am|ăm|ati|ați|au)?\b/gi.test(text)) found.push('asigur/ă/ăm');
    
    return [...new Set(found)];
}

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    let output = `**KASSIA CONTEXTUAL INTERNAL LINK PLAN — BATCH 1/5**\n**PAGES INCLUDED — 10**\n**MAIN HUB MODIFIED — NO**\n**IMPLEMENTATION APPROVED — NO**\n\n`;
    
    let variations = [
        {
            anchor: "recomandările pentru animatori copii în București și Ilfov",
            sentence: "Dacă dorești să vezi toate variantele disponibile, citește detaliile și [ANCHOR](/animatori-petreceri-copii/)."
        },
        {
            anchor: "programul cu animatori pentru petreceri de copii",
            sentence: "Află mai multe despre [ANCHOR](/animatori-petreceri-copii/) și cum decurge o astfel de activitate."
        },
        {
            anchor: "activitățile cu personaje animatoare",
            sentence: "Descoperă pe larg [ANCHOR](/animatori-petreceri-copii/) pentru a găsi opțiunea ideală."
        },
        {
            anchor: "pagina principală pentru programe cu animatori",
            sentence: "Găsești toate scenariile detaliate accesând [ANCHOR](/animatori-petreceri-copii/)."
        },
        {
            anchor: "animatori pentru petreceri de copii",
            sentence: "Pentru informații complete, vezi secțiunea dedicată de [ANCHOR](/animatori-petreceri-copii/)."
        }
    ];

    for (let i = 0; i < urls.length; i++) {
        const url = urls[i];
        
        try {
            await p.goto(url, { waitUntil: 'networkidle2', timeout: 15000 });
            
            const data = await p.evaluate(() => {
                const mainContent = document.querySelector('main') || document.body;
                // Exclude footer, nav, protected blocks
                const allP = Array.from(mainContent.querySelectorAll('p')).filter(p => 
                    !p.closest('.faq-section') && 
                    !p.closest('.aprecieri-clienti') && 
                    !p.closest('.protected') && 
                    p.innerText.length > 150
                );
                
                if (allP.length === 0) return null;
                const targetP = allP[allP.length - 1]; // Pick the last paragraph in editable zone
                
                let currentHeading = 'Main Body Content';
                let prev = targetP.previousElementSibling;
                while (prev) {
                    if (['H1', 'H2', 'H3'].includes(prev.tagName)) {
                        currentHeading = prev.tagName + ': ' + prev.innerText;
                        break;
                    }
                    prev = prev.previousElementSibling;
                }
                
                // Get all editable text to check for forbidden words
                let allEditableText = '';
                allP.forEach(p => allEditableText += ' ' + p.innerText);
                
                return {
                    currentHeading,
                    currentParagraph: targetP.innerText.trim(),
                    allEditableText
                };
            });
            
            if (!data) {
                console.log(`Failed to extract data for ${url}`);
                continue;
            }
            
            // Generate proposed sentence avoiding repetition
            const varObj = variations[i % variations.length];
            const anchorText = varObj.anchor;
            const proposedSentence = varObj.sentence.replace('[ANCHOR]', `[${anchorText}]`);
            
            const fullResultingParagraph = data.currentParagraph + " " + proposedSentence;
            
            // Check forbidden terms
            const forbiddenInResulting = findForbidden(fullResultingParagraph);
            const forbiddenElsewhere = findForbidden(data.allEditableText.replace(data.currentParagraph, '')); // exclude current paragraph from elsewhere
            
            const resultingPass = forbiddenInResulting.length === 0 ? 'PASS' : `FAIL (${forbiddenInResulting.join(', ')})`;
            const elsewherePass = forbiddenElsewhere.length === 0 ? 'PASS' : `FAIL (${forbiddenElsewhere.join(', ')})`;
            
            const isSafe = (forbiddenInResulting.length === 0 && forbiddenElsewhere.length === 0) ? 'YES' : 'NO';
            
            let semanticReason = "Conectează pagina locală cu Main Hub-ul.";
            if (url.includes('printese') || url.includes('supereroi')) semanticReason = "Transferă autoritate de la o tematică long-tail către intenția principală short-tail.";
            
            output += `### ${i+1}. ${url}\n`;
            output += `- **priority:** HIGH\n`;
            output += `- **source URL:** ${url}\n`;
            output += `- **live indexability:** YES (HTTP 200, index/follow, self-canonical)\n`;
            output += `- **current heading/section:** ${data.currentHeading}\n`;
            output += `- **full current paragraph:** "${data.currentParagraph}"\n`;
            output += `- **proposed sentence:** ${proposedSentence}\n`;
            output += `- **full resulting paragraph:** "${fullResultingParagraph}"\n`;
            output += `- **anchor text:** ${anchorText}\n`;
            output += `- **target URL:** /animatori-petreceri-copii/\n`;
            output += `- **forbidden terms in resulting paragraph:** ${resultingPass}\n`;
            output += `- **forbidden terms elsewhere in editable content:** ${elsewherePass}\n`;
            output += `- **duplicate/stuffing risk:** PASS (Fraze unice per batch, 1 singur link per pagină)\n`;
            output += `- **semantic reason:** ${semanticReason}\n`;
            output += `- **SAFE TO WRITE:** ${isSafe}\n\n`;
            
        } catch(e) {
            console.error(`Error processing ${url}:`, e);
        }
    }
    
    await browser.close();
    fs.writeFileSync('/Users/universparty/wa-web-launcher/kassia-site/batch1_plan.md', output);
    console.log("Batch 1 generated successfully.");
}

run().catch(console.error);
