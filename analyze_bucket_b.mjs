import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const neighborhoods = [
  'crangasi', 'drumul-taberei', 'pantelimon', 'regie', 'militari', 'rahova', 'berceni', 'titan', 
  'colentina', 'teilor', 'dristor', 'vitan', 'floreasca', 'dorobanti', 'pipera', 'voluntari', 
  'bragadiru', 'popesti', 'chitila', 'buftea', 'baneasa', 'aviatorilor', 'aviatiei', 'obor', 
  'iancului', 'muncii', 'unirii', 'universitate', 'romana', 'victoriei', 'grozavesti', 'cotroceni', 
  '13-septembrie', 'salajan', 'ozana', 'ferentari', 'giulesti', 'ghencea', 'bucurestii-noi', 
  'damaroaia', 'straulesti', 'otopeni', 'tunari', 'corbeanca', 'snagov', 'balotesti', 'magurele', 
  'chiajna', 'rosu', 'dobroesti', 'ilfov', 'branesti', 'dascalu', 'gradistea', 'nuci', 'petrachioaia', 
  'stefanestii-de-jos', 'afumati', 'copaceni', 'ganeasa', 'moara-vlasiei', 'peris', 'cernica', 
  'ciorogarla', 'gruiu', 'mogosoaia', 'vidra', '1-decembrie', 'ciolpani', 'clinceni', 'cornetu', 
  'domnesti', 'dragomiresti-vale', 'glina', 'jilava', 'tei', 'tineretului', 'brancoveanu', 
  'oltenitei', 'piata-sudului', 'aparatorii-patriei', 'giurgiului', 'vacaresti', 'mosilor', 
  'nicolae-grigorescu', 'lujerului', 'domenii', 'primaverii'
];

const highPriorityZones = [
  'drumul-taberei', 'militari', 'berceni', 'titan', 'pantelimon', 'crangasi', 
  'pipera', 'voluntari', 'popesti', 'bragadiru', 'otopeni', 'corbeanca', 
  'chiajna', 'rosu', 'baneasa', 'aviatiei', 'colentina', 'rahova', 'dristor', 
  'vitan', 'bucurestii-noi', 'ilfov' // Added ilfov as high priority hub
];

const eventIntents = [
  'botez', 'mot', 'gradinita', 'scoala', 'serbare', 'corporate', 'nunta', 'restaurant', 
  'acasa', 'aer-liber', 'loc-de-joaca', 'evenimente'
];

const topics = [
  'fotbal', 'cavaleri', 'printese', 'supereroi', 'tematica', 'pictura', 'baloane', 'jocuri', 
  'activitati', 'magician', 'clovn', 'ursitoare', 'piniata', 'vloggeri', 'gaming'
];

const goodPaths = [
  '/', '/animatori-petreceri-copii/', '/personaje-animatori-copii-bucuresti/',
  '/preturi-animatori-copii-bucuresti/', '/mascote-petreceri-copii-bucuresti/',
  '/animatori-petreceri-copii-sector-1/', '/animatori-petreceri-copii-sector-2/',
  '/animatori-petreceri-copii-sector-3/', '/animatori-petreceri-copii-sector-4/',
  '/animatori-petreceri-copii-sector-5/', '/animatori-petreceri-copii-sector-6/'
];

