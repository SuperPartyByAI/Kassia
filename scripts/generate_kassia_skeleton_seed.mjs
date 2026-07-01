import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const supportPages = ['/', '/despre-noi/', '/contact/', '/galerie/', '/preturi-decoratiuni-baloane/', '/intrebari-frecvente/', '/recenzii/', '/portofoliu-evenimente/', '/termeni-si-conditii/', '/politica-de-confidentialitate/', '/blog/', '/politica-cookies/'];
const servicePages = ['/decoratiuni-baloane-bucuresti/', '/aranjamente-baloane-bucuresti/', '/arcada-baloane-bucuresti/', '/baloane-heliu-bucuresti/', '/panou-foto-baloane-bucuresti/', '/buchete-baloane-bucuresti/', '/baloane-personalizate-bucuresti/', '/baloane-cifre-litere-bucuresti/', '/ghirlande-baloane-bucuresti/', '/stalpi-baloane-bucuresti/', '/perete-baloane-bucuresti/', '/decor-baloane-candy-bar-bucuresti/', '/livrare-baloane-bucuresti/'];
const eventPages = ['/decoratiuni-baloane-botez-bucuresti/', '/decoratiuni-baloane-mot-bucuresti/', '/decoratiuni-baloane-turta-bucuresti/', '/decoratiuni-baloane-nunta-bucuresti/', '/arcada-baloane-nunta-bucuresti/', '/decoratiuni-baloane-cununie-bucuresti/', '/decoratiuni-baloane-majorat-bucuresti/', '/decoratiuni-baloane-aniversare-copii-bucuresti/', '/decoratiuni-baloane-aniversare-adulti-bucuresti/', '/decoratiuni-baloane-petrecere-bucuresti/', '/decoratiuni-baloane-corporate-bucuresti/', '/decoratiuni-baloane-deschidere-magazin-bucuresti/', '/decoratiuni-baloane-deschidere-restaurant-bucuresti/', '/decoratiuni-baloane-lansare-produs-bucuresti/', '/decoratiuni-baloane-showroom-bucuresti/', '/decoratiuni-baloane-gradinita-bucuresti/', '/decoratiuni-baloane-scoala-bucuresti/', '/decoratiuni-baloane-baby-shower-bucuresti/', '/decoratiuni-baloane-gender-reveal-bucuresti/', '/decoratiuni-baloane-craciun-bucuresti/', '/decoratiuni-baloane-revelion-bucuresti/', '/decoratiuni-baloane-paste-bucuresti/', '/decoratiuni-baloane-halloween-bucuresti/', '/decoratiuni-baloane-1-iunie-bucuresti/', '/decoratiuni-baloane-absolvire-bucuresti/'];
const locationPages = ['/decoratiuni-baloane-sector-1/', '/decoratiuni-baloane-sector-2/', '/decoratiuni-baloane-sector-3/', '/decoratiuni-baloane-sector-4/', '/decoratiuni-baloane-sector-5/', '/decoratiuni-baloane-sector-6/', '/decoratiuni-baloane-aviatiei/', '/decoratiuni-baloane-baneasa/', '/decoratiuni-baloane-domenii/', '/decoratiuni-baloane-herastrau/', '/decoratiuni-baloane-victoriei/', '/decoratiuni-baloane-colentina/', '/decoratiuni-baloane-obor/', '/decoratiuni-baloane-pantelimon/', '/decoratiuni-baloane-tei/', '/decoratiuni-baloane-stefan-cel-mare/', '/decoratiuni-baloane-dristor/', '/decoratiuni-baloane-titan/', '/decoratiuni-baloane-vitan/', '/decoratiuni-baloane-unirii/', '/decoratiuni-baloane-dudesti/', '/decoratiuni-baloane-berceni/', '/decoratiuni-baloane-tineretului/', '/decoratiuni-baloane-piata-sudului/', '/decoratiuni-baloane-aparatorii-patriei/', '/decoratiuni-baloane-oltenitei/', '/decoratiuni-baloane-rahova/', '/decoratiuni-baloane-cotroceni/', '/decoratiuni-baloane-13-septembrie/', '/decoratiuni-baloane-ferentari/', '/decoratiuni-baloane-sebastian/', '/decoratiuni-baloane-drumul-taberei/', '/decoratiuni-baloane-militari/', '/decoratiuni-baloane-crangasi/', '/decoratiuni-baloane-giulesti/', '/decoratiuni-baloane-grozavesti/', '/decoratiuni-baloane-ilfov/', '/decoratiuni-baloane-voluntari/', '/decoratiuni-baloane-pipera/', '/decoratiuni-baloane-otopeni/', '/decoratiuni-baloane-tunari/', '/decoratiuni-baloane-corbeanca/', '/decoratiuni-baloane-balotesti/', '/decoratiuni-baloane-mogosoaia/', '/decoratiuni-baloane-chitila/', '/decoratiuni-baloane-chiajna/', '/decoratiuni-baloane-domnesti/', '/decoratiuni-baloane-bragadiru/', '/decoratiuni-baloane-magurele/', '/decoratiuni-baloane-popesti-leordeni/', '/decoratiuni-baloane-berceni-ilfov/', '/decoratiuni-baloane-pantelimon-ilfov/', '/decoratiuni-baloane-cernica/', '/decoratiuni-baloane-afumati/', '/decoratiuni-baloane-stefanestii-de-jos/', '/decoratiuni-baloane-dascalu/', '/decoratiuni-baloane-snagov/', '/decoratiuni-baloane-clinceni/', '/decoratiuni-baloane-dragomiresti-vale/', '/decoratiuni-baloane-jilava/', '/decoratiuni-baloane-1-decembrie/'];
const satellitePages = ['/arcada-baloane-botez-bucuresti/', '/arcada-baloane-majorat-bucuresti/', '/arcada-baloane-nunta-bucuresti/', '/panou-foto-baloane-botez-bucuresti/', '/panou-foto-baloane-majorat-bucuresti/', '/baloane-heliu-majorat-bucuresti/', '/baloane-heliu-aniversare-bucuresti/', '/buchete-baloane-aniversare-bucuresti/', '/decoratiuni-baloane-roz-auriu-bucuresti/', '/decoratiuni-baloane-alb-auriu-bucuresti/'];

