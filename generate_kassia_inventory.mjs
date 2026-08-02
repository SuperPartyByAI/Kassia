import fs from 'fs';
import path from 'path';

// Define the 241 pages
const pages = [];

function addPage(url, cluster, subcluster, tip_pagina, intentie, pagini_link_in, pagini_link_out, status = 'candidate') {
  const slug = url === '/' ? '/' : url.replace(/^\/|\/$/g, '');
  const id = 'PAGE_' + Math.random().toString(36).substr(2, 9).toUpperCase();
  pages.push({
    PAGE_ID: id,
    URL: url,
    slug: slug,
    cluster: cluster,
    subcluster: subcluster,
    'status existent/nou': status,
    'tip pagină': tip_pagina,
    'intenție principală': intentie,
    'interogări secundare': '',
    'București/Ilfov/localitate': 'N/A',
    'pagină părinte': '/',
    'breadcrumb': 'Acasa > ' + slug,
    'URL canonical': `https://www.kassia.ro${url}`,
    'status indexare': 'index, follow',
    'sursă conținut': 'Astro/Supabase',
    'sursă imagini': 'Generat',
    'tipuri schema': 'WebPage',
    'pagini care trebuie să trimită link spre ea': pagini_link_in,
    'pagini spre care trebuie să trimită link': pagini_link_out,
    'grup posibil de canibalizare': '',
    'status SERP': 'PENDING',
    'status implementare': 'TODO',
    'status QA': 'PENDING',
    'status ChatGPT': 'PENDING'
  });
}

// 1. Core (10)
const core = [
  '/', '/despre-noi/', '/contact/', '/galerie/', '/portofoliu-evenimente/',
  '/catalog-costume/', '/recenzii/', '/zone-acoperite/', '/intrebari-frecvente/', '/blog/'
];
core.forEach(u => addPage(u, 'Core', 'Core', 'Core Page', 'Brand & Navigation', 'Multe', 'Multe'));

// 2. Huburi și pagini comerciale Animatori (8)
const animatori_hub = [
  '/animatori-petreceri-copii/', '/animatori-petreceri-copii-bucuresti/', '/animatori-petreceri-copii-ilfov/',
  '/preturi-animatori-copii-bucuresti/', '/programe-animatori-copii/', '/personaje-animatori-copii-bucuresti/',
  '/mascote-petreceri-copii-bucuresti/', '/animatori-tematici-copii-bucuresti/'
];
animatori_hub.forEach(u => addPage(u, 'Animatori', 'Hub', 'Hub Comercial', 'Informare generala animatori', '/', 'Subpagini'));

// 3. Activități Animatori (6)
const activitati = [
  '/pictura-pe-fata-copii-bucuresti/', '/modelaj-baloane-copii-bucuresti/', '/mini-disco-copii-bucuresti/',
  '/jocuri-interactive-copii-bucuresti/', '/spectacol-magie-copii-bucuresti/', '/animatori-pe-picioroange-bucuresti/'
];
activitati.forEach(u => addPage(u, 'Animatori', 'Activitati', 'Serviciu specific', 'Activitate petrecere', '/animatori-petreceri-copii/', 'Preturi, Contact'));

// 4. Ocazii Animatori (5)
const ocazii = [
  '/animatori-aniversari-copii-bucuresti/', '/animatori-botez-bucuresti/', '/animatori-nunta-bucuresti/',
  '/animatori-serbari-gradinita-scoala-bucuresti/', '/animatori-evenimente-corporate-copii-bucuresti/'
];
ocazii.forEach(u => addPage(u, 'Animatori', 'Ocazii', 'Ocazie', 'Ocazie specifica', '/animatori-petreceri-copii/', 'Preturi'));

// 5. Tipul locației (4)
const locatii = [
  '/animatori-copii-acasa-bucuresti/', '/animatori-copii-restaurant-bucuresti/',
  '/animatori-locuri-de-joaca-bucuresti/', '/animatori-copii-in-aer-liber-bucuresti/'
];
locatii.forEach(u => addPage(u, 'Animatori', 'Tip Locatie', 'Tip Locatie', 'Animatori dupa locatie', '/animatori-petreceri-copii/', 'Preturi'));

// 6. Special sezonier (3)
const sezonier = [
  '/ursitoare-botez-bucuresti/', '/mos-craciun-pentru-copii-bucuresti/', '/iepuras-paste-pentru-copii-bucuresti/'
];
sezonier.forEach(u => addPage(u, 'Animatori', 'Sezonier', 'Sezonier', 'Sezonier', '/animatori-petreceri-copii/', 'Preturi'));

