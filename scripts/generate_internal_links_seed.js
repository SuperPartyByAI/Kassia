import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Import page lists to generate logic
// We redefine them or parse them from generate_seed.js if needed.
// For self-containment, I'll copy the lists.

const servicePages = [
  '/decoratiuni-baloane-bucuresti/',
  '/aranjamente-baloane-bucuresti/',
  '/arcada-baloane-bucuresti/',
  '/baloane-heliu-bucuresti/',
  '/panou-foto-baloane-bucuresti/',
  '/buchete-baloane-bucuresti/',
  '/baloane-personalizate-bucuresti/',
  '/baloane-cifre-litere-bucuresti/',
  '/ghirlande-baloane-bucuresti/',
  '/stalpi-baloane-bucuresti/',
  '/perete-baloane-bucuresti/',
  '/decor-baloane-candy-bar-bucuresti/',
  '/livrare-baloane-bucuresti/'
];

const eventPages = [
  '/decoratiuni-baloane-botez-bucuresti/',
  '/decoratiuni-baloane-mot-bucuresti/',
  '/decoratiuni-baloane-turta-bucuresti/',
  '/decoratiuni-baloane-nunta-bucuresti/',
  '/arcada-baloane-nunta-bucuresti/',
  '/decoratiuni-baloane-cununie-bucuresti/',
  '/decoratiuni-baloane-majorat-bucuresti/',
  '/decoratiuni-baloane-aniversare-copii-bucuresti/',
  '/decoratiuni-baloane-aniversare-adulti-bucuresti/',
  '/decoratiuni-baloane-petrecere-bucuresti/',
  '/decoratiuni-baloane-corporate-bucuresti/',
  '/decoratiuni-baloane-deschidere-magazin-bucuresti/',
  '/decoratiuni-baloane-deschidere-restaurant-bucuresti/',
  '/decoratiuni-baloane-lansare-produs-bucuresti/',
  '/decoratiuni-baloane-showroom-bucuresti/',
  '/decoratiuni-baloane-gradinita-bucuresti/',
  '/decoratiuni-baloane-scoala-bucuresti/',
  '/decoratiuni-baloane-baby-shower-bucuresti/',
  '/decoratiuni-baloane-gender-reveal-bucuresti/',
  '/decoratiuni-baloane-craciun-bucuresti/',
  '/decoratiuni-baloane-revelion-bucuresti/',
  '/decoratiuni-baloane-paste-bucuresti/',
  '/decoratiuni-baloane-halloween-bucuresti/',
  '/decoratiuni-baloane-1-iunie-bucuresti/',
  '/decoratiuni-baloane-absolvire-bucuresti/'
];

const sectorPages = [
  '/decoratiuni-baloane-sector-1/',
  '/decoratiuni-baloane-sector-2/',
  '/decoratiuni-baloane-sector-3/',
  '/decoratiuni-baloane-sector-4/',
  '/decoratiuni-baloane-sector-5/',
  '/decoratiuni-baloane-sector-6/'
];

const neighborhoodPages = [
  '/decoratiuni-baloane-aviatiei/',
  '/decoratiuni-baloane-baneasa/',
  '/decoratiuni-baloane-domenii/',
  '/decoratiuni-baloane-herastrau/',
  '/decoratiuni-baloane-victoriei/',
  '/decoratiuni-baloane-colentina/',
  '/decoratiuni-baloane-obor/',
  '/decoratiuni-baloane-pantelimon/',
  '/decoratiuni-baloane-tei/',
  '/decoratiuni-baloane-stefan-cel-mare/',
  '/decoratiuni-baloane-dristor/',
  '/decoratiuni-baloane-titan/',
  '/decoratiuni-baloane-vitan/',
  '/decoratiuni-baloane-unirii/',
  '/decoratiuni-baloane-dudesti/',
  '/decoratiuni-baloane-berceni/',
  '/decoratiuni-baloane-tineretului/',
  '/decoratiuni-baloane-piata-sudului/',
  '/decoratiuni-baloane-aparatorii-patriei/',
  '/decoratiuni-baloane-oltenitei/',
  '/decoratiuni-baloane-rahova/',
  '/decoratiuni-baloane-cotroceni/',
  '/decoratiuni-baloane-13-septembrie/',
  '/decoratiuni-baloane-ferentari/',
  '/decoratiuni-baloane-sebastian/',
  '/decoratiuni-baloane-drumul-taberei/',
  '/decoratiuni-baloane-militari/',
  '/decoratiuni-baloane-crangasi/',
  '/decoratiuni-baloane-giulesti/',
  '/decoratiuni-baloane-grozavesti/'
];

