import puppeteer from 'puppeteer';

(async () => {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  await page.setViewport({ width: 1280, height: 2000 });
  // Add timestamp to bypass CDN/cache if any
  await page.goto(`https://kassia.ro/animatori-petreceri-copii-voluntari/?qa=${Date.now()}`, { waitUntil: 'networkidle0' });

  // Scroll to bottom to trigger lazy loading
  await page.evaluate(async () => {
    await new Promise((resolve) => {
      let totalHeight = 0;
      const distance = 100;
      const timer = setInterval(() => {
        const scrollHeight = document.body.scrollHeight;
        window.scrollBy(0, distance);
        totalHeight += distance;
        if (totalHeight >= scrollHeight) {
          clearInterval(timer);
          resolve();
        }
      }, 100);
    });
  });

  const extract = await page.evaluate(() => {
    const sections = Array.from(document.querySelectorAll('section, header'));
    const order = sections.map(s => {
      const h2 = s.querySelector('h2, h1');
      return {
        tag: s.tagName.toLowerCase(),
        heading: h2 ? h2.innerText : 'NO HEADING',
        top: s.getBoundingClientRect().top
      };
    });

    const newImages = Array.from(document.querySelectorAll('img[src*="voluntari_"]')).map(img => ({
      src: img.src.split('/').pop(),
      visible: img.getBoundingClientRect().width > 0 && img.getBoundingClientRect().height > 0,
      naturalWidth: img.naturalWidth,
      renderedWidth: img.width
    }));

    // Find the CTA whatsapp
    const whatsappBtn = document.querySelector('a[href*="wa.me/407"]');

    return { order, newImages, whatsappBtnFound: !!whatsappBtn };
  });

  console.log(JSON.stringify(extract, null, 2));

  await browser.close();
})();
