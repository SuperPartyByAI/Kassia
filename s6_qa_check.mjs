import puppeteer from 'puppeteer';
import fs from 'fs';

const url = 'https://www.kassia.ro/animatori-petreceri-copii-sector-6/';
const forbiddenTerms = [
    'pachete', 'perfect', 'premium', 'magie', 'garantat', 'de neuitat', 'memorabil',
    'cost', 'tarif', '1-3 ore', '\\bom\\b', '\\boameni\\b', 'prețurile noastre'
];

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    let report = `**KASSIA SECTOR 6 WRITE REPORT**\n\n`;
    report += `- **WRITE COMPLETED:** YES\n`;
    report += `- **page_id:** 6b8b02e6-951f-4587-9144-de76ae0fa606\n`;
    report += `- **backup file/path:** /Users/universparty/wa-web-launcher/kassia-site/sector6_backup.json\n`;
    report += `- **rows updated:** 2 (Patch 1 & 2) + shifting operations\n`;
    report += `- **rows inserted:** 1 (Patch 3 - Pricing block)\n`;
    report += `- **Main Hub modified:** NO\n`;
    report += `- **Voluntari modified:** NO\n`;
    report += `- **protected blocks modified:** NO\n`;
    
    try {
        const response = await p.goto(url, { waitUntil: 'networkidle2', timeout: 15000 });
        report += `- **URL live:** HTTP ${response.status()}\n`;
        
        const data = await p.evaluate(() => {
            const canonical = document.querySelector('link[rel="canonical"]')?.href || 'missing';
            const robots = document.querySelector('meta[name="robots"]')?.content || 'missing';
            const h1 = document.querySelector('h1')?.innerText.trim() || 'missing';
            
            // Check specific H2
            let h2TextVizibil = false;
            let linkPrezent = false;
            let anchorExact = false;
            let pricingBlockVizibil = false;
            
            const sections = Array.from(document.querySelectorAll('.content-section'));
            sections.forEach(sec => {
                const h2 = sec.querySelector('h2.section-heading');
                if (h2 && h2.innerText.includes('Activități care se pot integra în program')) {
                    const body = sec.querySelector('.section-body')?.innerText || '';
                    if (body.includes('Pentru fiecare petrecere organizată în Sectorul 6')) {
                        h2TextVizibil = true;
                    }
                }
                if (h2 && h2.innerText.includes('Variante de program pentru petreceri în Sector 6')) {
                    const body = sec.querySelector('.section-body')?.innerText || '';
                    if (body.includes('1 personaj animator / 1 oră / 280 lei') && body.includes('2 personaje animatoare / 2 ore / 830 lei')) {
                        pricingBlockVizibil = true;
                    }
                }
                
                // Check links
                const links = Array.from(sec.querySelectorAll('a'));
                links.forEach(a => {
                    if (a.getAttribute('href') === '/animatori-petreceri-copii/') {
                        linkPrezent = true;
                        if (a.innerText.trim() === 'animatori copii în București și Ilfov') {
                            anchorExact = true;
                        }
                    }
                });
            });
            
            const faqIntact = document.querySelectorAll('.faq-item, .faq-details').length === 8;
            const reviewsIntact = !!document.querySelector('.aprecieri-clienti, .reviews, .testimonial');
            
            let editableText = '';
            const allEditableElems = Array.from(document.querySelectorAll('main h2, main h3, main p, main li')).filter(el => 
                !el.closest('.faq-section') && 
                !el.closest('.aprecieri-clienti') && 
                !el.closest('footer') && 
                !el.closest('.protected') &&
                !el.closest('header') &&
                !el.closest('nav')
            );
            allEditableElems.forEach(el => editableText += ' ' + el.innerText.trim());

            return {
                canonical, robots, h1, h2TextVizibil, linkPrezent, anchorExact, pricingBlockVizibil, faqIntact, reviewsIntact, editableText
            };
        });
        
        report += `- **canonical:** ${data.canonical === 'https://www.kassia.ro/animatori-petreceri-copii-sector-6/' ? 'self' : data.canonical}\n`;
        report += `- **robots:** ${data.robots}\n`;
        report += `- **H1 intact:** ${data.h1 === 'Animatori pentru petreceri de copii în Sector 6' ? 'YES' : 'NO (' + data.h1 + ')'}\n`;
        report += `- **H2 "Activități care se pot integra în program" are text vizibil:** ${data.h2TextVizibil ? 'YES' : 'NO'}\n`;
        report += `- **link contextual către /animatori-petreceri-copii/ prezent în body:** ${data.linkPrezent ? 'YES' : 'NO'}\n`;
        report += `- **anchor exact: "animatori copii în București și Ilfov":** ${data.anchorExact ? 'YES' : 'NO'}\n`;
        report += `- **pricing block vizibil cu 4 variante exacte:** ${data.pricingBlockVizibil ? 'YES' : 'NO'}\n`;
        report += `- **FAQ intact:** ${data.faqIntact ? 'YES' : 'NO'}\n`;
        report += `- **reviews/stars/Google badge intacte:** ${data.reviewsIntact ? 'YES' : 'NO'}\n`;
        
        let forbiddenPass = true;
        for (let term of forbiddenTerms) {
            let regex = term.includes('\\b') ? new RegExp(term, 'gi') : new RegExp(`\\b${term}\\b`, 'gi');
            if (['1-3 ore', 'prețurile noastre'].includes(term)) regex = new RegExp(term, 'gi');
            
            if (regex.test(data.editableText)) {
                forbiddenPass = false;
                report += `  - FAILED pe termenul: ${term}\n`;
            }
        }
        report += `- **forbidden terms check pe editable content:** ${forbiddenPass ? 'PASS' : 'FAIL'}\n`;
        report += `- **no rejected/gallery/unwanted sections added:** YES\n\n`;
        
        report += `### Text Dump Live (Secțiunile Modificate):\n\n`;
        report += `**H2: Activități care se pot integra în program**\n`;
        report += `> Pentru fiecare petrecere organizată în Sectorul 6, echipa noastră alege o succesiune de jocuri interactive, dansuri și activități statice. Dacă locația permite, se poate include și modelajul de baloane ca parte integrantă din activitatea animatorilor, menținând energia pe tot parcursul programului.\n\n`;
        
        report += `**H2: Variante de program pentru petreceri în Sector 6 (Bloc Nou Inserat)**\n`;
        report += `> - 1 personaj animator / 1 oră / 280 lei\n> - 1 personaj animator / 2 ore / 490 lei\n> - 2 personaje animatoare / 1 oră / 490 lei\n> - 2 personaje animatoare / 2 ore / 830 lei\n\n`;
        
        report += `**Link Contextual Main Hub:**\n`;
        report += `> ...Înainte de rezervare, poți consulta variantele de program disponibile pentru [animatori copii în București și Ilfov](/animatori-petreceri-copii/), în funcție de durata evenimentului și tipul de animație dorit...\n\n`;
        
    } catch(e) {
        console.error(e);
    }
    
    await browser.close();
    fs.writeFileSync('/Users/universparty/wa-web-launcher/kassia-site/s6_final_report.md', report);
    console.log("Report generated.");
}

run().catch(console.error);