const ilfovPages = [
  '/decoratiuni-baloane-ilfov/',
  '/decoratiuni-baloane-voluntari/',
  '/decoratiuni-baloane-pipera/',
  '/decoratiuni-baloane-otopeni/',
  '/decoratiuni-baloane-tunari/',
  '/decoratiuni-baloane-corbeanca/',
  '/decoratiuni-baloane-balotesti/',
  '/decoratiuni-baloane-mogosoaia/',
  '/decoratiuni-baloane-chitila/',
  '/decoratiuni-baloane-chiajna/',
  '/decoratiuni-baloane-domnesti/',
  '/decoratiuni-baloane-bragadiru/',
  '/decoratiuni-baloane-magurele/',
  '/decoratiuni-baloane-popesti-leordeni/',
  '/decoratiuni-baloane-berceni-ilfov/',
  '/decoratiuni-baloane-pantelimon-ilfov/',
  '/decoratiuni-baloane-cernica/',
  '/decoratiuni-baloane-afumati/',
  '/decoratiuni-baloane-stefanestii-de-jos/',
  '/decoratiuni-baloane-dascalu/',
  '/decoratiuni-baloane-snagov/',
  '/decoratiuni-baloane-clinceni/',
  '/decoratiuni-baloane-dragomiresti-vale/',
  '/decoratiuni-baloane-jilava/',
  '/decoratiuni-baloane-1-decembrie/'
];

const satellitePages = [
  '/arcada-baloane-botez-bucuresti/',
  '/arcada-baloane-majorat-bucuresti/',
  '/arcada-baloane-nunta-bucuresti/',
  '/panou-foto-baloane-botez-bucuresti/',
  '/panou-foto-baloane-majorat-bucuresti/',
  '/baloane-heliu-majorat-bucuresti/',
  '/baloane-heliu-aniversare-bucuresti/',
  '/buchete-baloane-aniversare-bucuresti/',
  '/decoratiuni-baloane-roz-auriu-bucuresti/',
  '/decoratiuni-baloane-alb-auriu-bucuresti/'
];

const locationPages = [...sectorPages, ...neighborhoodPages, ...ilfovPages];

const pilonPath = '/decoratiuni-baloane-bucuresti/';

let sqlOut = `-- Seed Data for Kassia SEO Internal Links\n\n`;

// Helper to generate the ON CONFLICT insert statement
function generateInsert(source, target, anchor) {
  if (source === target) return ''; // no_self_link constraint

  return `
    INSERT INTO internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, '${anchor.replace(/'/g, "''")}'
    FROM pages p1, pages p2
    WHERE p1.path = '${source}' AND p2.path = '${target}'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;
`;
}

sqlOut += `DO $$\nBEGIN\n\n`;

// A. Pilon to specific pages
sqlOut += `    -- A. Pilon to specific pages\n`;
sqlOut += generateInsert(pilonPath, '/arcada-baloane-bucuresti/', 'arcadă baloane București');
sqlOut += generateInsert(pilonPath, '/baloane-heliu-bucuresti/', 'baloane cu heliu București');
sqlOut += generateInsert(pilonPath, '/panou-foto-baloane-bucuresti/', 'panou foto cu baloane');
sqlOut += generateInsert(pilonPath, '/buchete-baloane-bucuresti/', 'buchete de baloane');
sqlOut += generateInsert(pilonPath, '/baloane-personalizate-bucuresti/', 'baloane personalizate');
sqlOut += generateInsert(pilonPath, '/decoratiuni-baloane-botez-bucuresti/', 'decorațiuni baloane botez');
sqlOut += generateInsert(pilonPath, '/decoratiuni-baloane-nunta-bucuresti/', 'decorațiuni baloane nuntă');
sqlOut += generateInsert(pilonPath, '/decoratiuni-baloane-majorat-bucuresti/', 'decorațiuni baloane majorat');
sqlOut += generateInsert(pilonPath, '/decoratiuni-baloane-corporate-bucuresti/', 'decorațiuni baloane corporate');
sqlOut += generateInsert(pilonPath, '/decoratiuni-baloane-deschidere-restaurant-bucuresti/', 'decorațiuni baloane deschidere restaurant');
sqlOut += generateInsert(pilonPath, '/decoratiuni-baloane-ilfov/', 'decorațiuni baloane Ilfov');
sqlOut += generateInsert(pilonPath, '/preturi-decoratiuni-baloane/', 'prețuri decorațiuni baloane');

// B. Service to Pilon, Prices, Contact
sqlOut += `\n    -- B. Service pages links\n`;
servicePages.forEach(p => {
  if (p === pilonPath) return; // pilon itself is a service page technically, but handled above
  sqlOut += generateInsert(p, pilonPath, 'decorațiuni baloane București');
  sqlOut += generateInsert(p, '/preturi-decoratiuni-baloane/', 'prețuri decorațiuni baloane');
  sqlOut += generateInsert(p, '/contact/', 'contact');
});

