import * as cheerio from 'cheerio';

const urls = [
    'https://www.cool-events.ro/animatori-petreceri-copii',
    'https://www.paradisulpersonajelor.ro/animatori-petreceri-copii/',
    'https://www.dizemanepe.ro/animatori-copii/',
    'https://www.superparty.ro/animatori-petreceri-copii/',
    'https://www.funevents.ro/animatori-petreceri-copii-bucuresti/'
];

async function analyze(url) {
    try {
        const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' } });
        const html = await res.text();
        const $ = cheerio.load(html);

        const h1 = $('h1').first().text().trim();
        const h2s = [];
        $('h2').each((_, el) => h2s.push($(el).text().trim()));

        const wordCount = $('body').text().split(/\s+/).length;
        const faqCount = $('details').length || $('.faq').length || $('.accordion').length || html.match(/faq/gi)?.length || 0;
        const hasSchema = html.includes('FAQPage') || html.includes('schema.org');
        const images = $('img').length;
        const hasBucuresti = html.toLowerCase().includes('bucurești') || html.toLowerCase().includes('bucuresti');
        const hasIlfov = html.toLowerCase().includes('ilfov');

        return {
            url,
            h1,
            h2s: h2s.slice(0, 3), // top 3
            wordCount,
            faqCount: typeof faqCount === 'number' ? faqCount : 0,
            hasSchema,
            images,
            localizare: { bucuresti: hasBucuresti, ilfov: hasIlfov }
        };
    } catch (e) {
        return { url, error: e.message };
    }
}

(async () => {
    for (const u of urls) {
        console.log(await analyze(u));
    }
})();
