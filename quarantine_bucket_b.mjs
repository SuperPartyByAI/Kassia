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
            bucketB.push(p);
        }
    }
  }

  console.log(`Found ${bucketB.length} pages in Bucket B.`);
  
  // 1. BACKUP ALL BUCKET B
  const ts = new Date().toISOString().replace(/[:.]/g, '-');
  const backupFilename = `backup_bucket_b_${ts}.json`;
  fs.writeFileSync(backupFilename, JSON.stringify(bucketB, null, 2));
  console.log(`Backup saved to ${backupFilename}`);

  // 2. IDENTIFY PAGES TO UPDATE
  let toUpdate = [];
  let alreadyNoindex = [];

  bucketB.forEach(p => {
    if (p.index_status === 'index' || p.include_in_sitemap === true) {
      toUpdate.push(p);
    } else {
      alreadyNoindex.push(p);
    }
  });

  console.log(`\nPages already noindex/out of sitemap: ${alreadyNoindex.length}`);
  console.log(`Pages needing update: ${toUpdate.length}`);

  // Print paths to be updated
  console.log('\n--- Paths to be quarantined ---');
  toUpdate.forEach(p => console.log(p.path));

  // 3. UPDATE DB
  let updatedCount = 0;
  for (const p of toUpdate) {
    const { error } = await supabase
        .from('kassia_pages')
        .update({ index_status: 'noindex', include_in_sitemap: false })
        .eq('id', p.id);
        
    if (!error) updatedCount++;
  }
  
  console.log(`\nSuccessfully updated ${updatedCount} out of ${toUpdate.length} pages to noindex / not in sitemap.`);
}

run();
