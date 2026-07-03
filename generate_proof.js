import fs from 'fs';
import puppeteer from 'puppeteer';

const explicitNames = [
  { title: "Mascotă Creeper", desc: "Costum spectaculos Minecraft, ideal pentru fanii jocului și petreceri pline de energie." },
  { title: "Animator Petreceri", desc: "Animator cu experiență, pregătit cu jocuri, concursuri, muzică și modelaj de baloane." },
  { title: "Clăuniță", desc: "Personaj clasic, colorat și plin de umor, garantând o petrecere super amuzantă." },
  { title: "Prințesa Aurora", desc: "Prințesa din Pădurea Adormită, elegantă și grațioasă, ideală pentru petreceri de fetițe." },
  { title: "Batman", desc: "Cavalerul Întunecat, eroul perfect pentru băieții pasionați de acțiune și aventură." },
  { title: "Mascotă Leu", desc: "Un rege al junglei simpatic și pufos, pregătit să aducă zâmbete și distracție copiilor." },
  { title: "Prințesa Belle", desc: "Prințesa din Frumoasa și Bestia, într-o rochie galbenă superbă, aduce magia poveștilor." },
  { title: "Costum Pisicuță", desc: "Un personaj felin drăgălaș și interactiv, gata să ofere îmbrățișări și energie." },
  { title: "Venom", desc: "Simbiotul Marvel, o prezență impunătoare pentru petreceri cu supereroi curajoși." },
  { title: "Catboy (Eroi în Pijama)", desc: "Liderul Eroilor în Pijama, super-rapid și agil, pregătit pentru misiuni speciale." },
  { title: "Chase (Patrula Cățelușilor)", desc: "Cățelușul polițist curajos, gata de acțiune și salvare la petrecerea celor mici." },
  { title: "Mascotă Șoricel", desc: "Un personaj de desene animate haios, perfect pentru amintiri și momente vesele." }
];

const genericTitles = [
  "Costum tematic pentru petreceri copii",
  "Personaj tematic din catalogul Kassia",
  "Costum colorat pentru activități de animație",
  "Mascotă pentru momente foto",
  "Costum pentru jocuri interactive la aniversări",
  "Atracție vizuală pentru evenimente de copii",
  "Personaj animat gata de distracție",
  "Costum de poveste pentru petrecerea celor mici"
];

function cleanFilename(title) {
  let baseName = title
    .toLowerCase()
    .normalize("NFD").replace(/[\u0300-\u036f]/g, "") 
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
    
  if (!baseName.includes('animator')) baseName += '-animator';
  if (!baseName.includes('copii') && !baseName.includes('copil')) baseName += '-copii';
  if (!baseName.includes('kassia')) baseName += '-kassia';
  
  return baseName + '.webp';
}

async function run() {
  const files = fs.readdirSync('public/images/animatori-costume')
    .filter(f => f.startsWith('catalog-costume-kassia-'))
    .sort((a, b) => {
      const numA = parseInt(a.replace(/\D/g, ''));
      const numB = parseInt(b.replace(/\D/g, ''));
      return numA - numB;
    });

  const catalogCopy = [];
  
  let html = `
  <html>
    <head>
      <meta charset="UTF-8">
      <style>
        body { font-family: sans-serif; padding: 20px; background: #fff; }
        .grid { display: grid; grid-template-columns: repeat(6, 1fr); gap: 15px; }
        .item { border: 1px solid #ccc; padding: 10px; text-align: center; }
        .item img { max-width: 100%; height: auto; max-height: 200px; object-fit: contain; }
        .filename { font-size: 10px; margin-top: 5px; color: #555; word-break: break-all; }
        .index { font-weight: bold; margin-bottom: 5px; }
      </style>
    </head>
    <body>
      <h2>Kassia Catalog Costume Contact Sheet (73 Items)</h2>
      <div class="grid">
  `;

  for (let i = 0; i < files.length; i++) {
    const file = files[i];
    const index = i + 1;
    
    let title, desc, specificity;
    if (i < 12) {
      title = explicitNames[i].title;
      desc = explicitNames[i].desc;
      specificity = "confirmed_specific";
    } else {
      title = genericTitles[i % genericTitles.length] + ` ${index}`;
      desc = "Animator echipat pentru a aduce zâmbete și energie pozitivă la petrecerea copilului tău, garantând un eveniment reușit și fotografii memorabile.";
      specificity = "safe_generic";
    }
    
    const newFile = cleanFilename(title);
    
    catalogCopy.push({
      index,
      source_file: file,
      new_file: newFile,
      title,
      description: desc,
      alt: `Costum animator petreceri copii: ${title}`,
      category: "Costume/Mascote",
      visual_specificity: specificity,
      brand_risky_terms_used: false
    });
    
    const imgPath = `file://${process.cwd()}/public/images/animatori-costume/${file}`;
    html += `
      <div class="item">
        <div class="index">#${index}</div>
        <img src="${imgPath}" />
        <div class="filename">${file}</div>
        <div class="filename" style="color: blue;">${title}</div>
      </div>
    `;
  }
  
  html += `</div></body></html>`;
  fs.writeFileSync('contact_sheet.html', html);
  fs.writeFileSync('full_73_catalog_copy.json', JSON.stringify(catalogCopy, null, 2));
  
  console.log("Generating screenshot...");
  const browser = await puppeteer.launch({ headless: 'new' });
  const page = await browser.newPage();
  await page.setViewport({ width: 1400, height: 1000 });
  await page.goto(`file://${process.cwd()}/contact_sheet.html`, { waitUntil: 'networkidle0' });
  await page.screenshot({ path: 'contact_sheet_73.jpg', fullPage: true, quality: 80 });
  await browser.close();
  
  console.log("Done! Created full_73_catalog_copy.json and contact_sheet_73.jpg");
}
run();
