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
        
        const results = await page.evaluate(() => {
           // Look for results tab
           const resultsContainer = document.querySelector('.monaco-editor');
           // Look for any text containing "error" or "Error" or "Failed"
           const elements = Array.from(document.querySelectorAll('*'));
           const errorTexts = elements.filter(el => {
               if (el.children.length > 0) return false; // leaf nodes only
               return el.innerText && (el.innerText.toLowerCase().includes('error') || el.innerText.toLowerCase().includes('failed') || el.innerText.includes('relation'));
           }).map(e => e.innerText);
           
           return errorTexts.join('\n');
        });
        
        console.log("Found error texts:\n", results);
      }
      
      await browser.disconnect();
      process.exit(0);
    } catch(e) {
      console.error(e);
      process.exit(1);
    }
  });
});
