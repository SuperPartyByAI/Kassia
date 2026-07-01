import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

(async () => {
  const res = await fetch("https://www.kassia.ro/animatori-petreceri-copii-voluntari/");
  const html = await res.text();
  const $ = cheerio.load(html);
  
  console.log("--- IMAGE PROOF ---");
  const img = $("img[src*='voluntari_curte_animator']");
  if (img.length) {
    console.log("Image found: " + img.attr('src'));
    console.log("Alt text: " + img.attr('alt'));
  } else {
    console.log("Image NOT found!");
  }

  console.log("\n--- NEW BLOCKS PROOF ---");
  const blocks = [
    "Pe scurt pentru părinți din Voluntari și Pipera",
    "Cum pregătim zona de joc într-o curte din Voluntari sau Pipera",
    "Un personaj animator sau două personaje animatoare"
  ];
  
  blocks.forEach(b => {
    const heading = $(`h2:contains('${b}')`);
    if (heading.length) {
      console.log(`\nFOUND: ${b}`);
      console.log(heading.next('div').text().replace(/\s+/g, ' ').trim());
    } else {
      console.log(`\nNOT FOUND: ${b}`);
    }
  });
})();