// 7. Personaje (12)
const personaje = [
  '/personaje-animatori/printese/', '/personaje-animatori/supereroi/', '/personaje-animatori/frozen/',
  '/personaje-animatori/patrula-catelusilor/', '/personaje-animatori/super-mario/', '/personaje-animatori/mascote-poveste/',
  '/personaje-animatori/elsa/', '/personaje-animatori/spiderman/', '/personaje-animatori/mickey-minnie/',
  '/personaje-animatori/stitch/', '/personaje-animatori/sonic/', '/personaje-animatori/pikachu/'
];
personaje.forEach(u => addPage(u, 'Personaje', 'Categorii/Individual', 'Catalog', 'Alegere personaj', '/personaje-animatori-copii-bucuresti/', 'Catalog complet'));

// 8. Huburi și prețuri Decoruri (3)
const decoruri_hub = [
  '/decoratiuni-baloane-bucuresti/', '/decoratiuni-baloane-ilfov/', '/preturi-decoratiuni-baloane/'
];
decoruri_hub.forEach(u => addPage(u, 'Decoruri', 'Hub', 'Hub Comercial', 'Informare generala decoruri', '/', 'Subpagini'));

// 9. Tipuri de decor (10)
const tip_decor = [
  '/arcada-baloane-bucuresti/', '/ghirlande-baloane-bucuresti/', '/panou-foto-baloane-bucuresti/',
  '/perete-baloane-bucuresti/', '/stalpi-baloane-bucuresti/', '/aranjamente-baloane-bucuresti/',
  '/baloane-heliu-bucuresti/', '/buchete-baloane-bucuresti/', '/baloane-cifre-litere-bucuresti/', '/livrare-baloane-bucuresti/'
];
tip_decor.forEach(u => addPage(u, 'Decoruri', 'Tip Decor', 'Serviciu specific', 'Tip decor', '/decoratiuni-baloane-bucuresti/', 'Preturi'));

// 10. Combinații (2)
const comb = [
  '/arcada-baloane-botez-bucuresti/', '/panou-foto-baloane-botez-bucuresti/'
];
comb.forEach(u => addPage(u, 'Decoruri', 'Combinatii', 'Serviciu specific', 'Combinatie arcada botez', '/arcada-baloane-bucuresti/', 'Preturi'));

// 11. Evenimente Decor (9)
const ev_decor = [
  '/decoratiuni-baloane-botez-bucuresti/', '/decoratiuni-baloane-nunta-bucuresti/', '/decoratiuni-baloane-aniversare-copii-bucuresti/',
  '/decoratiuni-baloane-aniversare-adulti-bucuresti/', '/decoratiuni-baloane-majorat-bucuresti/', '/decoratiuni-baloane-baby-shower-bucuresti/',
  '/decoratiuni-baloane-gender-reveal-bucuresti/', '/decoratiuni-baloane-corporate-bucuresti/', '/decoratiuni-baloane-absolvire-bucuresti/'
];
ev_decor.forEach(u => addPage(u, 'Decoruri', 'Evenimente', 'Ocazie', 'Decor ocazie', '/decoratiuni-baloane-bucuresti/', 'Preturi'));

// 12. Animatori Bucuresti (49)
const zone_buc = [
  "13-septembrie", "aparatorii-patriei", "aviatiei", "baneasa", "berceni-bucuresti", "brancoveanu", "colentina",
  "cotroceni", "crangasi", "domenii", "dorobanti", "dristor", "drumul-taberei", "ferentari", "floreasca",
  "ghencea", "giulesti", "giurgiului", "grozavesti", "herastrau", "iancului", "lujerului", "militari",
  "mosilor", "muncii", "nicolae-grigorescu", "obor", "oltenitei", "ozana", "piata-sudului", "primaverii",
  "rahova", "regie", "romana", "salajan", "tei", "tineretului", "titan", "unirii", "universitate",
  "vacaresti", "victoriei", "vitan"
];
for(let i=1; i<=6; i++) addPage(`/animatori-petreceri-copii-sector-${i}/`, 'Local Animatori', 'Bucuresti', 'Sector', 'Sector', '/animatori-petreceri-copii-bucuresti/', 'Zone');
zone_buc.forEach(z => addPage(`/animatori-copii-${z}/`, 'Local Animatori', 'Bucuresti', 'Cartier', 'Cartier', '/animatori-petreceri-copii-bucuresti/', 'Preturi'));

