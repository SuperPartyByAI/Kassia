import puppeteer from 'puppeteer';
import fs from 'fs';

const url = 'https://www.kassia.ro/animatori-petreceri-copii-sector-6/';
const badTextSnippet = "Kassia îți transformă evenimentele în amintiri de neuitat prin decorațiuni spectaculoase din baloane";

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    try {
        await p.goto(url, { waitUntil: 'networkidle2', timeout: 15000 });
        
        const result = await p.evaluate((badText) => {
            const allElements = Array.from(document.body.querySelectorAll('*'));
            let foundPath = 'NOT FOUND';
            let tagName = '';
            let classList = '';
            let innerText = '';
            
            for(let el of allElements) {
                // Find the deepest element containing the text
                if (el.children.length === 0 && el.innerText && el.innerText.includes("Kassia îți transformă evenimentele în amintiri de neuitat")) {
                    let path = [];
                    let current = el;
                    tagName = el.tagName;
                    classList = el.className;
                    innerText = el.innerText;
                    while(current && current.tagName) {
                        let step = current.tagName.toLowerCase();
                        if (current.id) step += '#' + current.id;
                        if (typeof current.className === 'string' && current.className.trim()) {
                             step += '.' + current.className.split(/\s+/).join('.');
                        }
                        path.unshift(step);
                        current = current.parentElement;
                    }
                    foundPath = path.join(' > ');
                    break;
                }
            }
            
            return {
                foundPath,
                tagName,
                classList,
                innerText
            };
        }, badTextSnippet);
        
        console.log(result);
        
    } catch(e) {
        console.error(e);
    }
    
    await browser.close();
}

run().catch(console.error);
