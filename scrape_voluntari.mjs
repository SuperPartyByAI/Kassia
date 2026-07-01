import puppeteer from 'puppeteer';
import fs from 'fs';

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    await p.goto('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', { waitUntil: 'networkidle2', timeout: 20000 });
    
    const data = await p.evaluate(() => {
        const h2s = Array.from(document.querySelectorAll('main h2')).map(el => {
            let next = el.nextElementSibling;
            let pCount = 0;
            let text = '';
            while(next && next.tagName !== 'H2' && next.tagName !== 'H3') {
                if(next.tagName === 'P') {
                    pCount++;
                    text += ' ' + next.innerText;
                }
                next = next.nextElementSibling;
            }
            return {
                heading: el.innerText,
                pCount: pCount,
                textSample: text.trim().substring(0, 100) + '...'
            }
        });
        
        return h2s;
    });
    
    fs.writeFileSync('/Users/universparty/wa-web-launcher/kassia-site/voluntari_h2s.json', JSON.stringify(data, null, 2));
    await browser.close();
}

run().catch(console.error);
