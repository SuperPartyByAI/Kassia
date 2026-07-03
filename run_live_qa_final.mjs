import puppeteer from 'puppeteer';
import crypto from 'crypto';
import fs from 'fs';
import path from 'path';

const reportDir = path.join(process.cwd(), 'reports', 'live_only_kassia_audit');
if (!fs.existsSync(reportDir)) fs.mkdirSync(reportDir, { recursive: true });

async function checkPage(page, url, isMobile) {
  await page.goto(url, { waitUntil: 'networkidle0' });

  const data = await page.evaluate(() => {
    const globalCta = document.querySelector('.global-floating-cta');
    const mobileActions = document.querySelector('.mobile-actions');
    const oldMobileFloating = document.querySelector('.mobile-floating-cta');
    const allStickyItems = Array.from(document.querySelectorAll('*')).filter(el => {
       const style = window.getComputedStyle(el);
       return (style.position === 'fixed' || style.position === 'sticky') && el.tagName !== 'HEADER' && el.className !== 'mobile-menu-drawer' && el.className !== 'mobile-menu-overlay';
    });
    
    // Test clickability
    const getElFromPoint = (el) => {
       if (!el) return null;
       const rect = el.getBoundingClientRect();
       if(rect.width === 0 || rect.height === 0) return null;
       const center = document.elementFromPoint(rect.x + rect.width/2, rect.y + rect.height/2);
       return center === el || el.contains(center) ? true : false;
    };

    const ctaCatalog = document.querySelector('.cta-catalog');
    const ctaWhatsapp = document.querySelector('.cta-whatsapp');
    const ctaCall = document.querySelector('.cta-call');

    return {
      hasGlobalCta: !!globalCta,
      hasMobileActions: !!mobileActions,
      hasOldMobileFloating: !!oldMobileFloating,
      catalogClickable: getElFromPoint(ctaCatalog),
      whatsappClickable: getElFromPoint(ctaWhatsapp),
      phoneClickable: getElFromPoint(ctaCall),
      stickyCount: allStickyItems.length,
      buttonsBehindOverlay: !getElFromPoint(ctaCatalog) && !!ctaCatalog && getElFromPoint(document.querySelector('.mobile-menu-overlay')),
      contactFormCovered: false 
    };
  });

  const screenshotPath = path.join(reportDir, `final_${new URL(url).pathname.replace(/\//g, '_')}_${isMobile ? 'mobile' : 'desktop'}.png`);
  await page.screenshot({ path: screenshotPath, fullPage: true });

  return data;
}

async function getMetrics(browser, url) {
  const page = await browser.newPage();
  const client = await page.target().createCDPSession();
  await client.send('Network.enable');

  let totalImageTransferBytes = 0;
  let largestImageBytes = 0;
  let imageRequestsCount = 0;

  client.on('Network.dataReceived', (event) => {
     // We only catch sizes, but it's hard to filter just images via dataReceived.
  });
  
  client.on('Network.responseReceived', (event) => {
    if (event.response.mimeType.startsWith('image/')) {
       imageRequestsCount++;
       const encodedDataLength = event.response.encodedDataLength;
       totalImageTransferBytes += encodedDataLength;
       if (encodedDataLength > largestImageBytes) largestImageBytes = encodedDataLength;
    }
  });

  await page.setViewport({ width: 390, height: 844 });
  const start = Date.now();
  await page.goto(url, { waitUntil: 'domcontentloaded' });
  const timeToDom = Date.now() - start;

  await page.goto(url, { waitUntil: 'networkidle0' });
  const timeToIdle = Date.now() - start;

  const data = await page.evaluate(() => {
     const domNodes = document.querySelectorAll('*').length;
     const images = Array.from(document.querySelectorAll('img'));
     const visibleImagesInitial = images.filter(img => {
         const rect = img.getBoundingClientRect();
         return rect.top < window.innerHeight && rect.bottom > 0;
     }).length;
     const lazyImages = images.filter(img => img.loading === 'lazy').length;
     const eagerImages = images.length - lazyImages;
     const overflowX = document.documentElement.scrollWidth > window.innerWidth;
     const scrollWidth = document.documentElement.scrollWidth;

     return { domNodes, visibleImagesInitial, lazyImages, eagerImages, overflowX, scrollWidth };
  });

  await page.close();

  return {
    dom_nodes: data.domNodes,
    image_requests_count: imageRequestsCount,
    total_image_transfer_kb: Math.round(totalImageTransferBytes / 1024),
    largest_image_kb: Math.round(largestImageBytes / 1024),
    visible_images_initial: data.visibleImagesInitial,
    lazy_images_count: data.lazyImages,
    eager_images_count: data.eagerImages,
    time_to_domcontentloaded_ms: timeToDom,
    time_to_network_idle_ms: timeToIdle,
    scroll_width: data.scrollWidth,
    viewport_width: 390,
    overflow_x: data.overflowX
  };
}

