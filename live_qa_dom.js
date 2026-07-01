import puppeteer from 'puppeteer';

async function run() {
  const browser = await puppeteer.launch({
    headless: false,
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  const page = await browser.newPage();
  const url = "https://www.kassia.ro/animatori-petreceri-copii/";
  
  try {
    await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    
    const data = await page.evaluate(() => {
      // 1. H1s
      const h1Nodes = Array.from(document.querySelectorAll('h1'));
      const h1s = h1Nodes.map(n => ({ text: n.innerText, isVisible: n.offsetParent !== null }));
      
      // 2. FAQs
      const faqContainers = Array.from(document.querySelectorAll('.faq-item, details')).filter(n => n.offsetParent !== null);
      const allText = document.body.innerText;
      const hasDuplicateQuestionsOnly = allText.split('Întrebări frecvente').length > 2; 
      
      // 3. Reviews "Ce spun clienții noștri"
      const reviewHeadings = Array.from(document.querySelectorAll('h2, h3, div')).filter(n => n.innerText && n.innerText.includes('Ce spun clienții noștri'));
      // A carousel usually clones elements for infinite scroll. Let's check for `.marquee` or `.carousel-track` or `aria-hidden="true"`
      const carouselClones = document.querySelectorAll('.splide__slide--clone, .marquee__content[aria-hidden="true"], [aria-hidden="true"] .review-item').length;
      
      // 4. "Ghid pentru planificarea programului de animație"
      const ghidNodes = Array.from(document.querySelectorAll('h2, h3, section')).filter(n => n.innerText && n.innerText.includes('Ghid pentru planificarea programului de animație'));
      const hasGhid = ghidNodes.length > 0;
      
      let ghidLocation = 'Absent';
      let contentAfterReviews = false;
      
      if (hasGhid) {
          const ghidRect = ghidNodes[0].getBoundingClientRect();
          const reviewSection = document.querySelector('.aprecieri-clienti-container') || document.querySelector('[id*="ce-spun-clien"]');
          if (reviewSection) {
              const reviewRect = reviewSection.getBoundingClientRect();
              if (ghidRect.top > reviewRect.bottom) {
                  ghidLocation = 'După recenzii';
                  contentAfterReviews = true;
              } else {
                  ghidLocation = 'Înainte de recenzii';
              }
          }
      }

      // Check sections order to see if there is main content after reviews
      const sections = Array.from(document.querySelectorAll('section'));
      let reviewSectionFound = false;
      let importantSectionAfterReview = null;
      sections.forEach(s => {
          if (s.innerText && s.innerText.includes('Ce spun clienții noștri')) reviewSectionFound = true;
          else if (reviewSectionFound && s.innerText && s.innerText.length > 300 && !s.innerText.includes('Întrebări frecvente')) {
              importantSectionAfterReview = s.innerText.substring(0, 50);
          }
      });
      
      // 5. Term search in clean text (excluding reviews and footer)
      const reviewsElement = document.querySelector('.aprecieri-clienti-container') || document.querySelector('[id*="ce-spun-clien"]');
      const footerElement = document.querySelector('footer');
      if (reviewsElement) reviewsElement.remove();
      if (footerElement) footerElement.remove();
      
      const cleanText = document.body.innerText.toLowerCase();
      
      const terms = [
          "câteva săptămâni", "prețuri", "tarife", "cost", "lei", "pachete", "sigur", "siguranță", 
          "perfect", "ideal", "excelent", "profesional", "calitate", "garantat"
      ];
      
      const foundTerms = {};
      terms.forEach(t => {
          const regex = new RegExp(t, 'g');
          const matches = cleanText.match(regex);
          if (matches) foundTerms[t] = matches.length;
      });

      return {
        h1s,
        faqContainers: faqContainers.length,
        hasDuplicateQuestionsOnly,
        reviewHeadings: reviewHeadings.map(h => ({text: h.innerText, tag: h.tagName})),
        carouselClones,
        hasGhid,
        ghidLocation,
        contentAfterReviews,
        importantSectionAfterReview,
        foundTerms
      };
    });
    
    console.log(JSON.stringify(data, null, 2));
    
  } catch(e) {
    console.log(`Error: ${e.message}`);
  }
  
  await browser.close();
}
run();
