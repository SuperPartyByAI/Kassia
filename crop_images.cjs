const puppeteer = require('puppeteer');

(async () => {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii-berceni/';
  const outDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227';
  
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  try {
    await page.setViewport({ width: 1280, height: 800 });
    await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    
    // Scroll down to ensure lazy loaded images load
    await page.evaluate(async () => {
        await new Promise((resolve) => {
            let totalHeight = 0;
            let distance = 100;
            let timer = setInterval(() => {
                let scrollHeight = document.body.scrollHeight;
                window.scrollBy(0, distance);
                totalHeight += distance;
                if(totalHeight >= scrollHeight - window.innerHeight){
                    clearInterval(timer);
                    resolve();
                }
            }, 100);
        });
    });
    
    await new Promise(r => setTimeout(r, 1000));
    
    // Crop each main image
    const images = await page.evaluate(() => {
      const imgs = Array.from(document.querySelectorAll('main img'));
      // Filter out avatars
      const mainImgs = imgs.filter(img => !img.src.includes('avatar'));
      return mainImgs.map((img, index) => {
          const rect = img.getBoundingClientRect();
          return {
              index: index,
              src: img.src.split('/').pop(),
              x: rect.x,
              y: rect.y + window.scrollY,
              width: rect.width,
              height: rect.height
          };
      });
    });
    
    for (const img of images) {
        if (img.width > 0 && img.height > 0) {
            await page.screenshot({
                path: `${outDir}/crop_${img.index}_${img.src}.png`,
                clip: {
                    x: img.x,
                    y: img.y,
                    width: img.width,
                    height: img.height
                }
            });
            console.log(`Saved crop for ${img.src}`);
        }
    }
  } catch (err) {
    console.error(err);
  } finally {
    await browser.close();
  }
})();