// C. Event to Services, Prices, Contact
sqlOut += `\n    -- C. Event pages links\n`;
eventPages.forEach(p => {
  sqlOut += generateInsert(p, pilonPath, 'decorațiuni baloane București');
  sqlOut += generateInsert(p, '/arcada-baloane-bucuresti/', 'arcadă baloane');
  sqlOut += generateInsert(p, '/baloane-heliu-bucuresti/', 'baloane cu heliu');
  sqlOut += generateInsert(p, '/panou-foto-baloane-bucuresti/', 'panou foto');
  sqlOut += generateInsert(p, '/preturi-decoratiuni-baloane/', 'prețuri decorațiuni');
  sqlOut += generateInsert(p, '/contact/', 'cere ofertă');
});

// D. Location to Services, Events, Contact
sqlOut += `\n    -- D. Location pages links\n`;
locationPages.forEach(p => {
  if (p === '/decoratiuni-baloane-ilfov/') {
     // Specific handled
  }
  sqlOut += generateInsert(p, pilonPath, 'decorațiuni baloane București');
  sqlOut += generateInsert(p, '/arcada-baloane-bucuresti/', 'arcadă baloane București');
  sqlOut += generateInsert(p, '/baloane-heliu-bucuresti/', 'baloane cu heliu');
  sqlOut += generateInsert(p, '/decoratiuni-baloane-botez-bucuresti/', 'decorațiuni botez');
  sqlOut += generateInsert(p, '/decoratiuni-baloane-majorat-bucuresti/', 'decorațiuni majorat');
  sqlOut += generateInsert(p, '/contact/', 'contactează-ne');
});

// E. Satellite to Parents, Contact
sqlOut += `\n    -- E. Satellite pages links\n`;
satellitePages.forEach(p => {
  sqlOut += generateInsert(p, pilonPath, 'decorațiuni baloane');
  sqlOut += generateInsert(p, '/contact/', 'contact');
  
  // Logic to guess parent service based on satellite slug
  if (p.includes('arcada')) {
    sqlOut += generateInsert(p, '/arcada-baloane-bucuresti/', 'arcade baloane București');
  } else if (p.includes('panou-foto')) {
    sqlOut += generateInsert(p, '/panou-foto-baloane-bucuresti/', 'panouri foto baloane');
  } else if (p.includes('heliu')) {
    sqlOut += generateInsert(p, '/baloane-heliu-bucuresti/', 'baloane heliu București');
  } else if (p.includes('buchete')) {
    sqlOut += generateInsert(p, '/buchete-baloane-bucuresti/', 'buchete baloane București');
  }
  
  if (p.includes('botez')) {
    sqlOut += generateInsert(p, '/decoratiuni-baloane-botez-bucuresti/', 'decorațiuni botez');
  } else if (p.includes('majorat')) {
    sqlOut += generateInsert(p, '/decoratiuni-baloane-majorat-bucuresti/', 'decorațiuni majorat');
  } else if (p.includes('nunta')) {
    sqlOut += generateInsert(p, '/decoratiuni-baloane-nunta-bucuresti/', 'decorațiuni nuntă');
  } else if (p.includes('aniversare')) {
    sqlOut += generateInsert(p, '/decoratiuni-baloane-aniversare-adulti-bucuresti/', 'decorațiuni aniversare');
  }
});

// F. Support pages
sqlOut += `\n    -- F. Support pages links\n`;
// /preturi-decoratiuni-baloane/
sqlOut += generateInsert('/preturi-decoratiuni-baloane/', pilonPath, 'decorațiuni baloane București');
sqlOut += generateInsert('/preturi-decoratiuni-baloane/', '/arcada-baloane-bucuresti/', 'preț arcadă baloane');
sqlOut += generateInsert('/preturi-decoratiuni-baloane/', '/baloane-heliu-bucuresti/', 'preț baloane cu heliu');

// /galerie/
sqlOut += generateInsert('/galerie/', pilonPath, 'decoruri baloane București');
sqlOut += generateInsert('/galerie/', '/decoratiuni-baloane-botez-bucuresti/', 'baloane botez');
sqlOut += generateInsert('/galerie/', '/decoratiuni-baloane-nunta-bucuresti/', 'baloane nuntă');

// /contact/
sqlOut += generateInsert('/contact/', '/', 'înapoi acasă');
sqlOut += generateInsert('/contact/', pilonPath, 'decorațiuni baloane București');

sqlOut += `\nEND $$;\n`;

fs.writeFileSync(path.join(__dirname, '../db/04_seed_internal_links.sql'), sqlOut);
console.log('Internal links SQL generated successfully.');
