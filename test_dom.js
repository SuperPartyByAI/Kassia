import { JSDOM } from 'jsdom';
async function run() {
  const res = await fetch('https://www.kassia.ro/catalog-costume/');
  const html = await res.text();
  const dom = new JSDOM(html);
  const document = dom.window.document;
  const imgs = document.querySelectorAll('img[src*="/images/animatori-costume/"]');
  console.log("Images found:", imgs.length);
  if (imgs.length > 0) {
     const p = imgs[0].closest('div');
     console.log("Parent class:", p ? p.className : "null");
     const card = imgs[0].closest('.bg-white');
     console.log("Card class:", card ? card.className : "null");
  }
}
run();
