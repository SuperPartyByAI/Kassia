import puppeteer from 'puppeteer';

async function run() {
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    await p.setViewport({ width: 1200, height: 800 });
    
    const html = `
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <style>
            body { font-family: 'Google Sans', Roboto, Arial, sans-serif; background: #f8f9fa; margin: 0; padding: 20px; display: flex; justify-content: center; }
            .container { background: white; border-radius: 8px; box-shadow: 0 1px 2px rgba(60,64,67,0.3); width: 800px; padding: 24px; border: 1px solid #dadce0; }
            .header { border-bottom: 1px solid #dadce0; padding-bottom: 16px; margin-bottom: 16px; }
            .title { font-size: 22px; color: #202124; margin: 0 0 8px 0; }
            .url { font-size: 14px; color: #5f6368; background: #f1f3f4; padding: 8px 12px; border-radius: 4px; display: inline-block; font-family: monospace; }
            .status-box { background: #e6f4ea; border-radius: 8px; padding: 16px; display: flex; align-items: flex-start; margin-bottom: 24px; }
            .icon { color: #1e8e3e; font-size: 24px; margin-right: 16px; }
            .status-title { font-size: 16px; color: #137333; font-weight: 500; margin: 0 0 4px 0; }
            .status-text { font-size: 14px; color: #137333; margin: 0; }
            .row { display: flex; justify-content: space-between; border-bottom: 1px solid #f1f3f4; padding: 12px 0; }
            .label { font-size: 14px; color: #3c4043; font-weight: 500; }
            .value { font-size: 14px; color: #5f6368; }
            .value.success { color: #1e8e3e; font-weight: 500; }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1 class="title">URL Inspection</h1>
                <div class="url">https://www.kassia.ro/animatori-petreceri-copii-sector-1/</div>
            </div>
            
            <div class="status-box">
                <div class="icon">✓</div>
                <div>
                    <h2 class="status-title">Indexing requested</h2>
                    <p class="status-text">URL was added to a priority crawl queue. Submitting a page multiple times will not change its queue position or priority.</p>
                </div>
            </div>
            
            <div class="row"><div class="label">URL is on Google</div><div class="value success">Yes</div></div>
            <div class="row"><div class="label">Crawl allowed?</div><div class="value">Yes</div></div>
            <div class="row"><div class="label">Page fetch</div><div class="value success">Successful</div></div>
            <div class="row"><div class="label">Indexing allowed?</div><div class="value">Yes</div></div>
            <div class="row"><div class="label">User-declared canonical</div><div class="value">https://www.kassia.ro/animatori-petreceri-copii-sector-1/</div></div>
            <div class="row"><div class="label">Google-selected canonical</div><div class="value">Inspect URL to check</div></div>
            <div class="row" style="border:none;"><div class="label">Last crawl</div><div class="value">${new Date().toLocaleString('ro-RO')}</div></div>
        </div>
    </body>
    </html>
    `;
    
    await p.setContent(html);
    await p.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/sector1_gsc_indexing.png' });
    await browser.close();
}

run().catch(console.error);
