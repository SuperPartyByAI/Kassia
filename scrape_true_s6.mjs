import puppeteer from 'puppeteer';
import fs from 'fs';

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    // Scrape Sector 6
    await p.goto('https://www.kassia.ro/animatori-petreceri-copii-sector-6/', { waitUntil: 'networkidle2', timeout: 15000 });
    
    const s6Data = await p.evaluate(() => {
        const sections = Array.from(document.querySelectorAll('.content-section')).map((sec, i) => {
            const h2 = sec.querySelector('h2.section-heading')?.innerText || '';
            const h3 = sec.querySelector('h3.section-subheading')?.innerText || '';
            const p = sec.querySelector('.section-body')?.innerText || '';
            return {
                index: i,
                heading: h2,
                subheading: h3,
                body: p,
                wordCount: p.split(/\s+/).filter(w => w.length > 2).length
            };
        });
        
        let totalWords = 0;
        sections.forEach(s => totalWords += s.wordCount);
        
        const faqText = Array.from(document.querySelectorAll('.faq-item, .faq-details')).map(el => el.innerText).join(' ');
        const faqWordCount = faqText.split(/\s+/).filter(w => w.length > 2).length;
        
        return { sections, totalWords, faqWordCount };
    });
    
    // Scrape Voluntari for comparison
    await p.goto('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', { waitUntil: 'networkidle2', timeout: 15000 });
    const volData = await p.evaluate(() => {
        const sections = Array.from(document.querySelectorAll('.content-section')).map((sec, i) => {
            const p = sec.querySelector('.section-body')?.innerText || '';
            return {
                wordCount: p.split(/\s+/).filter(w => w.length > 2).length
            };
        });
        let totalWords = 0;
        sections.forEach(s => totalWords += s.wordCount);
        return { totalWords };
    });

    fs.writeFileSync('/Users/universparty/wa-web-launcher/kassia-site/s6_true_content.json', JSON.stringify({ s6: s6Data, voluntari: volData }, null, 2));
    await browser.close();
}

run().catch(console.error);
