import { execSync } from 'child_process';
import * as cheerio from 'cheerio';

const competitors = [
    { name: 'SuperParty', url: 'https://superparty.ro/animatori-petreceri-copii-sector-2/' },
    { name: 'SuperParty Home', url: 'https://superparty.ro/' },
    { name: 'EnjoyParty', url: 'https://enjoyparty.ro/animatori-petreceri-copii-sector-2/' },
    { name: 'EnjoyParty Home', url: 'https://enjoyparty.ro/' },
    { name: 'Cool-Events', url: 'https://cool-events.ro/animatori-petreceri-copii-sector-2/' },
    { name: 'Cool-Events Pachete', url: 'https://cool-events.ro/pachete-animatori/' },
    { name: 'EchipaVesela', url: 'https://echipavesela.ro/animatori-petreceri-copii-sector-2/' },
    { name: 'EchipaVesela Home', url: 'https://echipavesela.ro/' },
    { name: 'AnimatoriVeseli', url: 'https://animatoriiveseli.ro/' },
    { name: 'FunEvents', url: 'https://funevents.ro/' }
];

async function checkCompetitor(c) {
    try {
        const html = execSync(`curl -sL --max-time 10 ${c.url}`).toString();
        const $ = cheerio.load(html);
        
        // 404 check
        if (html.toLowerCase().includes('not found') || html.toLowerCase().includes('404') || $('title').text().includes('404')) {
            return null; // Page probably doesn't exist
        }

        const title = $('title').text().trim() || '';
        const h1 = $('h1').text().trim() || '';
        const lowerHtml = html.toLowerCase();
        
        const isSector2Dedicated = lowerHtml.includes('sector 2') || lowerHtml.includes('sectorul 2');
        const hasPrices = lowerHtml.match(/\d{2,3}\s*(lei|ron)/i) !== null;
        const hasFaq = lowerHtml.includes('intrebari frecvente') || lowerHtml.includes('întrebări frecvente') || lowerHtml.includes('faq');
        const hasFaqSchema = lowerHtml.includes('@type":"FAQPage') || lowerHtml.includes('@type": "FAQPage');
        const hasLocalAreas = lowerHtml.includes('colentina') || lowerHtml.includes('obor') || lowerHtml.includes('pantelimon') || lowerHtml.includes('iancului');
        const hasImages = $('img').length > 5;
        const hasReviews = lowerHtml.includes('review') || lowerHtml.includes('pareri') || lowerHtml.includes('păreri') || lowerHtml.includes('rating') || html.includes('Google');
        
        return {
            name: c.name,
            url: c.url,
            title,
            h1,
            isSector2Dedicated,
            hasPrices,
            hasFaq,
            hasFaqSchema,
            hasLocalAreas,
            hasImages,
            hasReviews
        };
    } catch(e) {
        return null; // Curl failed or timed out
    }
}

async function run() {
    let results = [];
    for (const c of competitors) {
        const res = await checkCompetitor(c);
        if (res) results.push(res);
    }
    
    // Filter out duplicates (e.g., if dedicated page exists, drop Home)
    const uniqueBrands = new Set(results.map(r => r.name.split(' ')[0]));
    let finalResults = [];
    uniqueBrands.forEach(brand => {
        const brandRes = results.filter(r => r.name.startsWith(brand));
        // Prefer dedicated Sector 2 page over Home
        const dedicated = brandRes.find(r => r.isSector2Dedicated && !r.name.includes('Home'));
        if (dedicated) finalResults.push(dedicated);
        else finalResults.push(brandRes[0]);
    });

    console.log(JSON.stringify(finalResults, null, 2));
}

run().catch(console.error);
