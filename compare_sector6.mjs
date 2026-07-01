import puppeteer from 'puppeteer';
import fs from 'fs';

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    const pages = [
        { name: 'Sector 6', url: 'https://www.kassia.ro/animatori-petreceri-copii-sector-6/' },
        { name: 'Voluntari', url: 'https://www.kassia.ro/animatori-petreceri-copii-voluntari/' },
        { name: 'Main Hub', url: 'https://www.kassia.ro/animatori-petreceri-copii/' }
    ];
    
    let report = '';
    
    for (const page of pages) {
        await p.goto(page.url, { waitUntil: 'networkidle2', timeout: 20000 });
        
        const data = await p.evaluate(() => {
            const hasPricing = !!document.querySelector('.pricing, .pachete-pricing, [data-component="pricing"], .pricing-block');
            const hasReviews = !!document.querySelector('.aprecieri-clienti, .reviews, .testimonial');
            const faqCount = document.querySelectorAll('.faq-item, details').length;
            
            const hasWhatsApp = !!document.querySelector('a[href*="wa.me"]');
            
            const links = Array.from(document.querySelectorAll('main a, body > a, .main-content a'));
            const hasLinkToMainHub = links.some(a => (a.getAttribute('href') || '').includes('/animatori-petreceri-copii/'));
            const hasLinkToPersonaje = links.some(a => (a.getAttribute('href') || '').includes('/personaje'));
            
            const robots = document.querySelector('meta[name="robots"]')?.content || 'missing';
            const canonical = document.querySelector('link[rel="canonical"]')?.href || 'missing';
            
            // editable content
            let editable = '';
            const allEditableElems = Array.from(document.querySelectorAll('main h2, main h3, main p, main li')).filter(el => 
                !el.closest('.faq-section') && 
                !el.closest('.aprecieri-clienti') && 
                !el.closest('footer') && 
                !el.closest('.protected') &&
                !el.closest('header') &&
                !el.closest('nav')
            );
            allEditableElems.forEach(el => editable += ' ' + el.innerText.trim());
            const wordCount = editable.split(/\s+/).filter(w => w.length > 2).length;

            return {
                hasPricing, hasReviews, faqCount, hasWhatsApp, hasLinkToMainHub, hasLinkToPersonaje, robots, canonical, wordCount
            };
        });
        
        report += `--- ${page.name} ---\n`;
        report += JSON.stringify(data, null, 2) + '\n\n';
    }
    
    fs.writeFileSync('/Users/universparty/wa-web-launcher/kassia-site/sector6_gap.json', report);
    await browser.close();
}

run().catch(console.error);
