import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const supportPages = [
  '/',
  '/despre-noi/',
  '/contact/',
  '/galerie/',
  '/preturi-decoratiuni-baloane/',
  '/intrebari-frecvente/',
  '/recenzii/',
  '/portofoliu-evenimente/',
  '/termeni-si-conditii/',
  '/politica-de-confidentialitate/',
  '/blog/'
];

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

// Helper to format words
function toTitleCase(str) {
  return str.split('-').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');
}

// Generate base SEO fields
function generateSEO(rawUrl, type) {
  let isHome = rawUrl === '/';
  let slug = isHome ? 'home' : rawUrl.replace(/\//g, '');
  let fullPath = isHome ? '/' : `/${slug}/`;
  
  let title = isHome ? 'Homepage' : toTitleCase(slug);
  let h1 = title;
  let meta_title = '';
  let meta_description = '';
  let priority = 0.5;

  if (isHome) {
    h1 = 'Decorațiuni Baloane București și Ilfov';
    meta_title = 'Decorațiuni Baloane București | Botez, Nuntă, Majorat | Kassia';
    meta_description = 'Kassia oferă cele mai frumoase decorațiuni cu baloane în București și Ilfov. Arcade, panouri foto, heliu și aranjamente personalizate. Cere o ofertă!';
    priority = 1.0;
  } else if (type === 'support') {
    h1 = title;
    meta_title = `${title} - Kassia Decorațiuni Baloane`;
    meta_description = `Află mai multe despre ${title.toLowerCase()} la Kassia, echipa ta de decorațiuni cu baloane din București.`;
    priority = 0.8;
  } else if (type === 'service') {
    h1 = `${title} pentru Evenimente`;
    meta_title = `${title} – Prețuri & Montaj`;
    meta_description = `Realizăm ${title.toLowerCase()} pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.`;
    priority = 0.9;
  } else if (type === 'event') {
    h1 = `${title}`;
    meta_title = `${title} – Pachete & Ofertă`;
    meta_description = `Transformă evenimentul tău cu ${title.toLowerCase()}. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.`;
    priority = 0.8;
  } else if (type === 'location') {
    h1 = `${title}`;
    meta_title = `${title} – Montaj Rapid`;
    meta_description = `Cauți decorațiuni cu baloane în ${title.replace('Decoratiuni Baloane ', '')}? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.`;
    priority = 0.7;
  } else if (type === 'satellite') {
    h1 = `${title}`;
    meta_title = `${title} – Kassia Decor`;
    meta_description = `Oferim ${title.toLowerCase()} cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.`;
    priority = 0.6;
  }

  return { slug, fullPath, title, h1, meta_title, meta_description, priority };
}

// Generate Sections based on page_type
function getSectionsForType(type) {
  if (type === 'support') return ['hero', 'content', 'final_cta'];
  if (type === 'service') return ['hero', 'intro', 'service_features', 'event_use_cases', 'gallery', 'pricing', 'process', 'locations', 'faq', 'related_pages', 'final_cta'];
  if (type === 'event') return ['hero', 'intro', 'decor_options', 'recommended_services', 'gallery', 'pricing', 'process', 'locations', 'faq', 'related_pages', 'final_cta'];
  if (type === 'location') return ['hero', 'intro', 'available_services', 'nearby_areas', 'gallery', 'pricing', 'transport_info', 'faq', 'related_pages', 'final_cta'];
  if (type === 'satellite') return ['hero', 'intro', 'gallery', 'pricing', 'faq', 'final_cta'];
  return [];
}

let sqlOut = `-- Seed Data for Kassia SEO CMS\n\n`;

const allPages = [
  ...supportPages.map(s => ({ rawUrl: s, type: 'support' })),
  ...servicePages.map(s => ({ rawUrl: s, type: 'service' })),
  ...eventPages.map(s => ({ rawUrl: s, type: 'event' })),
  ...sectorPages.map(s => ({ rawUrl: s, type: 'location' })),
  ...neighborhoodPages.map(s => ({ rawUrl: s, type: 'location' })),
  ...ilfovPages.map(s => ({ rawUrl: s, type: 'location' })),
  ...satellitePages.map(s => ({ rawUrl: s, type: 'satellite' }))
];

// Write inserts
sqlOut += `DO $$\nDECLARE\n    v_page_id UUID;\nBEGIN\n\n`;

for (const p of allPages) {
  const seo = generateSEO(p.rawUrl, p.type);
  const canonical = null;
  
  sqlOut += `    -- Page: ${seo.fullPath}\n`;
  sqlOut += `    INSERT INTO pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)\n`;
  sqlOut += `    VALUES ('${seo.slug}', '${seo.fullPath}', '${p.type}', '${seo.title.replace(/'/g, "''")}', '${seo.h1.replace(/'/g, "''")}', '${seo.meta_title.replace(/'/g, "''")}', '${seo.meta_description.replace(/'/g, "''")}', NULL, ${seo.priority}, 'draft', 'noindex', false)\n`;
  sqlOut += `    RETURNING id INTO v_page_id;\n\n`;

  const sections = getSectionsForType(p.type);
  sections.forEach((sec, idx) => {
    sqlOut += `    INSERT INTO page_sections (page_id, section_key, sort_order)\n`;
    sqlOut += `    VALUES (v_page_id, '${sec}', ${idx + 1});\n`;
  });
  sqlOut += `\n`;
}

sqlOut += `END $$;\n`;

fs.writeFileSync(path.join(__dirname, '../db/03_seed_pages.sql'), sqlOut);
console.log('Seed SQL generated successfully. Total pages:', allPages.length);
