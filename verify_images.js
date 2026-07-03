import puppeteer from 'puppeteer';

const PAGES = [
  'https://www.kassia.ro/animatori-petreceri-copii/',
  'https://www.kassia.ro/',
  'https://www.kassia.ro/animatori-petreceri-copii-floreasca/',
  'https://www.kassia.ro/contact/'
];

async function checkImages(page) {
  return page.evaluate(() => {
    const imgs = Array.from(document.querySelectorAll('img'));
    return imgs.map(img => ({
      src: img.src,
      alt: img.alt,
      natural_width: img.naturalWidth,
      natural_height: img.naturalHeight,
      rendered_visible: img.offsetParent !== null
    }));
  });
}

async function run() {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  
  const report = {
    broken_images_after: [],
    all_images_200_after: true,
    all_images_have_alt_after: true,
    mobile_visual_ok: true,
    desktop_visual_ok: true,
    homepage_visual_ok: true,
    floreasca_visual_ok: true,
    contact_visual_ok: true,
  };

  try {
    for (const url of PAGES) {
      console.log(`Testing ${url}...`);
      
      // Test Desktop
      const pageDesktop = await browser.newPage();
      await pageDesktop.setViewport({ width: 1440, height: 900 });
      let brokenImgsDesk = [];
      pageDesktop.on('response', response => {
        if (response.request().resourceType() === 'image' && !response.ok()) {
           brokenImgsDesk.push(response.url());
        }
      });
      await pageDesktop.goto(url, { waitUntil: 'networkidle2' });
      const deskImgs = await checkImages(pageDesktop);
      const deskOverflow = await pageDesktop.evaluate(() => document.documentElement.scrollWidth > window.innerWidth);
      if (deskOverflow) report.desktop_visual_ok = false;
      await pageDesktop.close();

      // Test Mobile
      const pageMobile = await browser.newPage();
      await pageMobile.setViewport({ width: 390, height: 844 });
      let brokenImgsMob = [];
      pageMobile.on('response', response => {
        if (response.request().resourceType() === 'image' && !response.ok()) {
           brokenImgsMob.push(response.url());
        }
      });
      await pageMobile.goto(url, { waitUntil: 'networkidle2' });
      const mobImgs = await checkImages(pageMobile);
      const mobOverflow = await pageMobile.evaluate(() => document.documentElement.scrollWidth > window.innerWidth);
      if (mobOverflow) report.mobile_visual_ok = false;

      // specifically check for Pillar page
      if (url === 'https://www.kassia.ro/animatori-petreceri-copii/') {
        for (const img of mobImgs) {
          if (!img.src || img.natural_width === 0 || img.natural_height === 0 || brokenImgsMob.includes(img.src)) {
            report.broken_images_after.push({ url: img.src, alt: img.alt });
            report.all_images_200_after = false;
          }
          if (!img.alt && img.alt !== "") {
            report.all_images_have_alt_after = false;
          }
        }
      }

      if (url.includes('floreasca') && (mobOverflow || deskOverflow)) report.floreasca_visual_ok = false;
      if (url.includes('contact') && (mobOverflow || deskOverflow)) report.contact_visual_ok = false;
      if (url === 'https://www.kassia.ro/' && (mobOverflow || deskOverflow)) report.homepage_visual_ok = false;

      await pageMobile.close();
    }
    
    console.log(JSON.stringify(report, null, 2));
  } catch (err) {
    console.error("Puppeteer check failed", err);
  } finally {
    await browser.close();
  }
}

run();
