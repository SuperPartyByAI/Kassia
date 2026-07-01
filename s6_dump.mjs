import puppeteer from 'puppeteer';

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    try {
        await p.goto("https://www.kassia.ro/animatori-petreceri-copii-sector-6/", { waitUntil: 'networkidle2' });
        
        const texts = await p.evaluate(() => {
            const headings = Array.from(document.querySelectorAll('h2, h3'));
            let results = {};
            headings.forEach(h => {
                let next = h.nextElementSibling;
                while (next && next.tagName !== 'P' && next.tagName !== 'DIV') {
                    next = next.nextElementSibling;
                }
                if (next) results[h.innerText.trim()] = next.innerText.trim();
            });
            return results;
        });
        
        console.log(`1. Ce rol are animatorul la o petrecere în Sector 6:\n   "${texts["Ce rol are animatorul la o petrecere în Sector 6"]}"\n`);
        console.log(`2. Cum adaptăm programul pentru zonele din Sector 6:\n   "${texts["Cum adaptăm programul pentru zonele din Sector 6"]}"\n`);
        console.log(`3. Petreceri în apartamente, restaurante, grădinițe și spații de joacă:\n   "${texts["Petreceri în apartamente, restaurante, grădinițe și spații de joacă"]}"\n`);
        console.log(`4. De ce să alegi Kassia pentru o petrecere în Sector 6:\n   "${texts["De ce să alegi Kassia pentru o petrecere în Sector 6"]}"\n`);
        
    } catch(e) {
        console.error(e);
    }
    await browser.close();
}
run();
