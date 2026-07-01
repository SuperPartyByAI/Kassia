const cheerio = require('cheerio');

async function testUrl(url) {
  console.log(`\n=== Testing URL: ${url} ===`);
  try {
    const res = await fetch(url);
    console.log(`HTTP Status: ${res.status}`);
    const html = await res.text();
    const $ = cheerio.load(html);
    
    // Extragere Head
    console.log(`Title: ${$('title').text()}`);
    console.log(`Meta Description: ${$('meta[name="description"]').attr('content')}`);
    console.log(`Meta Robots: ${$('meta[name="robots"]').attr('content')}`);
    console.log(`Canonical: ${$('link[rel="canonical"]').attr('href')}`);

    // Extragere Imagini si verificare status
    const images = [];
    $('img').each((i, el) => {
       const src = $(el).attr('src');
       if(src && src.includes('voluntari_')) {
           images.push(src);
       }
    });

    console.log(`\nImages found (${images.length}):`);
    for (const src of images) {
        let fullUrl = src.startsWith('http') ? src : `https://www.kassia.ro${src}`;
        let imgRes = await fetch(fullUrl, { method: 'HEAD' });
        console.log(`- ${fullUrl} : HTTP ${imgRes.status}`);
    }

    // Grep DOM pentru termeni eliminati
    const textContent = $('body').text().toLowerCase();
    const terms = ['perfect', 'ideal', 'asigur', 'siguran', 'tărâm', 'succes', 'absolut', 'pachete', 'preț', 'tarif', 'cost', 'face painting'];
    
    console.log('\nTerms check in DOM:');
    let foundTerms = [];
    for (const term of terms) {
        if (textContent.includes(term.toLowerCase())) {
            foundTerms.push(term);
        }
    }
    if (foundTerms.length === 0) {
        console.log('SUCCESS: No eliminated terms found in the DOM.');
    } else {
        console.log(`WARNING: Found eliminated terms: ${foundTerms.join(', ')}`);
        
        // Let's see where they are
        for (const term of foundTerms) {
            $('p, h1, h2, h3, h4, span, div').each((i, el) => {
                const elText = $(el).text();
                if (elText.toLowerCase().includes(term.toLowerCase()) && elText.length < 200) {
                     console.log(`Context for "${term}": "${elText.trim()}"`);
                }
            });
        }
    }

  } catch(e) {
      console.error(e);
  }
}

async function run() {
  await testUrl('https://www.kassia.ro/animatori-petreceri-copii-voluntari/');
  
  console.log('\n=== Checking Old URL ===');
  const oldRes = await fetch('https://www.kassia.ro/animatori-copii-voluntari/', { redirect: 'manual' });
  console.log(`Old URL HTTP Status: ${oldRes.status}`);
  if(oldRes.status === 301 || oldRes.status === 302 || oldRes.status === 307 || oldRes.status === 308) {
      console.log(`Redirects to: ${oldRes.headers.get('location')}`);
  }

  console.log('\n=== Checking Sitemap ===');
  const sitemapRes = await fetch('https://www.kassia.ro/sitemap-0.xml');
  const sitemapText = await sitemapRes.text();
  console.log(`Is /animatori-petreceri-copii-voluntari/ in sitemap? : ${sitemapText.includes('/animatori-petreceri-copii-voluntari/')}`);
}

run();
