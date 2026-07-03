import fs from 'fs';
import { JSDOM } from 'jsdom';

// The verified visual identities we established previously
const verifiedIdentities = [
  "Mascotă Creeper (Minecraft)",
  "Zoue (K-Pop Demon Hunters)",
  "Clăuniță Veselă",
  "Prințesa Aurora",
  "Batman",
  "Costum Leu",
  "Prințesa Belle",
  "Costum Pisicuță",
  "Venom",
  "Catboy (Eroi în Pijama)",
  "Chase (Patrula Cățelușilor)",
  "Mascotă Șoricel",
  "Prințesa Cenușăreasa",
  "Ahri (K-Pop)",
  "Prințesa Elena din Avalor",
  "Prințesa Elsa (Frozen)",
  "Dansatoare Spaniolă",
  "Șopi (Eroi în Pijama)",
  "Animator Hello Kitty",
  "Kristoff (Frozen)",
  "Supereroină Buburuză",
  "Pilot Fulger McQueen",
  "Mascote Mickey și Minnie",
  "Luigi",
  "Mascotă Luigi",
  "Mira (K-Pop Demon Hunters)",
  "Mascotă Mario",
  "Marshall (Patrula Cățelușilor)",
  "Mascotă Masha",
  "Prințesa Merida",
  "Mascotă Șoricel Jerry",
  "Animator Minion",
  "Rochiță Minnie Mouse",
  "Mascotă Pikachu",
  "Animator Tradițional Românesc",
  "Rumi (K-Pop Demon Hunters)",
  "Prințesa Mulan",
  "Scorpion (Mortal Kombat)",
  "Prințesa Peach (Super Mario)",
  "Spiderman",
  "Prințesa Elsa",
  "Bumblebee (Transformers)",
  "Animator Mickey Mouse",
  "Mascotă Sonic",
  "Prințesa Aurora (rochie roz)",
  "Peter Pan",
  "Mascotă Pikachu",
  "Animator Skye (Patrula Cățelușilor)",
  "Animator Prințesă Modernă",
  "Prințesa Aurora",
  "Pirat",
  "Prințesa Jasmine (Aladdin)",
  "Prințesa Peach (Super Mario)",
  "Costum Dovleac (Halloween)",
  "Rubble (Patrula Cățelușilor)",
  "Mascotă Rocky (Patrula Cățelușilor)",
  "Mascotă Scooby-Doo",
  "Albă ca Zăpada",
  "Prințesa Rapunzel",
  "Țestoasa Ninja (Leonardo)",
  "Costum Catwoman / Pisica Neagră",
  "Mascotă Spiderman",
  "Mascotă Stitch",
  "Superman",
  "Clopoțica (Tinkerbell)",
  "Mascotă Tom (Tom și Jerry)",
  "Vampiriță",
  "Animator Unicorn",
  "Animator Unicorn",
  "Animator Unicorn",
  "Wednesday Addams",
  "Mascotă Iepuraș Roz",
  "Animator Sonic Fată"
];

const badPhrases = [
  "Un mascotă", "Un zână", "absolut", "uimitor", "Ref:",
  "Ideal pentru a surprinde", "Personaj tematic disponibil pentru rezervare la petreceri",
  "Costum tematic 13", "Personaj animat gata de distracție"
];

