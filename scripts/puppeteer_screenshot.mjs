import puppeteer from 'puppeteer-core';
import http from 'http';

http.get("http://127.0.0.1:9222/json/version", (res) => {
  let data = "";
  res.on("data", (chunk) => (data += chunk));
  res.on("end", async () => {
    try {
      const { webSocketDebuggerUrl } = JSON.parse(data);
      const browser = await puppeteer.connect({
        browserWSEndpoint: webSocketDebuggerUrl,
        defaultViewport: null
      });
      const pages = await browser.pages();
      
      const page = pages.find((p) => p.url().includes("supabase.com/dashboard/project/jrfhprnuxxfwkwjwdsez/sql"));
      if (page) {
        await page.bringToFront();
        await new Promise(r => setTimeout(r, 1000));
        await page.screenshot({ path: 'supabase_screenshot.png' });
        
        // Also grab all text that looks like an error
        const text = await page.evaluate(() => {
           return Array.from(document.querySelectorAll('*')).filter(el => {
               const style = window.getComputedStyle(el);
               return style.color.includes('239, 68, 68') || style.backgroundColor.includes('239, 68, 68') || el.classList.contains('text-red-900');
           }).map(el => el.innerText).join('\n');
        });
        console.log("Error text found:", text.substring(0, 500));
      }
      
      console.log("Screenshot taken.");
      await browser.disconnect();
      process.exit(0);
    } catch(e) {
      console.error(e);
      process.exit(1);
    }
  });
});
