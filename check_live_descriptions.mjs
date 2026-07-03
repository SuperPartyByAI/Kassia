import puppeteer from 'puppeteer';

async function check() {
  const browser = await puppeteer.launch({ headless: 'new' });
  const page = await browser.newPage();
  await page.goto('https://www.kassia.ro/catalog-costume/', { waitUntil: 'networkidle0' });

  const data = await page.evaluate(() => {
      const cards = Array.from(document.querySelectorAll('.catalog-card'));
      const descriptions = cards.map(c => c.querySelector('.catalog-card-desc')?.innerText || "");
      const titles = cards.map(c => c.querySelector('.catalog-card-title')?.innerText || "");
      return { titles, descriptions };
  });

  const repeated = data.descriptions.filter(d => d.includes("Pachetul spectaculos și interactiv"));
  console.log("Total descriptions with template:", repeated.length);
  if (repeated.length > 0) {
      console.log("Sample repeated:", repeated[0]);
  } else {
      console.log("No templates found! Checking a few descriptions:");
      console.log(data.titles[0], "->", data.descriptions[0]);
      console.log(data.titles[1], "->", data.descriptions[1]);
  }
  
  await browser.close();
}
check();
