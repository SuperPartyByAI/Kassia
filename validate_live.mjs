import puppeteer from 'puppeteer';

async function validate() {
  const browser = await puppeteer.launch({ headless: 'new' });
  const page = await browser.newPage();
  await page.goto('https://www.kassia.ro/catalog-costume/', { waitUntil: 'networkidle0' });

  const report = await page.evaluate(() => {
      const cards = Array.from(document.querySelectorAll('.catalog-card'));
      const images = Array.from(document.querySelectorAll('.catalog-card-image img'));
      
      let allHasTitle = true;
      let allHasDesc = true;
      let allHasAlt = true;
      let allCTAsWA = true;
      let zeroContactCTA = true;
      
      const descriptions = [];
      const badPhrases = ["Personaj tematic disponibil pentru rezervare la petreceri", "Un mascotă", "Un zână", "Ref:", "absolut", "uimitor"];
      const foundBadPhrases = [];
      let sample_whatsapp_href = "";
      
      cards.forEach(card => {
          const title = card.querySelector('.catalog-card-title')?.innerText || "";
          const desc = card.querySelector('.catalog-card-desc')?.innerText || "";
          const img = card.querySelector('.catalog-card-image img');
          const ctas = card.querySelectorAll('a.catalog-card-cta');
          
          if (!title) allHasTitle = false;
          if (!desc) allHasDesc = false;
          if (img && !img.alt) allHasAlt = false;
          
          descriptions.push(desc);
          
          badPhrases.forEach(ph => {
              if (desc.toLowerCase().includes(ph.toLowerCase()) || title.toLowerCase().includes(ph.toLowerCase())) {
                  foundBadPhrases.push(`"${ph}" found in card: ${title}`);
              }
          });
          
          if (ctas.length > 1) {
              allCTAsWA = false; // More than 1 CTA per card
          }
          
          ctas.forEach(cta => {
              if (cta.href.includes('/contact/')) zeroContactCTA = false;
              if (!cta.href.includes('wa.me')) allCTAsWA = false;
              if (cta.href.includes('wa.me')) sample_whatsapp_href = cta.href;
          });
      });

      const uniqueDescriptions = new Set(descriptions);
      const duplicateCount = descriptions.length - uniqueDescriptions.size;

      return {
          total_cards_live: cards.length,
          total_images: images.length,
          all_cards_have_title: allHasTitle,
          all_cards_have_description: allHasDesc,
          all_cards_have_alt: allHasAlt,
          all_card_ctas_are_whatsapp: allCTAsWA,
          contact_links_removed_from_card_ctas: zeroContactCTA,
          sample_whatsapp_href,
          duplicate_description_count: duplicateCount,
          bad_phrases_found: foundBadPhrases
      };
  });

  // Verify images HTTP 200
  const imageUrls = await page.evaluate(() => {
      return Array.from(document.querySelectorAll('.catalog-card-image img')).map(img => img.src);
  });
  
  let all_images_200 = true;
  for (const url of imageUrls) {
      if (url.startsWith('http')) {
          try {
              const res = await fetch(url, { method: 'HEAD' });
              if (!res.ok) all_images_200 = false;
          } catch(e) {
              all_images_200 = false;
          }
      }
  }
  
  report.all_images_200 = all_images_200;
  
  console.log(JSON.stringify(report, null, 2));

  await browser.close();
}
validate();
