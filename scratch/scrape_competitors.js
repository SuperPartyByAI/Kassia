import axios from 'axios';
import * as cheerio from 'cheerio';
import https from 'https';

const urls = [
  "https://superparty.ro/animatori-petreceri-copii/",
  "https://magicvalentino.ro/petreceri-copii-sector-1/",
  "https://dizemanepe.ro/animatori-petreceri-copii-sector-1/",
  "https://echipavesela.ro/oferta-animatori/",
  "https://animatoriiveseli.ro/",
  "https://petrecerimagice.ro/animatori-petreceri-copii/",
  "https://www.funevents.ro/",
  "https://www.animatorpetrecericopii.ro/"
];

const agent = new https.Agent({  
  rejectUnauthorized: false
});

async function scrapeUrl(url) {
  try {
    const response = await axios.get(url, { 
        httpsAgent: agent, 
        headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36' },
        timeout: 10000 
    });
    const $ = cheerio.load(response.data);
    
    const title = $('title').text().trim();
    const metaDesc = $('meta[name="description"]').attr('content') || '';
    const h1 = $('h1').first().text().trim().replace(/\s+/g, ' ');
    
    const h2s = [];
    $('h2').each((i, el) => { if(i < 5) h2s.push($(el).text().trim().replace(/\s+/g, ' ')); });
    
    const textContent = $('body').text().replace(/\s+/g, ' ').toLowerCase();
    const wordCount = textContent.split(' ').length;
    
    const hasFaq = textContent.includes('intrebari frecvente') || textContent.includes('faq') || textContent.includes('întrebări frecvente');
    const hasGallery = $('img').length > 5;
    const hasReviews = textContent.includes('pareri') || textContent.includes('recenzii') || textContent.includes('testimoniale') || textContent.includes('ce spun clientii');
    const hasPrices = textContent.includes('lei/ora') || textContent.includes('lei / ora') || textContent.includes('pret') || textContent.includes('ron');
    
    const localKeywords = ['sector 1', 'baneasa', 'aviatorilor', 'dorobanti', 'bucurestii noi', 'floreasca', 'băneasa', 'dorobanți'];
    const foundLocal = localKeywords.filter(k => textContent.includes(k));
    
    return { url, title, metaDesc, h1, h2s: h2s.slice(0, 3), wordCount, hasFaq, hasGallery, hasReviews, hasPrices, localContext: foundLocal };
  } catch (err) {
    return { url, error: err.message };
  }
}

async function run() {
  for (const url of urls) {
    const res = await scrapeUrl(url);
    console.log(JSON.stringify(res, null, 2));
  }
}
run();
