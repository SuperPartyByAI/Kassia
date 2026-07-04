import { createClient } from '@supabase/supabase-js';
import fs from 'fs';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

(async () => {
  console.log('Fetching pages...');
  const { data: pages } = await supabase.from('kassia_pages').select('*');
  console.log('Fetching sections...');
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').neq('section_type', 'draft');

  const moneyPages = [
    '/animatori-petreceri-copii/',
    '/spectacol-magie-copii-bucuresti/',
    '/decoratiuni-baloane-bucuresti/',
    '/mascote-petreceri-copii-bucuresti/',
    '/pictura-pe-fata-copii-bucuresti/',
    '/masina-vata-de-zahar-popcorn/',
    '/contact/',
    '/',
    '/despre-noi/'
  ];

  let csvRows = [];
  csvRows.push(['URL', 'Cluster', 'Tip Pagina', 'Status SEO (Actual)', 'Sitemap', 'Nr Sectiuni', 'Nr Imagini', 'Status Propus', 'Scor Calitate', 'Motiv & Observatii', 'Ce Nu Atingem', 'Modificari Propuse']);

  for (const page of pages) {
    const pageSections = sections.filter(s => s.page_id === page.id);
    let imageCount = 0;
    let textLength = 0;
    
    pageSections.forEach(s => {
      if (s.content?.image_url) imageCount++;
      if (s.content?.cards) {
        s.content.cards.forEach(c => { if(c.image_url) imageCount++; });
      }
      if (s.content?.body) textLength += String(s.content.body).length;
    });

    let statusPropus = '';
    let motiv = '';
    let modificari = '';
    let ceNuAtingem = '';
    let scor = 5;

    const isMoney = moneyPages.includes(page.path);
    
    if (isMoney) {
      statusPropus = 'PASS_LOCKED';
      motiv = 'Pagina Money principala / de servicii.';
      ceNuAtingem = 'Nu modificam URL, H1, layout, preturi, E-E-A-T, sectiunile bune.';
      modificari = 'Doar adaugari punctuale (Additive-Only) daca este cerut.';
      scor = 9;
    } else if (page.seo_status === 'noindex') {
      if (pageSections.length > 3 && textLength > 1500) {
        statusPropus = 'FIX_TEMPLATE';
        motiv = 'Pagina pSEO cu baza decenta dar probabil text mecanic.';
        modificari = 'Rafinare H2/H3, adaugare specific local/tematic, linkuri interne.';
        scor = 6;
      } else {
        statusPropus = 'HEAVY_FIX';
        motiv = 'Pagina subtire (thin content) generata in batch.';
        modificari = 'Rescriere completa sectiuni, adaugare FAQ specific, imagini locale.';
        scor = 3;
      }
    } else {
      statusPropus = 'MERGE_REVIEW';
      motiv = 'Pagina indexabila dar nu e marcata explicit ca money page. Necesita verificare canibalizare.';
      scor = 7;
    }

    if (page.path === '/animatori-petreceri-copii/') {
       statusPropus = 'ADD_ONLY';
       scor = 9.5;
    }

    csvRows.push([
      page.path,
      page.cluster_type || 'necunoscut',
      page.page_type || 'generic',
      page.seo_status || 'index',
      page.seo_status === 'index' ? 'DA' : 'NU',
      pageSections.length.toString(),
      imageCount.toString(),
      statusPropus,
      scor.toString(),
      motiv,
      ceNuAtingem,
      modificari
    ]);
  }

  const csvContent = csvRows.map(e => e.map(f => '"' + String(f || '').replace(/"/g, '""') + '"').join(",")).join("\n");
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/audit_kassia_pages.csv', csvContent);
  console.log('CSV generated at /Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/audit_kassia_pages.csv');
})();
