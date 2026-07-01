import puppeteer from 'puppeteer';
import fs from 'fs';
import crypto from 'crypto';

(async () => {
  const cacheBuster = Date.now();
  const url = `https://www.kassia.ro/animatori-petreceri-copii-voluntari/?qa=${cacheBuster}`;
  
  console.log(`Testing URL: ${url}`);
  
  const browser = await puppeteer.launch({ 
    headless: true, 
    args: ['--no-sandbox', '--disable-setuid-sandbox'] 
  });
  
  const page = await browser.newPage();
  await page.setViewport({ width: 1440, height: 3000 });
  await page.setCacheEnabled(false);
  
  await page.goto(url, { waitUntil: 'networkidle0' });

  // HTML Snapshot Proof
  const html = await page.content();
  const htmlPath = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_live_snapshot_after_fix.html';
  fs.writeFileSync(htmlPath, html);
  
  const hash = crypto.createHash('sha256').update(html).digest('hex');
  console.log(`HTML Snapshot SHA256: ${hash}`);

  // DOM POSITION TEST
  const headings = await page.evaluate(() => {
    const findHeading = (text, tag) => {
      const elements = Array.from(document.querySelectorAll(tag));
      return elements.find(el => el.textContent.includes(text));
    };

    const h1 = findHeading('Animatori petreceri copii în Voluntari și Pipera', 'h1');
    const h2Org = findHeading('Organizarea activităților în curți și ansambluri rezidențiale din Voluntari', 'h2');
    const card1 = findHeading('Pe scurt pentru părinți din Voluntari și Pipera', 'h3');
    const card2 = findHeading('Cum pregătim zona de joc', 'h3');
    const card3 = findHeading('Un personaj animator sau două personaje animatoare?', 'h3');
    const h2Next = findHeading('Animatori pentru petreceri de copii în Voluntari și Pipera', 'h2');

    const getMetrics = (el, name, selector) => {
      if (!el) return { text: name, selector, top: -1, visible: false };
      const rect = el.getBoundingClientRect();
      const style = window.getComputedStyle(el);
      return {
        text: name,
        selector,
        top: rect.top,
        visible: style.display !== 'none' && style.visibility !== 'hidden' && rect.height > 0
      };
    };

    return {
      h1: getMetrics(h1, 'H1: Animatori petreceri...', 'h1'),
      h2Org: getMetrics(h2Org, 'H2: Organizarea activităților...', 'h2'),
      card1: getMetrics(card1, 'Card 1: Pe scurt...', 'h3'),
      card2: getMetrics(card2, 'Card 2: Cum pregătim...', 'h3'),
      card3: getMetrics(card3, 'Card 3: Un personaj...', 'h3'),
      h2Next: getMetrics(h2Next, 'Next H2: Animatori pentru petreceri...', 'h2')
    };
  });

  console.log('\n--- DOM POSITION TEST ---');
  let pass = true;
  
  if (headings.h1.top < headings.h2Org.top && 
      headings.h2Org.top < headings.card1.top && 
      headings.card1.top < headings.h2Next.top) {
      console.log('Vertical Order PASS');
  } else {
      console.log('Vertical Order FAIL');
      pass = false;
  }

  for (const [key, val] of Object.entries(headings)) {
    val.pass = val.top >= 0 && val.visible;
    console.log(JSON.stringify(val));
    if (!val.pass) pass = false;
  }

  // IMAGE VISIBILITY TEST
  const images = await page.evaluate(() => {
    const imgs = Array.from(document.querySelectorAll('img'));
    return imgs.filter(img => {
      // Filter for specific images to test
      return img.src.includes('voluntari') && !img.src.includes('avatar');
    }).map(img => {
      const rect = img.getBoundingClientRect();
      const style = window.getComputedStyle(img);
      return {
        src: new URL(img.src).pathname,
        alt: img.alt,
        naturalWidth: img.naturalWidth,
        naturalHeight: img.naturalHeight,
        renderedWidth: rect.width,
        renderedHeight: rect.height,
        visible: style.display !== 'none' && style.visibility !== 'hidden' && rect.width > 0 && rect.height > 0,
        boundingClientRect: { top: rect.top, left: rect.left, width: rect.width, height: rect.height }
      };
    });
  });

  console.log('\n--- IMAGE VISIBILITY TEST ---');
  for (const img of images) {
    img.pass = img.naturalWidth > 0 && img.renderedWidth > 0 && img.visible;
    console.log(JSON.stringify(img));
    if (!img.pass) pass = false;
  }

  console.log(`\nOVERALL TEST STATUS: ${pass ? 'PASS' : 'FAIL'}`);

  await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_machine_desktop.png', fullPage: true });

  await page.setViewport({ width: 390, height: 844, isMobile: true, hasTouch: true });
  await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_machine_mobile.png', fullPage: true });

  await browser.close();
})();