async function run() {
  const { data: allPages } = await supabase.from('kassia_pages').select('id, path, h1, title, meta_description, status, index_status, include_in_sitemap').neq('status', 'draft');
  const { data: allLinks } = await supabase.from('kassia_internal_links').select('source_page_id, target_page_id');

  let bucketB = [];

  for (const p of allPages) {
    let isLegacy = false;
    if (p.h1 && p.h1.toLowerCase().includes('animatori petreceri copii') && p.path !== '/animatori-petreceri-copii/') isLegacy = true;
    if (p.meta_description && p.meta_description.toLowerCase().includes('cauți animatori pentru petreceri copii în')) isLegacy = true;
    if (p.path.includes('/blog/')) isLegacy = true;
    if (p.path.includes('/animatori-evenimente-')) isLegacy = true;
    if (p.path.includes('/animatori-copii-regie')) isLegacy = true;
    
    if (isLegacy && !goodPaths.includes(p.path)) {
        let bucket = 'F. UNKNOWN';
        let pathLower = p.path.toLowerCase();
        
        let foundZone = neighborhoods.find(n => pathLower.includes(n));

        if (pathLower.includes('/blog/')) {
            bucket = 'E. BLOG LEGACY';
        } else if (foundZone) {
            bucket = 'B. LOCAL AREA CANDIDATE';
        } else if (eventIntents.some(e => pathLower.includes(e)) || pathLower.match(/-\\d+-ani/)) {
            bucket = 'C. EVENT INTENT CANDIDATE';
        } else if (topics.some(t => pathLower.includes(t))) {
            bucket = 'D. TOPIC / ACTIVITY CANDIDATE';
        } else {
            bucket = 'A. EXACT DUPLICATE / TOXIC GENERIC';
        }

        if (bucket === 'B. LOCAL AREA CANDIDATE') {
            let incomingLinks = allLinks.filter(l => l.target_page_id === p.id).length;
            
            // Score calculation
            let score = 3; // base score
            if (highPriorityZones.includes(foundZone)) score += 5; // strong demand
            
            let risc = 'LOW';
            let target = 'N/A';
            let action = 'KEEP NOINDEX';
            let motiv = 'Zona secundara';

            if (highPriorityZones.includes(foundZone)) {
                action = 'REBUILD';
                motiv = 'Cerere mare, cartier rezidential major';
                risc = 'LOW (Intent specific)';
                score += 1; // max 9
            } else if (['regie', 'grozavesti', 'unirii', 'universitate', 'romana', 'victoriei', 'floreasca', 'dorobanti'].includes(foundZone)) {
                action = 'KEEP NOINDEX';
                motiv = 'Zona centrala/studenti, cerere moderata pt petreceri copii';
                risc = 'MED (Cannibalize Sector 1/3)';
            } else {
                // Ilfov small villages
                action = '301 / MERGE';
                target = '/animatori-petreceri-copii-ilfov/';
                motiv = 'Localitate mica, volume reduse, mai bine consolidam in Ilfov hub';
                risc = 'HIGH (Thin content)';
                score -= 1;
            }

            bucketB.push({
                ...p,
                zone: foundZone,
                incomingLinks,
                score,
                risc,
                target,
                action,
                motiv
            });
        }
    }
  }

  // Sort by score desc
  bucketB.sort((a, b) => b.score - a.score);

  let inSitemap = bucketB.filter(p => p.include_in_sitemap).length;
  let indexFollow = bucketB.filter(p => p.index_status === 'index').length;
  let orphan = bucketB.filter(p => p.incomingLinks === 0).length;

  let md = '# Bucket B - Local Area Candidates\n\n';
  md += '## Summary Bucket B\n';
  md += `- Total Pagini: ${bucketB.length}\n`;
  md += `- In Sitemap: ${inSitemap}\n`;
  md += `- Index/Follow: ${indexFollow}\n`;
  md += `- Orfane: ${orphan}\n`;
  md += `- GSC Semnale: (Presupuse pe cele indexabile/sitemap, GSC API indisponibil direct)\n\n`;

  let top10Rebuild = bucketB.filter(p => p.action === 'REBUILD').slice(0, 10);
  md += '## Top 10 Recomandate pentru Rebuild\n';
  md += '| Path | Zona | Motiv | Risc | Next Action |\n|---|---|---|---|---|\n';
  top10Rebuild.forEach(p => md += `| ${p.path} | ${p.zone} | ${p.motiv} | ${p.risc} | REBUILD |\n`);

  let top10Noindex = bucketB.filter(p => p.action === 'KEEP NOINDEX').slice(0, 10);
  md += '\n## Top 10 de păstrat NOINDEX (temporar)\n';
  md += '| Path | Motiv |\n|---|---|\n';
  top10Noindex.forEach(p => md += `| ${p.path} | ${p.motiv} |\n`);

  let top10Redirect = bucketB.filter(p => p.action === '301 / MERGE').slice(0, 10);
  md += '\n## Top 10 pentru 301 / Merge\n';
  md += '| Path | Target Recomandat | Motiv |\n|---|---|---|\n';
  top10Redirect.forEach(p => md += `| ${p.path} | ${p.target} | ${p.motiv} |\n`);

  md += '\n## Tabel Complet Bucket B\n';
  md += '| Path | Zona | Sitemap | Robots | Backlinks | GSC | Canibalizare | Scor | Recomandare |\n|---|---|---|---|---|---|---|---|---|\n';
  bucketB.forEach(p => {
    md += `| ${p.path} | ${p.zone} | ${p.include_in_sitemap} | ${p.index_status} | ${p.incomingLinks} | N/A | ${p.risc} | ${p.score}/10 | ${p.action} |\n`;
  });

  fs.writeFileSync('kassia_bucket_b_analysis.md', md);
  
  console.log(`Processed ${bucketB.length} pages.`);
  console.log(JSON.stringify({
    total: bucketB.length,
    inSitemap,
    indexFollow,
    orphan
  }));
}

run();