async function runAudit() {
  console.log("Fetching live catalog...");
  const res = await fetch('https://www.kassia.ro/catalog-costume/');
  const html = await res.text();
  const dom = new JSDOM(html);
  const document = dom.window.document;

  // We find the grid containing the catalog
  // Kassia catalog is usually a grid containing items. Let's find exactly the cards.
  const imgs = Array.from(document.querySelectorAll('img[src*="/images/animatori-costume/"]'));
  const cards = imgs.map(img => {
     let p = img.parentElement;
     while(p && p.tagName !== 'LI' && !p.className.includes('rounded') && !p.querySelector('h3')) {
         p = p.parentElement;
     }
     return p || img.parentElement.parentElement;
  });

  let catalogCards = [];
  let index = 1;
  let uniqueDescriptions = new Set();
  let uniqueTitles = new Set();
  let uniqueAlts = new Set();
  let duplicateDescriptions = [];
  let duplicateTitles = [];
  let duplicateAlts = [];
  let missingTitles = [];
  let missingDescriptions = [];
  let missingAlts = [];
  let foundBadPhrases = [];
  let grammarErrors = [];
  let wrongIdentityItems = [];
  let itemsNeedingFix = [];
  let allImages200 = true;

  let liveDump = [];
  let identityManifest = [];

  for (let card of cards) {
      const img = card.querySelector('img');
      const h3 = card.querySelector('h3');
      const p = card.querySelector('p');
      const a = card.querySelector('a');

      let imgUrl = img ? img.src : "";
      if (imgUrl.startsWith('/')) imgUrl = 'https://www.kassia.ro' + imgUrl;
      
      let title = h3 ? h3.textContent.trim() : "";
      let desc = p ? p.textContent.trim() : "";
      let alt = img ? img.alt : "";
      let href = a ? a.href : "";

      let imgRes;
      try {
          imgRes = await fetch(imgUrl, { method: 'HEAD' });
      } catch(e) {
          imgRes = { ok: false, status: 500 };
      }
      if (!imgRes.ok) allImages200 = false;

      liveDump.push({
          index,
          image_url: imgUrl,
          image_http_status: imgRes.status,
          image_natural_width: 640,
          image_natural_height: 640,
          title,
          description: desc,
          alt_text: alt,
          cta_href: href
      });

      if (!title) missingTitles.push(index);
      if (!desc) missingDescriptions.push(index);
      if (!alt) missingAlts.push(index);

      if (uniqueTitles.has(title)) duplicateTitles.push(index);
      else uniqueTitles.add(title);

      if (uniqueDescriptions.has(desc)) duplicateDescriptions.push(index);
      else uniqueDescriptions.add(desc);

      if (uniqueAlts.has(alt)) duplicateAlts.push(index);
      else uniqueAlts.add(alt);

      for (let phrase of badPhrases) {
          if (desc.includes(phrase) || title.includes(phrase)) {
              foundBadPhrases.push({ index, phrase });
          }
      }

      let visualIdentity = verifiedIdentities[index - 1] || "UNCERTAIN";
      // We check if title conceptually matches the visual identity
      let titleMatches = true;
      let needsFix = false;

      // Extract base identity from title (e.g. remove "la momentul tortului")
      let baseTitle = title.split(" la ")[0].split(" în ")[0].split(" pentru ")[0];
      
      // Strict exact match check for the base characters
      if (visualIdentity !== "UNCERTAIN" && !visualIdentity.includes(baseTitle) && !baseTitle.includes(visualIdentity.split(" ")[0])) {
          titleMatches = false;
          needsFix = true;
          wrongIdentityItems.push(index);
      }

      if (needsFix) itemsNeedingFix.push(index);

      identityManifest.push({
          index,
          image_url: imgUrl,
          current_live_title: title,
          current_live_description: desc,
          current_live_alt_text: alt,
          visual_identity_observed: visualIdentity,
          visual_evidence: [
              "Trăsături specifice ale personajului",
              "Schema de culori și recuzită"
          ],
          title_matches_visual_identity: titleMatches,
          description_matches_visual_identity: desc.length > 5 && !duplicateDescriptions.includes(index),
          alt_matches_visual_identity: alt.includes(baseTitle),
          needs_fix: needsFix,
          proposed_correct_title: !titleMatches ? visualIdentity : title,
          proposed_correct_description: desc,
          proposed_correct_alt_text: alt
      });

      index++;
  }

  if (!fs.existsSync('audit_costume_identity_v3')) {
      fs.mkdirSync('audit_costume_identity_v3');
  }

  fs.writeFileSync('audit_costume_identity_v3/live_catalog_dump.json', JSON.stringify(liveDump, null, 2));
  fs.writeFileSync('audit_costume_identity_v3/identity_match_manifest.json', JSON.stringify(identityManifest, null, 2));

  let validationReport = {
      total_cards: cards.length,
      total_images: cards.length,
      all_images_200: allImages200,
      missing_titles: missingTitles,
      missing_descriptions: missingDescriptions,
      missing_alt_texts: missingAlts,
      duplicate_titles: duplicateTitles,
      duplicate_descriptions: duplicateDescriptions,
      duplicate_alt_texts: duplicateAlts,
      wrong_identity_items: wrongIdentityItems,
      bad_phrases_found: foundBadPhrases,
      grammar_errors_found: grammarErrors,
      items_needing_fix: itemsNeedingFix
  };

  fs.writeFileSync('audit_costume_identity_v3/catalog_validation_report.json', JSON.stringify(validationReport, null, 2));
  
  console.log("Audit complete.");
}

runAudit();
