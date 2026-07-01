import puppeteer from 'puppeteer';

(async () => {
  const cacheBuster = Date.now();
  const url = `https://www.kassia.ro/animatori-petreceri-copii-voluntari/?qa=${cacheBuster}`;
  
  console.log(`Testing URL: ${url}`);
  
  const browser = await puppeteer.launch({ 
    headless: true, 
    args: ['--no-sandbox', '--disable-setuid-sandbox'] 
  });
  
  const page = await browser.newPage();
  await page.setViewport({ width: 1440, height: 1000 });
  await page.setCacheEnabled(false);
  
  await page.goto(url, { waitUntil: 'networkidle0' });

  // Function to progressively scroll to the bottom to trigger lazy loading
  await page.evaluate(async () => {
    await new Promise((resolve) => {
      let totalHeight = 0;
      const distance = 100;
      const timer = setInterval(() => {
        const scrollHeight = document.body.scrollHeight;
        window.scrollBy(0, distance);
        totalHeight += distance;

        if (totalHeight >= scrollHeight - window.innerHeight) {
          clearInterval(timer);
          resolve();
        }
      }, 50); // 50ms per 100px scroll
    });
  });

  // Wait for network to settle after scrolling
  await new Promise(r => setTimeout(r, 2000));

  // IMAGE VISIBILITY TEST
  const images = await page.evaluate(() => {
    // Only target images inside .content-section, .feature-cards-section, etc.
    // Exclude header, footer, testimonials, gallery
    const wrappers = document.querySelectorAll('.content-section, .feature-cards-section');
    let imgs = [];
    wrappers.forEach(w => {
      imgs = imgs.concat(Array.from(w.querySelectorAll('img')));
    });

    return imgs.map(img => {
      const rect = img.getBoundingClientRect();
      const style = window.getComputedStyle(img);
      
      // We also check naturalWidth
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

  console.log('\n--- SCROLL-BASED IMAGE VISIBILITY TEST ---');
  let pass = true;
  for (const img of images) {
    img.pass = img.naturalWidth > 0 && img.naturalHeight > 0 && img.renderedWidth > 0 && img.renderedHeight > 0 && img.visible;
    console.log(JSON.stringify(img));
    if (!img.pass) pass = false;
  }

  console.log(`\nOVERALL TEST STATUS: ${pass ? 'PASS' : 'FAIL'}`);

  await browser.close();
})();
