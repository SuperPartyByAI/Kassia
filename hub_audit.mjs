import fs from 'fs';

async function auditHub() {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
  try {
    const res = await fetch(url);
    const status = res.status;
    const text = await res.text();
    
    // Extract H1
    const h1Match = text.match(/<h1[^>]*>([\s\S]*?)<\/h1>/i);
    const h1 = h1Match ? h1Match[1].replace(/<[^>]+>/g, '').trim().replace(/\s+/g, ' ') : 'NOT FOUND';
    
    // Extract Title
    const titleMatch = text.match(/<title[^>]*>([\s\S]*?)<\/title>/i);
    const title = titleMatch ? titleMatch[1].trim() : 'NOT FOUND';
    
    // Extract Canonical
    const canMatch = text.match(/<link\s+rel="canonical"\s+href="([^"]+)"/i);
    const canonical = canMatch ? canMatch[1] : 'NOT FOUND';
    
    // Extract Robots
    const robMatch = text.match(/<meta\s+name="robots"\s+content="([^"]+)"/i);
    const robots = robMatch ? robMatch[1] : 'NOT FOUND';
    
    // Check Pricing Preview
    const hasPricingText = /Programe cu animatori potrivite/i.test(text);
    const has280 = /280 lei/i.test(text);
    const has490 = /490 lei/i.test(text);
    const has830 = /830 lei/i.test(text);
    
    // Blocks
    const hasScenarii = /Scenarii frecvente/i.test(text) ? 'PRESENT' : 'ABSENT';
    const hasEvitam = /Ce evităm/i.test(text) ? 'PRESENT' : 'ABSENT';
    const hasDecurge = /Cum decurge/i.test(text) ? 'PRESENT' : 'ABSENT';
    const hasUnDoua = /Un personaj animator sau dou/i.test(text) ? 'PRESENT' : 'ABSENT';
    const hasZone = /Zone în care adaptăm/i.test(text) ? 'PRESENT' : 'ABSENT';
    
    // Check Toxic Terms in body (strip tags to avoid checking class names if possible, but simple test first)
    const toxicTerms = ['asigur', 'ideal', 'perfect', 'premium', 'garantat', 'magie', 'memorabil', 'de neuitat', 'pachete'];
    const foundToxic = toxicTerms.filter(t => new RegExp(`\\b${t}`, 'i').test(text));
    
    const faqMatches = text.match(/<details[^>]*>/gi);
    const faqCount = faqMatches ? faqMatches.length : 0;
    
    const hasProtected = /AggregateRating/i.test(text) || /ratingValue/i.test(text) || /reviewCount/i.test(text) ? 'PRESENT' : 'NOT FOUND';

    const imgMatches = text.match(/<img[^>]+src="([^"]+)"/gi);
    const images = imgMatches ? imgMatches.map(m => m.match(/src="([^"]+)"/)[1]) : [];

    console.log(`STATUS: ${status}`);
    console.log(`H1: ${h1}`);
    console.log(`Title: ${title}`);
    console.log(`Canonical: ${canonical}`);
    console.log(`Robots: ${robots}`);
    console.log(`Pricing Preview: (Text:${hasPricingText}, 280:${has280}, 490:${has490}, 830:${has830})`);
    console.log(`Scenarii: ${hasScenarii}`);
    console.log(`Ce evitam: ${hasEvitam}`);
    console.log(`Cum decurge: ${hasDecurge}`);
    console.log(`1 vs 2 pers: ${hasUnDoua}`);
    console.log(`Zone locale: ${hasZone}`);
    console.log(`FAQ Count: ${faqCount}`);
    console.log(`Protected: ${hasProtected}`);
    console.log(`Toxic Terms Found: ${foundToxic.join(', ')}`);
    console.log(`Images Count: ${images.length}`);
  } catch (e) {
    console.error(`Error: ${e.message}`);
  }
}

auditHub();