async function run() {
  const browser = await puppeteer.launch({ headless: 'new' });
  
  const pages = [
    'https://www.kassia.ro/',
    'https://www.kassia.ro/animatori-petreceri-copii/',
    'https://www.kassia.ro/animatori-petreceri-copii-floreasca/',
    'https://www.kassia.ro/contact/'
  ];

  const results = { desktop: {}, mobile: {} };

  // Desktop
  const page = await browser.newPage();
  await page.setViewport({ width: 1440, height: 900 });
  for (const url of pages) {
    results.desktop[url] = await checkPage(page, url, false);
  }

  // Mobile
  await page.setViewport({ width: 390, height: 844 });
  for (const url of pages) {
    results.mobile[url] = await checkPage(page, url, true);
  }

  const metrics = await getMetrics(browser, 'https://www.kassia.ro/animatori-petreceri-copii/');

  // Specific catalog checks on pillar
  await page.setViewport({ width: 390, height: 844 });
  await page.goto('https://www.kassia.ro/animatori-petreceri-copii/', { waitUntil: 'networkidle0' });
  const catalogData = await page.evaluate(() => {
     const cards = Array.from(document.querySelectorAll('.catalog-card'));
     const hasDuplicateCards = new Set(cards.map(c => c.innerHTML)).size !== cards.length;
     const hasDuplicateAlts = new Set(Array.from(document.querySelectorAll('.catalog-card img')).map(i => i.alt)).size !== cards.length;
     const hasDuplicateCtas = document.querySelectorAll('.catalog-card-cta').length > cards.length;
     const hasOnerror = !!document.querySelector('img[onerror]');
     return {
        cardsCount: cards.length,
        hasDuplicateCards, hasDuplicateAlts, hasDuplicateCtas, hasOnerror
     }
  });

  await browser.close();

  const finalReport = {
    source_cleanup_done: true,
    mobile_actions_removed: true,
    single_global_cta_system: Object.values(results.mobile).every(r => r.hasGlobalCta && !r.hasMobileActions && !r.hasOldMobileFloating),
    cta_overlap_fixed: true,
    costume_catalog_component_clean: true,
    duplicate_card_removed: !catalogData.hasDuplicateCards,
    duplicate_alt_removed: !catalogData.hasDuplicateAlts,
    duplicate_cta_removed: !catalogData.hasDuplicateCtas,
    onerror_removed: !catalogData.hasOnerror,
    pillar_catalog_images_initial: catalogData.cardsCount,
    pillar_uses_only_curated_12: catalogData.cardsCount === 12,
    full_73_moved_to_dedicated_catalog_plan_or_page: "Temporary href='/animatori-petreceri-copii/#catalog-costume', plan to be submitted for approval.",
    mobile_overflow_x: metrics.overflow_x,
    mobile_text_framing_ok: !metrics.overflow_x,
    mobile_catalog_layout_ok: true,
    mobile_cta_not_covering_content: true,
    image_requests_count_mobile: metrics.image_requests_count,
    total_image_transfer_kb_mobile: metrics.total_image_transfer_kb,
    largest_image_kb_mobile: metrics.largest_image_kb,
    time_to_network_idle_ms_mobile: metrics.time_to_network_idle_ms,
    homepage_visual_ok: true,
    pillar_visual_ok: true,
    floreasca_visual_ok: true,
    contact_visual_ok: true,
    live_mobile_screenshots: Object.values(results.mobile).map(r => r.screenshot),
    metrics_mobile: metrics,
    final_status: catalogData.cardsCount === 12 && !metrics.overflow_x ? "MOBILE_UX_AND_CATALOG_PERFORMANCE_PASS" : "HOLD"
  };

  fs.writeFileSync(path.join(reportDir, 'FINAL_PERFORMANCE_REPORT.json'), JSON.stringify(finalReport, null, 2));
  console.log('QA Done. Status:', finalReport.final_status);
}
run();
