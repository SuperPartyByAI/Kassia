import puppeteer from 'puppeteer';

const allLinks = [
    { url: "https://superparty.ro/animatori-petreceri-copii/" },
    { url: "https://dizemanepe.ro/animatori-copii/" },
    { url: "https://www.funevents.ro/animatori-copii/" },
    { url: "https://magicvalentino.ro/" },
    { url: "https://cool-events.ro/" },
    { url: "https://yokidoki.ro/" },
    { url: "https://dumbolino.ro/animatori-petreceri-copii/" },
    { url: "https://sashanakids.ro/" }
];

async function run() {
    console.log("\n=== PUPPETEER LIVE COMPETITOR AUDIT S6 ===");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const page = await browser.newPage();
    const s6Zones = ["militari", "drumul taberei", "ghencea", "crângași", "crangasi", "giulești", "giulesti", "regie", "grozăvești", "grozavesti", "lujerului", "apusului", "valea ialomiței", "valea ialomitei", "răzoare", "razoare", "cotroceni"];
    
    for (let i = 0; i < allLinks.length; i++) {
        const comp = allLinks[i];
        console.log(`\n-> Opening ${comp.url}`);
        try {
            const resp = await page.goto(comp.url, { waitUntil: 'networkidle2', timeout: 15000 });
            const status = resp ? resp.status() : 'Unknown';
            const data = await page.evaluate(() => {
                const title = document.title;
                const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText.trim() : 'NO H1';
                const metaDesc = document.querySelector('meta[name="description"]') ? document.querySelector('meta[name="description"]').content : '';
                const txt = document.body.innerText.toLowerCase();
                const wordCount = txt.split(/\s+/).length;
                const faqCount = document.querySelectorAll('.faq, .faq-item, details, [itemtype*="Question"]').length;
                const faqSchema = document.documentElement.innerHTML.includes('FAQPage');
                const cta = document.querySelector('button, .btn, .cta, a[href*="contact"], a[href*="pret"]') ? true : false;
                const contact = txt.includes('07') || document.documentElement.innerHTML.includes('whatsapp') ? true : false;
                const firstFold = document.body.innerText.substring(0, 500).replace(/\n/g, ' ');
                return { title, h1, metaDesc, txt, wordCount, faqCount, faqSchema, cta, contact, firstFold };
            });
            const matchedZones = s6Zones.filter(z => data.txt.includes(z));
            const isLocal = matchedZones.length > 0 || data.title.toLowerCase().includes('sector 6') || data.h1.toLowerCase().includes('sector 6');
            
            console.log(`HTTP: ${status}`);
            console.log(`H1: ${data.h1}`);
            console.log(`First Fold Text (approx): ${data.firstFold}`);
            console.log(`Words: ~${data.wordCount} | FAQs: ${data.faqCount} | Schema: ${data.faqSchema}`);
            console.log(`S6 Zones Found: ${matchedZones.length > 0 ? matchedZones.join(', ') : 'NONE'}`);
            console.log(`S6 Dedicated: ${isLocal}`);
        } catch(e) {
            console.log(`Failed to inspect ${comp.url}: ${e.message}`);
        }
    }
    await browser.close();
    console.log("\nDone.");
}
run();
