const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
  console.log('Launching browser...');
  const browser = await puppeteer.launch({ headless: 'new' });
  const page = await browser.newPage();
  
  const targetUrl = 'https://www.kassia.ro/animatori-petreceri-copii-popesti-leordeni/';
  console.log('Navigating to', targetUrl);
  
  // Go to live URL
  await page.goto(targetUrl, { waitUntil: 'networkidle0' });
  
  // DOM validation
  const html = await page.content();
  const $ = require('cheerio').load(html);
  
  // Checking images
  const images = [];
  $('img').each((i, el) => {
     if ($(el).attr('src') && $(el).attr('src').includes('popesti_')) {
         images.push({
             src: $(el).attr('src'),
             alt: $(el).attr('alt')
         });
     }
  });
  console.log('Found custom images in DOM:', images.length);
  images.forEach(img => console.log(` - ${img.src} (alt: ${img.alt})`));
  
  // Checking "AI" references
  const hasAI = html.toLowerCase().includes(' ai ') || html.toLowerCase().includes('generate') || html.toLowerCase().includes('mockup') || html.toLowerCase().includes('randare');
  console.log('Has AI text references?', hasAI ? 'YES (WARNING)' : 'NO (CLEAN)');
  
  // Checking protected blocks
  const hasHeader = $('header').length > 0;
  const hasFooter = $('footer').length > 0;
  const hasReviews = $('.apreciere-item').length > 0 || html.includes('apreciere');
  const hasTrustBadge = $('.google-trust-badge').length > 0 || html.includes('google-trust');
  console.log(`Protected blocks intact: Header=${hasHeader}, Footer=${hasFooter}, Reviews=${hasReviews}, TrustBadge=${hasTrustBadge}`);

  const brainDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227';
  
  // Desktop
  await page.setViewport({ width: 1280, height: 800 });
  await page.screenshot({ path: `${brainDir}/popesti_live_desktop.png`, fullPage: true });
  console.log('Desktop screenshot saved.');

  // Mobile
  await page.setViewport({ width: 375, height: 667, isMobile: true });
  await page.screenshot({ path: `${brainDir}/popesti_live_mobile.png`, fullPage: true });
  console.log('Mobile screenshot saved.');

  await browser.close();
  console.log('Done.');
})();
