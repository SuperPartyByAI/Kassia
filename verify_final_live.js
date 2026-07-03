import puppeteer from 'puppeteer';

async function run() {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  
  const page = await browser.newPage();
  await page.setViewport({ width: 390, height: 844 });
  let broken = false;
  page.on('response', r => {
    if (r.request().resourceType() === 'image' && !r.ok()) broken = true;
  });
  
  await page.goto('https://www.kassia.ro/animatori-petreceri-copii/', { waitUntil: 'networkidle2' });
  
  const hasOverflow = await page.evaluate(() => document.documentElement.scrollWidth > window.innerWidth);
  const images = await page.evaluate(() => Array.from(document.querySelectorAll('img')).map(i => i.src));
  
  const genericFound = images.filter(src => src.includes('catalog-costume-kassia-') || src.includes('galerie-petreceri-copii-kassia-0'));
  const descriptiveFound = images.filter(src => src.includes('animator') || src.includes('fotografie'));
  
  console.log(JSON.stringify({
     mobile_visual_ok: !hasOverflow,
     generic_images_still_live: genericFound.length,
     descriptive_images_live: descriptiveFound.length,
     no_broken_images: !broken
  }, null, 2));
  
  await browser.close();
}

run();
