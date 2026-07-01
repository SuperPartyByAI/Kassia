import axios from 'axios';
import * as cheerio from 'cheerio';
import https from 'https';

const urls = [
  "https://superparty.ro/animatori-petreceri-copii/",
  "https://dizemanepe.ro/animatori-petreceri-copii-sector-1/",
  "https://www.funevents.ro/",
  "https://www.animatorpetrecericopii.ro/",
  "https://animatoriiveseli.ro/",
  "https://echipavesela.ro/animatori/",
  "https://www.kitzparty.com/animator-bucuresti/",
  "https://cocosevents.ro/animatori-petreceri-copii/"
];

const agent = new https.Agent({ rejectUnauthorized: false });

async function scrapeUrl(url) {
  try {
    const response = await axios.get(url, { 
        httpsAgent: agent, 
        headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/114.0.0.0 Safari/537.36' },
        timeout: 10000 
    });
    const $ = cheerio.load(response.data);
    
    const title = $('title').text().trim() || 'N/A';
    const metaDesc = $('meta[name="description"]').attr('content') || 'N/A';
    const h1 = $('h1').first().text().trim().replace(/\s+/g, ' ') || 'N/A';
    
    const h2s = [];
    $('h2').each((i, el) => { if(i < 3) h2s.push($(el).text().trim().replace(/\s+/g, ' ')); });
    
    const textContent = $('body').text().replace(/\s+/g, ' ').toLowerCase();
    const wordCount = textContent.split(' ').length;
    
    const hasFaq = textContent.includes('frecvente') || textContent.includes('faq');
    const hasGallery = $('img').length > 5;
    const hasReviews = textContent.includes('recenzii') || textContent.includes('testimoniale') || textContent.includes('pareri');
    const hasPrices = textContent.includes('lei') || textContent.includes('ron');
    
    const locs = ['sector 1', 'baneasa', 'dorobanti', 'floreasca', 'bucurestii noi', 'aviatorilor'];
    const foundLocs = locs.filter(l => textContent.includes(l));
    
    return { url, title, metaDesc, h1, h2s, wordCount, hasFaq, hasPrices, hasGallery, hasReviews, locs: foundLocs };
  } catch (err) {
    return { url, error: err.message };
  }
}

async function run() {
  for (const url of urls) {
    const res = await scrapeUrl(url);
    console.log(JSON.stringify(res));
  }
}
run();
