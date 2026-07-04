import fs from 'fs';
import * as cheerio from 'cheerio';

const urls = [
    "https://paradisulpersonajelor.ro/animatie-copii/",
    "https://dizemanepe.ro/",
    "https://zoukaevents.ro/",
    "https://www.clownparty.ro/"
];

const keywords = [
    'baloane', 'heliu', 'masina', 'vata', 'zahar', 'popcorn', 'ursitoare', 'magician', 
    'magie', 'pictura', 'face', 'painting', 'modelaj', 'pinata', 'karaoke', 'foto', 'video', 
    'cabina', 'dj', 'sonorizare', 'candy', 'bar', 'tort', 'decor', 'mascote', 'jocuri', 'ateliere'
];

async function run() {
    let allMatches = {};
    for (const kw of keywords) allMatches[kw] = 0;

    for (const url of urls) {
        try {
            const req = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' } });
            const html = await req.text();
            const text = cheerio.load(html)('body').text().toLowerCase();
            
            for (const kw of keywords) {
                const regex = new RegExp('\\b' + kw + '\\b', 'g');
                const matches = text.match(regex);
                if (matches) {
                    allMatches[kw] += matches.length;
                }
            }
        } catch(e) {
            console.log("Error fetching", url);
        }
    }
    
    // Sort and print
    const sorted = Object.entries(allMatches).sort((a,b) => b[1] - a[1]);
    console.log("Service keyword occurrences across Top Competitors:");
    console.log(sorted);
}
run();