const blogs = [
  { path: '/blog/cat-costa-decoratiunile-cu-baloane/', pk: 'cât costă decorațiunile cu baloane', intent: 'informativ / preț', links: ['/preturi-decoratiuni-baloane/', '/decoratiuni-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/cat-costa-o-arcada-de-baloane/', pk: 'cât costă o arcadă de baloane', intent: 'informativ / preț serviciu', links: ['/arcada-baloane-bucuresti/', '/preturi-decoratiuni-baloane/', '/contact/'] },
  { path: '/blog/cat-costa-baloanele-cu-heliu/', pk: 'cât costă baloanele cu heliu', intent: 'informativ / preț produs', links: ['/baloane-heliu-bucuresti/', '/buchete-baloane-bucuresti/', '/preturi-decoratiuni-baloane/', '/contact/'] },
  { path: '/blog/cat-costa-un-panou-foto-cu-baloane/', pk: 'cât costă un panou foto cu baloane', intent: 'informativ / preț serviciu', links: ['/panou-foto-baloane-bucuresti/', '/decoratiuni-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/cat-costa-un-decor-de-baloane-pentru-botez/', pk: 'cât costă decor baloane botez', intent: 'informativ / preț eveniment', links: ['/decoratiuni-baloane-botez-bucuresti/', '/arcada-baloane-botez-bucuresti/', '/preturi-decoratiuni-baloane/', '/contact/'] },
  { path: '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/', pk: 'cât costă decor baloane nuntă', intent: 'informativ / preț eveniment', links: ['/decoratiuni-baloane-nunta-bucuresti/', '/arcada-baloane-nunta-bucuresti/', '/preturi-decoratiuni-baloane/', '/contact/'] },
  { path: '/blog/ce-include-un-pachet-decor-baloane/', pk: 'ce include un pachet decor baloane', intent: 'informativ / decizie', links: ['/decoratiuni-baloane-bucuresti/', '/preturi-decoratiuni-baloane/', '/galerie/', '/contact/'] },
  { path: '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/', pk: 'cum alegi pachetul de decorațiuni baloane', intent: 'informativ / decizie', links: ['/decoratiuni-baloane-bucuresti/', '/preturi-decoratiuni-baloane/', '/contact/'] },
  
  { path: '/blog/cum-alegi-arcada-de-baloane/', pk: 'cum alegi arcada de baloane', intent: 'ghid informativ', links: ['/arcada-baloane-bucuresti/', '/decoratiuni-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/arcada-baloane-organica-sau-clasica/', pk: 'arcadă baloane organică sau clasică', intent: 'comparație', links: ['/arcada-baloane-bucuresti/', '/galerie/', '/contact/'] },
  { path: '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/', pk: 'dimensiune arcadă baloane', intent: 'informativ', links: ['/arcada-baloane-bucuresti/', '/panou-foto-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/unde-se-poate-monta-o-arcada-de-baloane/', pk: 'unde se poate monta o arcadă de baloane', intent: 'logistic / informativ', links: ['/arcada-baloane-bucuresti/', '/decoratiuni-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/cat-rezista-o-arcada-de-baloane/', pk: 'cât rezistă o arcadă de baloane', intent: 'informativ', links: ['/arcada-baloane-bucuresti/', '/decoratiuni-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/idei-arcada-baloane-pentru-evenimente/', pk: 'idei arcadă baloane evenimente', intent: 'inspirațional', links: ['/arcada-baloane-bucuresti/', '/galerie/', '/decoratiuni-baloane-botez-bucuresti/', '/decoratiuni-baloane-nunta-bucuresti/', '/contact/'] },

  { path: '/blog/baloane-heliu-cat-rezista/', pk: 'baloane heliu cât rezistă', intent: 'informativ', links: ['/baloane-heliu-bucuresti/', '/buchete-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/baloane-heliu-latex-sau-folie/', pk: 'baloane heliu latex sau folie', intent: 'comparație', links: ['/baloane-heliu-bucuresti/', '/baloane-personalizate-bucuresti/', '/contact/'] },
  { path: '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/', pk: 'câte baloane cu heliu sunt necesare pentru o cameră', intent: 'informativ / calcul', links: ['/baloane-heliu-bucuresti/', '/buchete-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/cum-se-transporta-baloanele-cu-heliu/', pk: 'cum se transportă baloanele cu heliu', intent: 'logistic', links: ['/baloane-heliu-bucuresti/', '/livrare-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/baloane-cu-heliu-pentru-copii-idei/', pk: 'baloane cu heliu pentru copii idei', intent: 'inspirațional', links: ['/baloane-heliu-bucuresti/', '/decoratiuni-baloane-aniversare-copii-bucuresti/', '/contact/'] },
  { path: '/blog/baloane-cu-heliu-pentru-majorat-idei/', pk: 'baloane cu heliu pentru majorat idei', intent: 'inspirațional', links: ['/baloane-heliu-bucuresti/', '/decoratiuni-baloane-majorat-bucuresti/', '/baloane-heliu-majorat-bucuresti/', '/contact/'] },

  { path: '/blog/idei-decor-baloane-botez/', pk: 'idei decor baloane botez', intent: 'inspirațional', links: ['/decoratiuni-baloane-botez-bucuresti/', '/arcada-baloane-botez-bucuresti/', '/panou-foto-baloane-botez-bucuresti/', '/contact/'] },
  { path: '/blog/idei-decor-baloane-mot-si-turta/', pk: 'idei decor baloane moț și turtă', intent: 'inspirațional', links: ['/decoratiuni-baloane-mot-bucuresti/', '/decoratiuni-baloane-turta-bucuresti/', '/decoratiuni-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/idei-decor-baloane-nunta/', pk: 'idei decor baloane nuntă', intent: 'inspirațional', links: ['/decoratiuni-baloane-nunta-bucuresti/', '/arcada-baloane-nunta-bucuresti/', '/panou-foto-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/idei-decor-baloane-cununie/', pk: 'idei decor baloane cununie', intent: 'inspirațional', links: ['/decoratiuni-baloane-cununie-bucuresti/', '/arcada-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/idei-decor-baloane-majorat/', pk: 'idei decor baloane majorat', intent: 'inspirațional', links: ['/decoratiuni-baloane-majorat-bucuresti/', '/arcada-baloane-majorat-bucuresti/', '/baloane-heliu-majorat-bucuresti/', '/contact/'] },
  { path: '/blog/idei-decor-baloane-aniversare-copii/', pk: 'idei decor baloane aniversare copii', intent: 'inspirațional', links: ['/decoratiuni-baloane-aniversare-copii-bucuresti/', '/baloane-heliu-bucuresti/', '/contact/'] },
  { path: '/blog/idei-decor-baloane-aniversare-adulti/', pk: 'idei decor baloane aniversare adulți', intent: 'inspirațional', links: ['/decoratiuni-baloane-aniversare-adulti-bucuresti/', '/baloane-heliu-bucuresti/', '/arcada-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/idei-decor-baloane-baby-shower/', pk: 'idei decor baloane baby shower', intent: 'inspirațional', links: ['/decoratiuni-baloane-baby-shower-bucuresti/', '/baloane-personalizate-bucuresti/', '/contact/'] },
  { path: '/blog/idei-decor-baloane-gender-reveal/', pk: 'idei decor baloane gender reveal', intent: 'inspirațional', links: ['/decoratiuni-baloane-gender-reveal-bucuresti/', '/baloane-personalizate-bucuresti/', '/baloane-heliu-bucuresti/', '/contact/'] },
  { path: '/blog/idei-decor-baloane-corporate/', pk: 'idei decor baloane corporate', intent: 'inspirațional', links: ['/decoratiuni-baloane-corporate-bucuresti/', '/decoratiuni-baloane-deschidere-magazin-bucuresti/', '/contact/'] },

  { path: '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/', pk: 'cum alegi culorile pentru decorul cu baloane', intent: 'informativ / design', links: ['/decoratiuni-baloane-bucuresti/', '/galerie/', '/contact/'] },
  { path: '/blog/decor-baloane-roz-auriu-idei/', pk: 'decor baloane roz auriu idei', intent: 'inspirațional', links: ['/decoratiuni-baloane-roz-auriu-bucuresti/', '/galerie/', '/contact/'] },
  { path: '/blog/decor-baloane-alb-auriu-idei/', pk: 'decor baloane alb auriu idei', intent: 'inspirațional', links: ['/decoratiuni-baloane-alb-auriu-bucuresti/', '/galerie/', '/contact/'] },
  { path: '/blog/decor-baloane-pastel-idei/', pk: 'decor baloane pastel idei', intent: 'inspirațional', links: ['/decoratiuni-baloane-bucuresti/', '/galerie/', '/contact/'] },
  { path: '/blog/decor-baloane-luxury-idei/', pk: 'decor baloane luxury idei', intent: 'inspirațional', links: ['/decoratiuni-baloane-bucuresti/', '/galerie/', '/contact/'] },
  { path: '/blog/decor-baloane-minimalist-sau-spectaculos/', pk: 'decor baloane minimalist sau spectaculos', intent: 'comparație / inspirațional', links: ['/decoratiuni-baloane-bucuresti/', '/galerie/', '/contact/'] },

  { path: '/blog/cum-comanzi-decoratiuni-cu-baloane/', pk: 'cum comanzi decorațiuni cu baloane', intent: 'logistic / conversie', links: ['/contact/', '/decoratiuni-baloane-bucuresti/', '/preturi-decoratiuni-baloane/'] },
  { path: '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/', pk: 'cu cât timp înainte se comandă decorul cu baloane', intent: 'logistic', links: ['/contact/', '/decoratiuni-baloane-bucuresti/', '/intrebari-frecvente/'] },
  { path: '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/', pk: 'ce informații trebuie să trimiți pentru ofertă decor baloane', intent: 'logistic / conversie', links: ['/contact/', '/preturi-decoratiuni-baloane/', '/decoratiuni-baloane-bucuresti/'] },
  { path: '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/', pk: 'montaj decorațiuni baloane', intent: 'logistic / informativ', links: ['/decoratiuni-baloane-bucuresti/', '/arcada-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/', pk: 'decorațiuni baloane exterior', intent: 'logistic / informativ', links: ['/decoratiuni-baloane-bucuresti/', '/arcada-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/', pk: 'ce se întâmplă cu decorul după eveniment', intent: 'logistic / informativ', links: ['/decoratiuni-baloane-bucuresti/', '/intrebari-frecvente/', '/contact/'] },

  { path: '/blog/panou-foto-cu-baloane-idei-si-recomandari/', pk: 'panou foto cu baloane idei', intent: 'informativ / inspirațional', links: ['/panou-foto-baloane-bucuresti/', '/decoratiuni-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/candy-bar-cu-decor-de-baloane-idei/', pk: 'candy bar cu decor de baloane idei', intent: 'inspirațional', links: ['/decor-baloane-candy-bar-bucuresti/', '/decoratiuni-baloane-botez-bucuresti/', '/decoratiuni-baloane-aniversare-copii-bucuresti/', '/contact/'] },
  { path: '/blog/foto-corner-cu-baloane-pentru-evenimente/', pk: 'foto corner cu baloane pentru evenimente', intent: 'inspirațional / informativ', links: ['/panou-foto-baloane-bucuresti/', '/arcada-baloane-bucuresti/', '/contact/'] },
  { path: '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/', pk: 'cifre și litere din baloane', intent: 'informativ', links: ['/baloane-cifre-litere-bucuresti/', '/decoratiuni-baloane-majorat-bucuresti/', '/decoratiuni-baloane-aniversare-copii-bucuresti/', '/contact/'] },
  { path: '/blog/buchete-baloane-cand-se-potrivesc/', pk: 'buchete baloane când se potrivesc', intent: 'informativ', links: ['/buchete-baloane-bucuresti/', '/baloane-heliu-bucuresti/', '/contact/'] },
  { path: '/blog/baloane-personalizate-pentru-evenimente/', pk: 'baloane personalizate pentru evenimente', intent: 'informativ / comercial suport', links: ['/baloane-personalizate-bucuresti/', '/baloane-heliu-bucuresti/', '/contact/'] }
];

const rawPages = [
  ...supportPages.map(s => ({ path: s, type: s === '/' ? 'homepage' : 'support' })),
  ...servicePages.map(s => ({ path: s, type: s === '/decoratiuni-baloane-bucuresti/' ? 'service_pillar' : 'service' })),
  ...eventPages.map(s => ({ path: s, type: 'event' })),
  ...locationPages.map(s => ({ path: s, type: 'location' })),
  ...satellitePages.map(s => ({ path: s, type: 'satellite' })),
  ...blogs.map(b => ({ path: b.path, type: 'blog_post', pk: b.pk, intent: b.intent, required_links: b.links }))
];

const pilonPath = '/decoratiuni-baloane-bucuresti/';

function toTitleCase(str) {
  return str.split('-').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ');
}

// 1. Process Pages & Links
const links = [];
const pages = [];
let missingTargetsCount = 0;
let duplicateLinksCount = 0;

function addLink(source, target, anchor, reason) {
  if (source === target) return;
  if (!rawPages.find(p => p.path === target)) {
    missingTargetsCount++;
    return;
  }
  if (links.find(l => l.source === source && l.target === target)) {
    duplicateLinksCount++;
    return;
  }
  links.push({ source, target, anchor, reason });
}

rawPages.forEach(p => {
  let main_keyword = p.pk || p.path.replace(/\//g, '').replace(/-/g, ' ');
  if (p.path === '/') main_keyword = 'decoratiuni baloane bucuresti';
  
  let parent_path = null;
  if (p.type === 'service' || p.type === 'event' || p.type === 'location') {
    parent_path = pilonPath;
  } else if (p.type === 'satellite') {
    if (p.path.includes('botez')) parent_path = '/decoratiuni-baloane-botez-bucuresti/';
    else if (p.path.includes('majorat')) parent_path = '/decoratiuni-baloane-majorat-bucuresti/';
    else if (p.path.includes('nunta')) parent_path = '/decoratiuni-baloane-nunta-bucuresti/';
    else if (p.path.includes('aniversare')) parent_path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    else parent_path = pilonPath;
  } else if (p.type === 'support' && p.path !== '/') {
    parent_path = '/';
  } else if (p.type === 'blog_post') {
    parent_path = '/blog/';
  }

  let sections_to_create = [];
  let faq_slots_to_create = 0;
  let media_slots_to_create = [];

  if (p.type === 'support') {
    sections_to_create = ['hero', 'content', 'final_cta'];
    media_slots_to_create = ['hero_image'];
  } else if (p.type === 'blog_post') {
    sections_to_create = ['hero', 'intro', 'toc', 'main_answer', 'examples', 'mistakes_to_avoid', 'recommended_services', 'faq', 'final_cta'];
    media_slots_to_create = ['hero_image', 'gallery_1', 'gallery_2', 'gallery_3', 'gallery_4'];
    faq_slots_to_create = 3;
  } else {
    sections_to_create = ['hero', 'intro', 'gallery', 'pricing', 'faq', 'final_cta'];
    media_slots_to_create = ['hero_image', 'gallery_1', 'gallery_2', 'gallery_3'];
    faq_slots_to_create = 3;
    if (p.type === 'service') sections_to_create.push('service_features');
    if (p.type === 'event') sections_to_create.push('event_use_cases');
    if (p.type === 'location') sections_to_create.push('available_services', 'nearby_areas');
  }

  pages.push({
    path: p.path,
    page_type: p.type === 'blog_post' ? 'guide' : p.type,
    parent_path,
    main_keyword,
    search_intent: p.intent || (p.type === 'support' ? 'navigational' : 'commercial'),
    status: 'draft',
    index_status: 'noindex',
    include_in_sitemap: false,
    sections_to_create,
    faq_slots_to_create,
    media_slots_to_create,
    internal_links_to_create: []
  });

  // Sophisticated Link Generation
  if (p.type === 'homepage') {
    addLink(p.path, pilonPath, 'decorațiuni baloane', 'pillar_link');
    addLink(p.path, '/contact/', 'contact', 'conversion');
    addLink(p.path, '/galerie/', 'galerie', 'inspiration');
    addLink(p.path, '/preturi-decoratiuni-baloane/', 'prețuri', 'commercial');
    // link to support pages to simulate footer navigation
    supportPages.forEach(t => {
      if (t !== '/' && t !== '/contact/' && t !== '/galerie/' && t !== '/preturi-decoratiuni-baloane/') {
        addLink(p.path, t, t.replace(/\//g,'').replace(/-/g,' '), 'footer_nav');
      }
    });
  } else if (p.type === 'service_pillar') {
    servicePages.forEach(t => addLink(p.path, t, t.replace(/\//g,'').replace(/-/g,' '), 'all_services'));
    // some core events
    ['/decoratiuni-baloane-botez-bucuresti/', '/decoratiuni-baloane-nunta-bucuresti/'].forEach(t => addLink(p.path, t, t.replace(/\//g,'').replace(/-/g,' '), 'core_event'));
    ['/decoratiuni-baloane-sector-1/', '/decoratiuni-baloane-ilfov/'].forEach(t => addLink(p.path, t, t.replace(/\//g,'').replace(/-/g,' '), 'core_location'));
    addLink(p.path, '/galerie/', 'galerie decor', 'inspiration');
    addLink(p.path, '/contact/', 'contact rapid', 'conversion');
    addLink(p.path, '/preturi-decoratiuni-baloane/', 'prețuri decorațiuni', 'commercial');
  } else if (p.path === '/contact/') {
    // Contact page links to ALL locations (areas covered)
    locationPages.forEach(t => addLink(p.path, t, t.replace(/\//g,'').replace(/-/g,' '), 'area_covered'));
  } else if (p.path === '/portofoliu-evenimente/') {
    // Portfolio links to ALL events
    eventPages.forEach(t => addLink(p.path, t, t.replace(/\//g,'').replace(/-/g,' '), 'portfolio_event'));
    satellitePages.forEach(t => addLink(p.path, t, t.replace(/\//g,'').replace(/-/g,' '), 'portfolio_satellite'));
  } else if (p.path === '/blog/') {
    // Hub links to ALL articles
    blogs.forEach(b => addLink(p.path, b.path, b.pk, 'hub_article'));
  } else if (p.type === 'service') {
    addLink(p.path, pilonPath, 'decorațiuni baloane București', 'pillar_link');
    addLink(p.path, '/contact/', 'cere ofertă', 'conversion');
    addLink(p.path, '/preturi-decoratiuni-baloane/', 'verifică prețurile', 'commercial');
    addLink(p.path, '/galerie/', 'vezi galerie', 'inspiration');
    // 2-3 evenimente
    addLink(p.path, '/decoratiuni-baloane-botez-bucuresti/', 'baloane botez', 'relevant_event');
    addLink(p.path, '/decoratiuni-baloane-majorat-bucuresti/', 'baloane majorat', 'relevant_event');
    // 2-3 servicii complementare
    if (p.path !== '/arcada-baloane-bucuresti/') addLink(p.path, '/arcada-baloane-bucuresti/', 'arcadă baloane', 'complementary_service');
    if (p.path !== '/baloane-heliu-bucuresti/') addLink(p.path, '/baloane-heliu-bucuresti/', 'baloane heliu', 'complementary_service');
  } else if (p.type === 'event') {
    addLink(p.path, pilonPath, 'decorațiuni baloane', 'pillar_link');
    addLink(p.path, '/contact/', 'contactează-ne', 'conversion');
    addLink(p.path, '/galerie/', 'galerie evenimente', 'inspiration');
    addLink(p.path, '/arcada-baloane-bucuresti/', 'arcadă foto', 'relevant_service');
    addLink(p.path, '/baloane-heliu-bucuresti/', 'baloane heliu', 'relevant_service');
    addLink(p.path, '/panou-foto-baloane-bucuresti/', 'panou foto', 'relevant_service');
  } else if (p.type === 'location') {
    addLink(p.path, pilonPath, 'decorațiuni baloane București', 'pillar_link');
    addLink(p.path, '/contact/', 'comandă acum', 'conversion');
    addLink(p.path, '/arcada-baloane-bucuresti/', 'arcade din baloane', 'core_service');
    addLink(p.path, '/baloane-heliu-bucuresti/', 'heliu', 'core_service');
    addLink(p.path, '/panou-foto-baloane-bucuresti/', 'panouri foto', 'core_service');
    if (p.path.includes('ilfov')) addLink(p.path, '/decoratiuni-baloane-ilfov/', 'decorațiuni Ilfov', 'parent_location');
  } else if (p.type === 'satellite') {
    addLink(p.path, parent_path, 'înapoi la eveniment', 'parent_link');
    addLink(p.path, pilonPath, 'decorațiuni baloane', 'pillar_link');
    addLink(p.path, '/contact/', 'rezervă', 'conversion');
    if (p.path.includes('arcada')) addLink(p.path, '/arcada-baloane-bucuresti/', 'arcade baloane', 'relevant_service');
    if (p.path.includes('panou')) addLink(p.path, '/panou-foto-baloane-bucuresti/', 'panouri foto', 'relevant_service');
  } else if (p.type === 'support') {
    addLink(p.path, pilonPath, 'decorațiuni baloane București', 'pillar_link');
    if (p.path !== '/contact/') addLink(p.path, '/contact/', 'contact', 'conversion');
  } else if (p.type === 'blog_post') {
    p.required_links.forEach(t => addLink(p.path, t, t.replace(/\//g,'').replace(/-/g,' '), 'recommended_service'));
  }
});

// Map links to pages
links.forEach(l => {
  const sourcePage = pages.find(p => p.path === l.source);
  if (sourcePage) sourcePage.internal_links_to_create.push({ target: l.target, anchor: l.anchor, reason: l.reason });
});

// Check orphan risk
const targetedPaths = new Set(links.map(l => l.target));
const orphanRiskCount = pages.filter(p => !targetedPaths.has(p.path) && p.path !== '/').length;

// Export Preview
const previewData = {
  summary: {
    total_planned_pages: pages.length,
    planned_sections: pages.reduce((acc, p) => acc + p.sections_to_create.length, 0),
    planned_faq_slots: pages.reduce((acc, p) => acc + p.faq_slots_to_create, 0),
    planned_media_slots: pages.reduce((acc, p) => acc + p.media_slots_to_create.length, 0),
    planned_internal_links: links.length,
    duplicate_planned_links: duplicateLinksCount,
    missing_planned_targets: missingTargetsCount,
    orphan_risk_after_planned_links: orphanRiskCount
  },
  pages
};

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const docsDir = path.join(__dirname, '..', 'docs');
if (!fs.existsSync(docsDir)) fs.mkdirSync(docsDir, { recursive: true });

fs.writeFileSync(path.join(docsDir, 'kassia_seed_preview_from_skeleton.json'), JSON.stringify(previewData, null, 2));

let mdContent = `# Kassia Seed Preview (169 Pages)\n\n`;
mdContent += `- Total planned pages: ${previewData.summary.total_planned_pages}\n`;
mdContent += `- Planned sections: ${previewData.summary.planned_sections}\n`;
mdContent += `- Planned FAQ slots: ${previewData.summary.planned_faq_slots}\n`;
mdContent += `- Planned media slots: ${previewData.summary.planned_media_slots}\n`;
mdContent += `- Planned internal links: ${previewData.summary.planned_internal_links}\n`;
mdContent += `- Orphan risk: ${previewData.summary.orphan_risk_after_planned_links}\n\n`;

mdContent += `### Schema: Anti-Cannibalization Map (Snippet)\n`;
pages.filter(p => p.page_type === 'guide').slice(0, 5).forEach(p => {
  mdContent += `- **${p.path}**\n  - Intent: ${p.search_intent}\n  - Target Keyword: ${p.main_keyword}\n`;
});

fs.writeFileSync(path.join(docsDir, 'kassia_seed_preview_from_skeleton.md'), mdContent);

// Generate SQL 04_seed_kassia_skeleton_preview.sql
let sqlOut = `-- SEED SKELETON PREVIEW PENTRU KASSIA (169 PAGES)\n`;
sqlOut += `-- GENERATED VIA SCRIPT.\n\n`;
sqlOut += `DO $$\nDECLARE\n    v_page_id UUID;\nBEGIN\n\n`;

pages.forEach(p => {
  sqlOut += `    -- PAGE: ${p.path}\n`;
  sqlOut += `    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)\n`;
  const slug = p.path === '/' ? 'home' : p.path.replace(/\//g, '');
  const title = p.path === '/' ? 'Homepage' : toTitleCase(slug);
  sqlOut += `    VALUES ('${slug}', '${p.path}', '${p.page_type}', '${title.replace(/'/g, "''")}', '${title.replace(/'/g, "''")}', '${title.replace(/'/g, "''")} - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)\n`;
  sqlOut += `    RETURNING id INTO v_page_id;\n\n`;
  
  p.sections_to_create.forEach((sec, idx) => {
    sqlOut += `    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)\n`;
    sqlOut += `    VALUES (v_page_id, '${sec}', ${idx + 1});\n`;
  });
  
  for(let i=1; i<=p.faq_slots_to_create; i++) {
    sqlOut += `    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)\n`;
    sqlOut += `    VALUES (v_page_id, 'Q${i} pentru ${slug}?', 'A${i}', ${i});\n`;
  }
  sqlOut += `\n`;
});
sqlOut += `END $$;\n\n`;

sqlOut += `DO $$\nBEGIN\n\n`;
links.forEach(l => {
  sqlOut += `    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)\n`;
  sqlOut += `    SELECT p1.id, p2.id, '${l.anchor.replace(/'/g, "''")}', '${l.reason}'\n`;
  sqlOut += `    FROM kassia_pages p1, kassia_pages p2\n`;
  sqlOut += `    WHERE p1.path = '${l.source}' AND p2.path = '${l.target}'\n`;
  sqlOut += `    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;\n\n`;
});
sqlOut += `END $$;\n`;

const dbDir = path.join(__dirname, '..', 'db');
if (!fs.existsSync(dbDir)) fs.mkdirSync(dbDir, { recursive: true });
fs.writeFileSync(path.join(dbDir, '04_seed_kassia_skeleton_preview.sql'), sqlOut);

console.log(JSON.stringify(previewData.summary, null, 2));
