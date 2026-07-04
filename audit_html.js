import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fs from 'fs';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const delay = (ms) => new Promise(resolve => setTimeout(resolve, ms));

async function fetchSitemap() {
  try {
    const res = await fetch('https://www.kassia.ro/sitemap.xml');
    if (!res.ok) return [];
    const text = await res.text();
    const urls = [];
    const regex = /<loc>(.*?)<\/loc>/g;
    let match;
    while ((match = regex.exec(text)) !== null) {
      urls.push(match[1]);
    }
    return urls;
  } catch (e) {
    return [];
  }
}

const moneyPages = [
  '/animatori-petreceri-copii/',
  '/spectacol-magie-copii-bucuresti/',
  '/decoratiuni-baloane-bucuresti/',
  '/mascote-petreceri-copii-bucuresti/',
  '/pictura-pe-fata-copii-bucuresti/',
  '/masina-vata-de-zahar-popcorn/',
  '/contact/',
  '/',
  '/despre-noi/',
  '/ursitoare-botez-bucuresti/'
];

function determineCluster(path) {
  if (path === '/') return 'homepage';
  if (path === '/contact/' || path === '/despre-noi/') return 'support';
  if (path === '/animatori-petreceri-copii/') return 'service_pillar';
  if (path.includes('-sector-') || path.includes('animatori-copii-berceni') || path.includes('animatori-petreceri-copii-voluntari') || path.includes('animatori-petreceri-copii-corbeanca')) return 'local_animatori';
  if (path.includes('decoratiuni-baloane') && path.includes('-sector-')) return 'local_baloane';
  if (path.includes('ani-bucuresti') || path.includes('petrecere-1-an') || path.includes('petrecere-adolescenti')) return 'age';
  if (path.includes('animator-') || path.includes('mascota-') || path.includes('ursitoare-')) return 'character';
  if (path.includes('petrecere-tematica') || path.includes('petrecere-baieti') || path.includes('petrecere-fete')) return 'theme';
  if (path.includes('petreceri-copii-acasa') || path.includes('petreceri-copii-restaurant')) return 'context';
  if (moneyPages.includes(path) && path !== '/' && path !== '/animatori-petreceri-copii/') return 'service_pillar';
  return 'service_secondary';
}

