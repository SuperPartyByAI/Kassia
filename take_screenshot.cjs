const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  
  // Desktop
  await page.setViewport({ width: 1280, height: 800 });
  // We go to the preview URL for the contact page in the admin
  // Since it's Astro with DB, maybe we need to find the page ID first.
  // Wait, I can just query the DB for the ID.
  const { createClient } = require('@supabase/supabase-js');
  require('dotenv').config({ path: '.env.local' });
  const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
  const { data: pageData } = await supabase.from('kassia_pages').select('id').eq('path', '/contact/').single();
  
  await page.goto(`http://localhost:4321/admin/visual/${pageData.id}`, { waitUntil: 'networkidle2' });
  await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6dc94c46-8255-4d56-9308-08b791a3cf78/contact_desktop.png', fullPage: true });

  // Mobile
  await page.setViewport({ width: 375, height: 667, isMobile: true });
  await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6dc94c46-8255-4d56-9308-08b791a3cf78/contact_mobile.png', fullPage: true });

  await browser.close();
})();
