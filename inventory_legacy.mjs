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
  'chiajna', 'rosu', 'dobroesti', 'ilfov'
];

const eventIntents = [
  'botez', 'mot', 'gradinita', 'scoala', 'serbare', 'corporate', 'nunta', 'restaurant', 
  'acasa', 'aer-liber', 'loc-de-joaca', 'evenimente'
];

const topics = [
  'fotbal', 'cavaleri', 'printese', 'supereroi', 'tematica', 'pictura', 'baloane', 'jocuri', 
  'activitati', 'magician', 'clovn', 'ursitoare', 'piniata', 'vloggeri', 'gaming'
];

async function run() {
  const { data: allPages } = await supabase.from('kassia_pages').select('id, path, h1, title, meta_description, status, index_status, include_in_sitemap').neq('status', 'draft');
  const { data: allSections } = await supabase.from('kassia_page_sections').select('page_id, content');
  const { data: allFaqs } = await supabase.from('kassia_faqs').select('page_id');
  const { data: allLinks } = await supabase.from('kassia_internal_links').select('source_page_id, target_page_id');

  let legacyPages = [];
  const goodPaths = [
      '/', '/animatori-petreceri-copii/', '/personaje-animatori-copii-bucuresti/',
      '/preturi-animatori-copii-bucuresti/', '/mascote-petreceri-copii-bucuresti/',
      '/animatori-petreceri-copii-sector-1/', '/animatori-petreceri-copii-sector-2/',
      '/animatori-petreceri-copii-sector-3/', '/animatori-petreceri-copii-sector-4/',
      '/animatori-petreceri-copii-sector-5/', '/animatori-petreceri-copii-sector-6/'
  ];

  for (const p of allPages) {
    let isLegacy = false;
    if (p.h1 && p.h1.toLowerCase().includes('animatori petreceri copii') && p.path !== '/animatori-petreceri-copii/') isLegacy = true;
    if (p.meta_description && p.meta_description.toLowerCase().includes('cauți animatori pentru petreceri copii în')) isLegacy = true;
    if (p.path.includes('/blog/')) isLegacy = true;
    if (p.path.includes('/animatori-evenimente-')) isLegacy = true;
    if (p.path.includes('/animatori-copii-regie')) isLegacy = true;
    
    if (isLegacy && !goodPaths.includes(p.path)) {
        // Gather extra data
        const bodySections = allSections.filter(s => s.page_id === p.id && s.content && s.content.body);
        let bodyText = bodySections.map(s => s.content.body.replace(/<[^>]+>/g, '')).join(' ');
        let first300 = bodyText.substring(0, 300).trim();
        let faqCount = allFaqs.filter(f => f.page_id === p.id).length;
        let incomingLinks = allLinks.filter(l => l.target_page_id === p.id).length;
        let outgoingLinks = allLinks.filter(l => l.source_page_id === p.id).length;
        let faqSchema = faqCount > 0 ? 'YES' : 'NO';

        let bucket = 'F. UNKNOWN';
        let pathLower = p.path.toLowerCase();
        
        if (pathLower.includes('/blog/')) {
            bucket = 'E. BLOG LEGACY';
        } else if (neighborhoods.some(n => pathLower.includes(n))) {
            bucket = 'B. LOCAL AREA CANDIDATE';
        } else if (eventIntents.some(e => pathLower.includes(e)) || pathLower.match(/-\\d+-ani/)) {
            bucket = 'C. EVENT INTENT CANDIDATE';
        } else if (topics.some(t => pathLower.includes(t))) {
            bucket = 'D. TOPIC / ACTIVITY CANDIDATE';
        } else {
            bucket = 'A. EXACT DUPLICATE / TOXIC GENERIC';
        }

        let isMechanicalH1 = (p.h1 && p.h1.startsWith('Animatori Petreceri Copii'));
        let isMechanicalMeta = (p.meta_description && p.meta_description.startsWith('Cauți animatori pentru petreceri copii în'));
        let riskScore = 0;
        if (p.index_status === 'index') riskScore += 1;
        if (p.include_in_sitemap) riskScore += 1;
        if (isMechanicalH1) riskScore += 1;
        if (isMechanicalMeta) riskScore += 1;
        if (incomingLinks === 0) riskScore += 1;
        let hasRiskyWords = ['pachet', 'perfect', 'garantat', 'premium', 'excelent'].some(w => bodyText.toLowerCase().includes(w));
        if (hasRiskyWords) riskScore += 1;

        legacyPages.push({
            ...p,
            bucket,
            first300,
            faqCount,
            faqSchema,
            incomingLinks,
            outgoingLinks,
            isMechanicalH1,
            isMechanicalMeta,
            hasRiskyWords,
            riskScore
        });
    }
  }

  // Sort by riskScore descending
  legacyPages.sort((a, b) => b.riskScore - a.riskScore);

  const top20 = legacyPages.slice(0, 20);

  let summary = {
    total: legacyPages.length,
    inSitemap: legacyPages.filter(p => p.include_in_sitemap).length,
    indexFollow: legacyPages.filter(p => p.index_status === 'index').length,
    orphan: legacyPages.filter(p => p.incomingLinks === 0).length,
    mechanicalH1: legacyPages.filter(p => p.isMechanicalH1).length,
    mechanicalMeta: legacyPages.filter(p => p.isMechanicalMeta).length,
    buckets: {
      A: legacyPages.filter(p => p.bucket.startsWith('A.')).length,
      B: legacyPages.filter(p => p.bucket.startsWith('B.')).length,
      C: legacyPages.filter(p => p.bucket.startsWith('C.')).length,
      D: legacyPages.filter(p => p.bucket.startsWith('D.')).length,
      E: legacyPages.filter(p => p.bucket.startsWith('E.')).length,
      F: legacyPages.filter(p => p.bucket.startsWith('F.')).length
    }
  };

  fs.writeFileSync('legacy_inventory_results.json', JSON.stringify({summary, top20}, null, 2));

  // Build the markdown table for artifact
  let md = '# Kassia Programmatic Legacy Inventory\\n\\n';
  md += '## Summary\\n';
  md += `- Total Legacy Pages: ${summary.total}\n`;
  md += `- In Sitemap: ${summary.inSitemap}\n`;
  md += `- Index/Follow: ${summary.indexFollow}\n`;
  md += `- Orphan (0 backlinks): ${summary.orphan}\n`;
  md += `- Mechanical H1: ${summary.mechanicalH1}\n`;
  md += `- Mechanical Meta: ${summary.mechanicalMeta}\n\n`;
  
  md += '### Buckets Breakdown\n';
  md += `- A. EXACT DUPLICATE / TOXIC GENERIC: ${summary.buckets.A}\n`;
  md += `- B. LOCAL AREA CANDIDATE: ${summary.buckets.B}\n`;
  md += `- C. EVENT INTENT CANDIDATE: ${summary.buckets.C}\n`;
  md += `- D. TOPIC / ACTIVITY CANDIDATE: ${summary.buckets.D}\n`;
  md += `- E. BLOG LEGACY: ${summary.buckets.E}\n`;
  md += `- F. UNKNOWN: ${summary.buckets.F}\n\n`;

  md += '## Top 20 Urgent Cleanup Candidates\n';
  md += '| Path | Bucket | Sitemap | Robots | Backlinks | Risk Score | Recomandare |\n';
  md += '|---|---|---|---|---|---|---|\n';
  top20.forEach(p => {
    let rec = p.bucket.startsWith('A') ? 'MASS DRAFT/NOINDEX CANDIDATE' : 'AUDIT/301';
    md += `| ${p.path} | ${p.bucket.split('.')[0]} | ${p.include_in_sitemap} | ${p.index_status} | ${p.incomingLinks} | ${p.riskScore}/6 | ${rec} |\n`;
  });

  md += '\n## Full Table (All Pages)\n';
  md += '| Path | Bucket | Sitemap | Robots | Backlinks | GSC Data | Risc | Recomandare |\n';
  md += '|---|---|---|---|---|---|---|---|\n';
  legacyPages.forEach(p => {
    let rec = p.bucket.startsWith('A') ? 'NOINDEX / 301' : (p.bucket.startsWith('E') ? '301 / REWRITE' : 'KEEP / REBUILD');
    let risc = p.riskScore >= 4 ? 'HIGH' : (p.riskScore >= 2 ? 'MED' : 'LOW');
    md += `| ${p.path} | ${p.bucket.split('.')[0]} | ${p.include_in_sitemap ? 'DA' : 'NU'} | ${p.index_status} | ${p.incomingLinks} | N/A | ${risc} (${p.riskScore}) | ${rec} |\n`;
  });

  fs.writeFileSync('kassia_legacy_inventory.md', md);
  console.log('Inventory generated successfully. Summary:');
  console.log(summary);
}

run();