(async () => {
  console.log('Fetching list of pages from DB...');
  const { data: pages } = await supabase.from('kassia_pages').select('*');
  
  console.log('Fetching live sitemap...');
  const sitemapUrls = await fetchSitemap();

  let results = [];
  let internalLinkAudit = [];
  
  let totalProcessed = 0;

  for (let i = 0; i < pages.length; i += 10) {
    const chunk = pages.slice(i, i + 10);
    const promises = chunk.map(async (page) => {
      const url = `https://www.kassia.ro${page.path}`;
      let httpStatus = 0;
      let finalUrl = url;
      let html = '';
      let xRobotsTag = '';

      try {
        const res = await fetch(url, { redirect: 'follow' });
        httpStatus = res.status;
        finalUrl = res.url;
        xRobotsTag = res.headers.get('x-robots-tag') || '';
        html = await res.text();
      } catch (e) {
        httpStatus = 500;
      }

      if (httpStatus !== 200) {
        return {
          url: page.path,
          httpStatus,
          finalUrl,
          canonical: '',
          metaRobots: '',
          xRobotsTag,
          isIndex: false,
          inSitemap: false,
          cluster: determineCluster(page.path),
          title: '',
          metaDesc: '',
          h1: '',
          h2Count: 0,
          sectionCount: 0,
          imageCount: 0,
          imagesWithoutAlt: 0,
          faqCount: 0,
          hasClonedReviews: false,
          hasMechanicalHeadings: false,
          keywordStuffing: false,
          hasFallbackText: true,
          hasLocalContent: false,
          internalLinksCount: 0,
          linksToHub: 0,
          score: 0,
          statusPropus: 'QA_BLOCKED',
          motiv: `HTTP Status ${httpStatus}`,
          ceNuAtingem: '',
          modificari: 'Verificare server / redirect'
        };
      }

      const $ = cheerio.load(html);
      
      const canonical = $('link[rel="canonical"]').attr('href') || '';
      const metaRobots = $('meta[name="robots"]').attr('content') || '';
      const title = $('title').text().trim();
      const metaDesc = $('meta[name="description"]').attr('content') || '';
      const h1 = $('h1').first().text().trim();
      const h2Count = $('h2').length;
      
      const sectionCount = $('section').length;
      const imageCount = $('img').length;
      const imagesWithoutAlt = $('img:not([alt])').length;
      
      const faqCount = $('.faq-item, [itemscope][itemtype*="Question"]').length;
      
      const bodyText = $('body').text();
      
      const clonedNames = ["Andreea M.", "Mihai C.", "Elena R.", "Raluca I.", "Alexandru V.", "Ioana S."];
      const hasClonedReviews = clonedNames.some(name => bodyText.includes(name));
      
      const mechanicalHeadings = ["Alege personajul preferat pentru", "De ce să ne alegi pentru"];
      const hasMechanicalHeadings = mechanicalHeadings.some(mh => html.includes(mh));
      
      const keywordStuffing = (bodyText.match(/animatori petreceri copii/gi) || []).length > 15;
      const hasFallbackText = bodyText.includes('undefined') || bodyText.includes('null');
      
      const isLocal = page.path.includes('-sector-') || page.path.includes('voluntari') || page.path.includes('corbeanca');
      let hasLocalContent = false;
      if (isLocal) {
        const sectorMatch = page.path.match(/sector-([1-6])/);
        if (sectorMatch) {
           hasLocalContent = bodyText.includes(`Sector ${sectorMatch[1]}`) || bodyText.includes(`Sectorul ${sectorMatch[1]}`);
        } else {
           hasLocalContent = bodyText.includes('Voluntari') || bodyText.includes('Ilfov');
        }
      }

      let internalLinks = [];
      $('a').each((_, el) => {
        let href = $(el).attr('href');
        if (href && (href.startsWith('/') || href.startsWith('https://www.kassia.ro'))) {
           let cleanHref = href.replace('https://www.kassia.ro', '');
           if (cleanHref) internalLinks.push(cleanHref);
        }
      });
      const internalLinksCount = internalLinks.length;
      const linksToHub = internalLinks.filter(l => l === '/animatori-petreceri-copii/').length;
      
      const inSitemap = sitemapUrls.includes(`https://www.kassia.ro${page.path}`) || sitemapUrls.includes(`https://www.kassia.ro${page.path.replace(/\/$/, '')}`);
      
      const isIndex = (metaRobots === '' || metaRobots.includes('index')) && !metaRobots.includes('noindex') && (xRobotsTag === '' || !xRobotsTag.includes('noindex'));

      let score = 8;
      let statusPropus = '';
      let motiv = '';

      if (sectionCount === 0) score = Math.min(score, 4);
      if (imageCount === 0 && !moneyPages.includes(page.path)) score = Math.min(score, 5);
      if (isLocal && !hasLocalContent) score = Math.min(score, 5);
      if (hasMechanicalHeadings) score = Math.min(score, 6);
      if (hasClonedReviews) score = Math.min(score, 6);
      
      if (!canonical || (!isIndex && metaRobots === '') || httpStatus !== 200 || finalUrl !== url) {
         statusPropus = 'QA_BLOCKED';
         motiv = 'Probleme tehnice majore (canonical, redirect, meta robots lipsa)';
      } else if (moneyPages.includes(page.path)) {
         statusPropus = page.path === '/animatori-petreceri-copii/' ? 'ADD_ONLY' : 'PASS_LOCKED';
         motiv = 'Pagina Money';
         if (score < 8) statusPropus = 'ADD_ONLY'; 
      } else if (!isIndex) {
         if (sectionCount > 3 && imageCount > 0 && score >= 6) {
             statusPropus = 'FIX_TEMPLATE';
             motiv = 'Pagina noindex cu baza buna, necesita rafinare text.';
         } else {
             statusPropus = 'HEAVY_FIX';
             motiv = 'Pagina noindex slaba (putine sectiuni/imagini sau text clatit).';
         }
      } else {
         statusPropus = 'MERGE_REVIEW';
         motiv = 'Pagina indexabila dar nu e core-money. Risc canibalizare.';
      }

      return {
        url: page.path,
        httpStatus,
        finalUrl,
        canonical,
        metaRobots,
        xRobotsTag,
        isIndex,
        inSitemap,
        cluster: determineCluster(page.path),
        title,
        metaDesc,
        h1,
        h2Count,
        sectionCount,
        imageCount,
        imagesWithoutAlt,
        faqCount,
        hasClonedReviews,
        hasMechanicalHeadings,
        keywordStuffing,
        hasFallbackText,
        hasLocalContent: isLocal ? hasLocalContent : 'N/A',
        internalLinksCount,
        linksToHub,
        score,
        statusPropus,
        motiv,
        ceNuAtingem: statusPropus === 'PASS_LOCKED' ? 'TOT' : (statusPropus === 'ADD_ONLY' ? 'Sectiunile bune, H1, Meta' : ''),
        modificari: statusPropus === 'FIX_TEMPLATE' ? 'Scoatem review clonate, naturalizam headinguri' : (statusPropus === 'HEAVY_FIX' ? 'Rescriere' : '')
      };
    });

    const res = await Promise.all(promises);
    results.push(...res);
    
    totalProcessed += chunk.length;
    console.log(`Processed ${totalProcessed} / ${pages.length} URLs...`);
    await delay(500); // polite crawling
  }

  // Generate CSV
  const header = ['URL', 'HTTP', 'Final URL', 'Canonical', 'Meta Robots', 'X-Robots', 'Is Index?', 'In Sitemap?', 'Cluster', 'Title', 'Meta Desc', 'H1', 'H2 Count', 'Sectiuni Reale', 'Imagini Vizibile', 'Img fara Alt', 'FAQ Count', 'Review Clonate?', 'Heading Mecanic?', 'KW Stuffing?', 'Fallback/Eroare?', 'Text Local?', 'Nr Linkuri Int', 'Linkuri Hub', 'Scor Calitate', 'Status Propus', 'Motiv', 'Ce Nu Atingem', 'Modificari Propuse'];
  
  const csvRows = [header];
  for (const r of results) {
    csvRows.push([
      r.url, r.httpStatus, r.finalUrl, r.canonical, r.metaRobots, r.xRobotsTag,
      r.isIndex ? 'DA' : 'NU', r.inSitemap ? 'DA' : 'NU', r.cluster,
      r.title, r.metaDesc, r.h1, r.h2Count, r.sectionCount, r.imageCount, r.imagesWithoutAlt,
      r.faqCount, r.hasClonedReviews ? 'DA' : 'NU', r.hasMechanicalHeadings ? 'DA' : 'NU',
      r.keywordStuffing ? 'DA' : 'NU', r.hasFallbackText ? 'DA' : 'NU', r.hasLocalContent === 'N/A' ? 'N/A' : (r.hasLocalContent ? 'DA' : 'NU'),
      r.internalLinksCount, r.linksToHub, r.score, r.statusPropus, r.motiv, r.ceNuAtingem, r.modificari
    ].map(f => '"' + String(f || '').replace(/"/g, '""') + '"'));
  }

  const csvContent = csvRows.map(r => r.join(",")).join("\n");
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/audit_html_kassia_pages.csv', csvContent);
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/audit_html_kassia_pages.json', JSON.stringify(results, null, 2));

  // Generate Internal Link Audit
  const internalLinkReport = results.map(r => ({
    url: r.url,
    cluster: r.cluster,
    total_internal_links: r.internalLinksCount,
    links_to_parent_hub: r.linksToHub,
    is_orphan: r.internalLinksCount === 0, // Simplified orphan check (outbound from this page, real orphan is incoming)
    is_spammy: r.internalLinksCount > 150
  }));
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/internal_link_audit_kassia.json', JSON.stringify(internalLinkReport, null, 2));

  console.log('DONE!');
})();
