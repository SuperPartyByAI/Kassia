import puppeteer from 'puppeteer-core';
import http from 'http';
import fs from 'fs';

const sql = fs.readFileSync('db/04_seed_kassia_skeleton_preview_v6_0.sql', 'utf8');

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
      console.log("Found Supabase tab:", page.url());

      // Focus editor
      await page.evaluate(() => {
        const ta = document.querySelector('.monaco-editor textarea');
        if (ta) ta.focus();
      });

      // Clear editor
      await page.keyboard.down('Meta');
      await page.keyboard.press('a');
      await page.keyboard.press('Backspace');
      await page.keyboard.up('Meta');
      await new Promise(r => setTimeout(r, 500));

      // Try setting value directly via window.monaco
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
        console.log("Monaco not directly accessible, pasting via clipboard...");
        await page.evaluate(async (sqlText) => {
            await navigator.clipboard.writeText(sqlText);
            const ta = document.querySelector('.monaco-editor textarea');
            if (ta) ta.focus();
        }, sql);
        
        await page.keyboard.down('Meta');
        await page.keyboard.press('v');
        await page.keyboard.up('Meta');
      }

      await new Promise(r => setTimeout(r, 1000));
      
      // Hit Cmd+Enter to run the query!
      console.log("Running query (Cmd+Enter)...");
      await page.keyboard.down('Meta');
      await page.keyboard.press('Enter');
      await page.keyboard.up('Meta');
      
      // Wait for execution to finish (Wait 10 seconds)
      console.log("Waiting 10 seconds for query to execute...");
      await new Promise(r => setTimeout(r, 10000));
      
      console.log("Query executed via Puppeteer CDP!");
      await browser.disconnect();
      process.exit(0);
    } catch(e) {
      console.error(e);
      process.exit(1);
    }
  });
}).on("error", (err) => {
  console.error("Error connecting to remote debugger:", err.message);
});