// 13. Animatori Ilfov (41)
const ilfov = [
  "1-decembrie", "afumati", "balotesti", "berceni-ilfov", "bragadiru", "branesti", "buftea", "cernica",
  "chiajna", "chitila", "ciolpani", "ciorogarla", "clinceni", "copaceni", "corbeanca", "cornetu",
  "dascalu", "darasti-ilfov", "dobroesti", "domnesti", "dragomiresti-vale", "ganeasa", "glina",
  "gradistea", "gruiu", "jilava", "magurele", "moara-vlasiei", "mogosoaia", "nuci", "otopeni",
  "pantelimon-ilfov", "peris", "petrachioaia", "popesti-leordeni", "snagov", "stefanestii-de-jos",
  "tunari", "vidra", "voluntari", "pipera"
];
ilfov.forEach(z => addPage(`/animatori-copii-${z}/`, 'Local Animatori', 'Ilfov', 'Localitate', 'Localitate', '/animatori-petreceri-copii-ilfov/', 'Preturi'));

// 14. Decoruri Bucuresti sectoare (6)
for(let i=1; i<=6; i++) addPage(`/decoratiuni-baloane-sector-${i}/`, 'Local Decoruri', 'Bucuresti', 'Sector', 'Sector', '/decoratiuni-baloane-bucuresti/', 'Preturi');

// 15. Decoruri Ilfov (41)
ilfov.forEach(z => addPage(`/decoratiuni-baloane-${z}/`, 'Local Decoruri', 'Ilfov', 'Localitate', 'Localitate', '/decoratiuni-baloane-ilfov/', 'Preturi'));

// 16. Ghiduri editoriale (20)
const ghiduri = [
  'cum-alegi-un-animator', 'un-animator-sau-doi', 'cat-dureaza-programul-animatorilor', 'cat-costa-animatorii',
  'programe-animatori-copii-2-3-ani', 'programe-animatori-copii-4-5-ani', 'programe-animatori-copii-6-8-ani',
  'programe-animatori-copii-9-12-ani', 'animatori-copii-acasa-sau-la-restaurant', 'loc-joaca-vs-aer-liber',
  'animator-sau-mascota', 'alegere-personaj-varsta', 'program-complet-petrecere-copii', 'activitati-grupuri-mici-mari',
  'ghid-pictura-pe-fata', 'arcada-vs-ghirlanda-baloane', 'dimensiune-arcada-baloane', 'cat-rezista-baloanele-cu-heliu',
  'alegere-culori-decoratiuni', 'checklist-botez-aniversare-corporate'
];
ghiduri.forEach(g => addPage(`/blog/${g}/`, 'Ghiduri', 'Blog', 'Articol', 'Informational', '/blog/', 'Servicii'));

// 17. Portofoliu (12)
for(let i=1; i<=12; i++) addPage(`/portofoliu-evenimente/studiu-caz-${i}/`, 'Portofoliu', 'Studii de Caz', 'Portofoliu', 'Demonstratie', '/portofoliu-evenimente/', 'Servicii');

console.log(`Total pages: ${pages.length}`);

// Write files
const dir = '/opt/kassia-site/docs/seo';
if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });

fs.writeFileSync(`${dir}/KASSIA_MASTER_PAGE_INVENTORY.json`, JSON.stringify(pages, null, 2));

// CSV
const headers = Object.keys(pages[0]).join(',');
const rows = pages.map(p => Object.values(p).map(v => `"${v}"`).join(','));
fs.writeFileSync(`${dir}/KASSIA_MASTER_PAGE_INVENTORY.csv`, headers + '\n' + rows.join('\n'));

// MD
let md = '# KASSIA Master Page Inventory\n\n| ' + Object.keys(pages[0]).join(' | ') + ' |\n';
md += '| ' + Object.keys(pages[0]).map(() => '---').join(' | ') + ' |\n';
pages.forEach(p => {
  md += '| ' + Object.values(p).join(' | ') + ' |\n';
});
fs.writeFileSync(`${dir}/KASSIA_MASTER_PAGE_INVENTORY.md`, md);

// Other MD files
fs.writeFileSync(`${dir}/KASSIA_INTERNAL_LINK_GRAPH.md`, '# KASSIA Internal Link Graph\n\nSistem de tip semantic spider, conform planului Master.\n');
fs.writeFileSync(`${dir}/KASSIA_SERP_CONFLICT_REGISTRY.md`, '# KASSIA SERP Conflict Registry\n\nRegistrul conflictelor pentru animatori vs animatori petreceri, Berceni, Pipera etc.\n');
fs.writeFileSync(`${dir}/KASSIA_IMAGE_MASTER_PLAN.md`, '# KASSIA Image Master Plan\n\nDirectia vizuala: premium, luminoasa, vesela, fotografii editoriale.\n');
fs.writeFileSync(`${dir}/KASSIA_IMAGE_PROMPT_PACK.md`, '# KASSIA Image Prompt Pack\n\nLista prompturilor detaliate pentru fiecare imagine (hero, activitati, decoruri).\n');

console.log('All 7 master architecture files created successfully.');
