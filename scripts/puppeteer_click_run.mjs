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
        console.log("Found tab. Attempting to click Run button...");
        
        const clicked = await page.evaluate(() => {
           // Find a button with text 'Run'
           const buttons = Array.from(document.querySelectorAll('button'));
           const runBtn = buttons.find(b => b.innerText.includes('Run') && !b.innerText.includes('Running'));
           if (runBtn) {
               runBtn.click();
               return true;
           }
           return false;
        });
        
        if (clicked) {
            console.log("Run button clicked! Waiting 10 seconds...");
            await new Promise(r => setTimeout(r, 10000));
        } else {
            console.log("Run button not found.");
        }
      }
      
      await browser.disconnect();
      process.exit(0);
    } catch(e) {
      console.error(e);
      process.exit(1);
    }
  });
});
