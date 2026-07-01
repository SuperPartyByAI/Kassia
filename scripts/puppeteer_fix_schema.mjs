import puppeteer from 'puppeteer-core';
import http from 'http';
import fs from 'fs';

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
      if (!page) {
        console.error("No Supabase SQL tab found.");
        process.exit(1);
      }
      
      await page.bringToFront();
      const sql = fs.readFileSync('scripts/fix_schema.sql', 'utf8');
      
      await page.evaluate(() => {
        const ta = document.querySelector('.monaco-editor textarea');
        if (ta) ta.focus();
      });
      await page.keyboard.down('Meta');
      await page.keyboard.press('a');
      await page.keyboard.press('Backspace');
      await page.keyboard.up('Meta');
      await new Promise(r => setTimeout(r, 200));

      const monacoSuccess = await page.evaluate((sqlText) => {
        try {
          const model = window.monaco.editor.getModels()[0];
          if (model) {
            model.setValue(sqlText);
            return true;
          }
        } catch (e) {}
        return false;
      }, sql);

      if (!monacoSuccess) {
        await page.evaluate(async (sqlText) => {
            await navigator.clipboard.writeText(sqlText);
            const ta = document.querySelector('.monaco-editor textarea');
            if (ta) ta.focus();
        }, sql);
        await page.keyboard.down('Meta');
        await page.keyboard.press('v');
        await page.keyboard.up('Meta');
      }

      await new Promise(r => setTimeout(r, 500));
      
      const clicked = await page.evaluate(() => {
         const buttons = Array.from(document.querySelectorAll('button'));
         const runBtn = buttons.find(b => b.innerText.includes('Run') && !b.innerText.includes('Running'));
         if (runBtn) {
             runBtn.click();
             return true;
         }
         return false;
      });
      
      if (!clicked) {
         await page.keyboard.down('Meta');
         await page.keyboard.press('Enter');
         await page.keyboard.up('Meta');
      }
      
      await new Promise(r => setTimeout(r, 3000));
      console.log("Schema fixed!");
      
      await browser.disconnect();
      process.exit(0);
    } catch(e) {
      console.error(e);
      process.exit(1);
    }
  });
});
