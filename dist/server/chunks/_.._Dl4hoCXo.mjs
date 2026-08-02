import { c as createComponent } from './astro-component_BolP7oBx.mjs';
import 'piccolore';
import { aM as maybeRenderHead, a5 as addAttribute, aY as renderTemplate, m as Fragment, b5 as unescapeHTML } from './params-and-props_COoDNZnO.mjs';
import { r as renderComponent } from './server_KVogxJwq.mjs';
import { s as supabase } from './supabase_m9V3dadf.mjs';
import { $ as $$Layout } from './Layout_nXdveVCy.mjs';
import { $ as $$Footer } from './Footer_hXl4F4Is.mjs';
import { $ as $$ReviewsCarousel } from './ReviewsCarousel_MPoCkUKY.mjs';
import 'clsx';
import { g as getLegacyRedirect, a as appendSearch, d as isKnownGonePath, j as normalizeRequestPath, e as isReservedFileRoute, i as isFileLikePath, c as isGonePageStatus, b as buildSelfCanonical, S as SITE_ORIGIN } from './kassia-routing_C02FXj94.mjs';

const PACKAGE_DEFINITIONS = [
  {
    id: 'one-animator-one-hour',
    group: 'animatori',
    title: '1 personaj animator',
    shortTitle: '1 animator',
    duration: '1 oră',
    price: 280,
    currency: 'RON',
    description: 'Potrivit pentru grupuri restrânse de până la 12 copii și spații bine delimitate.',
    includes: [
      'Jocuri interactive adaptate vârstei',
      'Ateliere de creație cu baloane',
      'Sistem audio profesional',
      'Asistență la momentul tortului'
    ],
    preview: true
  },
  {
    id: 'one-animator-two-hours',
    group: 'animatori',
    title: '1 personaj animator',
    shortTitle: '1 animator',
    duration: '2 ore',
    price: 490,
    currency: 'RON',
    description: 'Varianta standard recomandată pentru o petrecere completă.',
    includes: [
      'Jocuri interactive adaptate vârstei',
      'Ateliere de creație cu baloane',
      'Sistem audio profesional',
      'Asistență la momentul tortului',
      'Moment special Balloon Exploder'
    ],
    preview: true
  },
  {
    id: 'one-animator-three-hours',
    group: 'animatori',
    title: '1 personaj animator',
    shortTitle: '1 animator',
    duration: '3 ore',
    price: 640,
    currency: 'RON',
    description: 'Program extins pentru evenimente lungi și activități variate.',
    includes: [
      'Jocuri interactive adaptate vârstei',
      'Ateliere de creație cu baloane',
      'Sistem audio profesional',
      'Asistență la momentul tortului',
      'Moment special Balloon Exploder',
      'Piñata inclusă în program'
    ],
    preview: false
  },
  {
    id: 'two-animators-one-hour',
    group: 'animatori',
    title: '2 personaje animatoare',
    shortTitle: '2 animatori',
    duration: '1 oră',
    price: 490,
    currency: 'RON',
    description: 'Potrivit pentru grupuri mai mari, spații deschise sau curți mari.',
    includes: [
      'Doi entertaineri coordonatori simultan',
      'Jocuri pentru grupuri mixte de vârstă',
      'Activități dinamice pentru spații mari',
      'Asistență la momentul tortului'
    ],
    preview: true
  },
  {
    id: 'two-animators-two-hours',
    group: 'animatori',
    title: '2 personaje animatoare',
    shortTitle: '2 animatori',
    duration: '2 ore',
    price: 830,
    currency: 'RON',
    description: 'Recomandat pentru grupuri mari și diversitate în animație.',
    includes: [
      'Doi entertaineri coordonatori simultan',
      'Jocuri pentru grupuri mixte de vârstă',
      'Activități dinamice pentru spații mari',
      'Asistență la momentul tortului',
      'Piñata inclusă în program'
    ],
    preview: true
  },
  {
    id: 'two-animators-three-hours',
    group: 'animatori',
    title: '2 personaje animatoare',
    shortTitle: '2 animatori',
    duration: '3 ore',
    price: 1120,
    currency: 'RON',
    description: 'Program extins cu interacțiune susținută pentru grupuri mari.',
    includes: [
      'Doi entertaineri coordonatori simultan',
      'Jocuri pentru grupuri mixte de vârstă',
      'Activități dinamice pentru spații mari',
      'Piñata inclusă în program',
      'Moment special Balloon Exploder'
    ],
    preview: false
  },
  {
    id: 'one-stilt-animator-one-hour',
    group: 'picioroange',
    title: '1 animator pe picioroange',
    shortTitle: '1 animator pe picioroange',
    duration: '1 oră',
    price: 1450,
    currency: 'RON',
    description: 'Moment vizual pentru primirea invitaților și evenimente de mari dimensiuni.',
    includes: [
      'Welcome guests la locație',
      'Costum tematic spectaculos',
      'Interacțiune și photo-corner mobil',
      'Potrivit pentru spații mari și evenimente în aer liber'
    ],
    preview: false
  },
  {
    id: 'two-stilt-animators-one-hour',
    group: 'picioroange',
    title: '2 animatori pe picioroange',
    shortTitle: '2 animatori pe picioroange',
    duration: '1 oră',
    price: 2750,
    currency: 'RON',
    description: 'Impact vizual dublu pentru evenimente de scară largă.',
    includes: [
      'Welcome guests la locație',
      'Două costume tematice spectaculoase',
      'Interacțiune și photo-corner mobil',
      'Potrivit pentru spații mari și evenimente în aer liber'
    ],
    preview: false
  }
];

const ALL_ANIMATORI_PACKAGES = Object.freeze(
  PACKAGE_DEFINITIONS.map((entry) => Object.freeze({
    ...entry,
    includes: Object.freeze([...entry.includes])
  }))
);

const CORE_ANIMATORI_PACKAGES = Object.freeze(
  ALL_ANIMATORI_PACKAGES.filter((entry) => entry.preview)
);

Object.freeze(
  ALL_ANIMATORI_PACKAGES.filter((entry) => !entry.preview)
);
const PRICING_PAGE_SLUG = 'preturi-animatori-copii-bucuresti';

const LEGACY_PRICING_SECTION_TYPES = new Set([
  'pricing',
  'pricing_preview',
  'pricing_table',
  'pricing_programs',
  'pricing_full_table'
]);

const DEPRECATED_VISIBLE_PRICE_PATTERN = /(?:\b(?:350|430|560|790|860|9999)\s*(?:lei|ron)\b|["']?(?:price_amount|price)["']?\s*[:=]\s*["']?(?:350|430|560|790|860|9999)\b)/i;
const PRICING_CONTEXT_PATTERN = /(?:preț|pret|tarif|pachet|program|animator|picioroange)/i;

function shouldShowCanonicalPricing(slug, showPricingPreview = false) {
  const value = String(slug || '').toLowerCase();
  return Boolean(
    value === PRICING_PAGE_SLUG ||
    value === 'animatori-petreceri-copii' ||
    value === 'animatori-petreceri-copii-bucuresti' ||
    /^animatori-petreceri-copii-sector-[1-6]$/.test(value) ||
    showPricingPreview
  );
}

function getVisiblePricingPrograms(variant = 'preview') {
  return variant === 'full' ? ALL_ANIMATORI_PACKAGES : CORE_ANIMATORI_PACKAGES;
}

function getSchemaPricingPrograms(slug, showPricingPreview = false) {
  const value = String(slug || '').toLowerCase();
  if (value === PRICING_PAGE_SLUG) return ALL_ANIMATORI_PACKAGES;
  return shouldShowCanonicalPricing(value, showPricingPreview)
    ? CORE_ANIMATORI_PACKAGES
    : [];
}

function containsDeprecatedAnimatorPrice(value) {
  if (value === null || value === undefined) return false;
  let text;
  try {
    text = typeof value === 'string' ? value : JSON.stringify(value);
  } catch {
    return false;
  }
  return DEPRECATED_VISIBLE_PRICE_PATTERN.test(text);
}

function shouldSuppressLegacyPricingSection(section, canonicalPricingEnabled = false) {
  if (!canonicalPricingEnabled || !section) return false;
  const sectionType = String(section.section_type || '').trim().toLowerCase();
  if (LEGACY_PRICING_SECTION_TYPES.has(sectionType)) return true;

  const searchable = `${String(section.heading || '')} ${typeof section.content === 'string' ? section.content : JSON.stringify(section.content || {})}`;
  return PRICING_CONTEXT_PATTERN.test(searchable) && containsDeprecatedAnimatorPrice(searchable);
}

function buildOfferCatalog(programs = CORE_ANIMATORI_PACKAGES) {
  return {
    '@type': 'OfferCatalog',
    name: 'Programe animatori pentru petreceri de copii',
    itemListElement: programs.map((program) => ({
      '@type': 'Offer',
      itemOffered: {
        '@type': 'Service',
        name: `${program.title} / ${program.duration}`
      },
      price: String(program.price),
      priceCurrency: program.currency,
      availability: 'https://schema.org/InStock',
      url: 'https://www.kassia.ro/preturi-animatori-copii-bucuresti/'
    }))
  };
}

const $$KassiaPricingCatalog = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$KassiaPricingCatalog;
  const { variant = "preview", locationName = "București și Ilfov" } = Astro2.props;
  const isFull = variant === "full";
  const programs = getVisiblePricingPrograms(variant);
  const groups = isFull ? [
    { id: "animatori", heading: "Programe cu animatori", programs: programs.filter((entry) => entry.group === "animatori") },
    { id: "picioroange", heading: "Animatori pe picioroange", programs: programs.filter((entry) => entry.group === "picioroange") }
  ] : [{ id: "preview", heading: null, programs }];
  const heading = isFull ? "Prețuri animatori pentru petreceri de copii" : "Pachete animatori pentru petrecerea ta";
  const intro = isFull ? "Alege numărul de animatori și durata programului. Prețurile de mai jos sunt afișate identic în conținutul public și în datele structurate ale paginii." : `Cele mai solicitate variante pentru ${locationName}, cu tarife identice pe toate paginile Kassia.`;
  const whatsappText = encodeURIComponent("Bună! Aș dori să rezerv un program cu animatori și am nevoie de recomandarea potrivită.");
  return renderTemplate`${maybeRenderHead()}<section${addAttribute(["kassia-pricing-catalog", isFull ? "pricing-full-table" : "pricing-preview-section"], "class:list")}${addAttribute(variant, "data-kassia-pricing")}${addAttribute(`kassia-pricing-${variant}-heading`, "aria-labelledby")} data-astro-cid-rkwsnyfo> <div class="pricing-catalog-container" data-astro-cid-rkwsnyfo> <div class="pricing-catalog-heading" data-astro-cid-rkwsnyfo> <p class="pricing-eyebrow" data-astro-cid-rkwsnyfo>Tarife clare</p> <h2${addAttribute(`kassia-pricing-${variant}-heading`, "id")} data-astro-cid-rkwsnyfo>${heading}</h2> <p data-astro-cid-rkwsnyfo>${intro}</p> </div> ${groups.map((group) => renderTemplate`<div class="pricing-group"${addAttribute(group.id, "data-pricing-group")} data-astro-cid-rkwsnyfo> ${group.heading && renderTemplate`<h3 class="pricing-group-heading" data-astro-cid-rkwsnyfo>${group.heading}</h3>`} <div${addAttribute(["pricing-catalog-grid", !isFull && "pricing-preview-cards"], "class:list")} data-astro-cid-rkwsnyfo> ${group.programs.map((program) => renderTemplate`<article class="pricing-card"${addAttribute(program.id, "data-package-id")} data-astro-cid-rkwsnyfo> <p class="pricing-card-duration" data-astro-cid-rkwsnyfo>${program.duration}</p> ${isFull ? renderTemplate`<h4 data-astro-cid-rkwsnyfo>${program.title}</h4>` : renderTemplate`<h3 data-astro-cid-rkwsnyfo>${program.shortTitle}</h3>`} <p class="pricing-card-description" data-astro-cid-rkwsnyfo>${program.description}</p> ${isFull && program.includes.length > 0 && renderTemplate`<ul class="pricing-card-includes"${addAttribute(`Ce include programul ${program.title}, ${program.duration}`, "aria-label")} data-astro-cid-rkwsnyfo> ${program.includes.map((item) => renderTemplate`<li data-astro-cid-rkwsnyfo>${item}</li>`)} </ul>`} <p class="pricing-card-price" data-astro-cid-rkwsnyfo> <strong data-astro-cid-rkwsnyfo>${program.price}</strong> <span data-astro-cid-rkwsnyfo>lei</span> </p> <p class="pricing-card-note" data-astro-cid-rkwsnyfo>Preț pentru durata indicată</p> ${isFull && renderTemplate`<a class="pricing-card-cta"${addAttribute(`https://wa.me/40763795919?text=${whatsappText}`, "href")} target="_blank" rel="noopener noreferrer" data-astro-cid-rkwsnyfo>
Verifică disponibilitatea
</a>`} </article>`)} </div> </div>`)} ${isFull ? renderTemplate`<div class="pricing-catalog-footer" data-astro-cid-rkwsnyfo> <p data-astro-cid-rkwsnyfo>Disponibilitatea, deplasarea și eventualele opțiuni suplimentare se confirmă înainte de rezervare, în funcție de data și locația evenimentului.</p> <a${addAttribute(`https://wa.me/40763795919?text=${whatsappText}`, "href")} target="_blank" rel="noopener noreferrer" data-astro-cid-rkwsnyfo>
Cere recomandarea potrivită
</a> </div>` : renderTemplate`<p class="pricing-catalog-link-wrap" data-astro-cid-rkwsnyfo> <a href="/preturi-animatori-copii-bucuresti/" data-astro-cid-rkwsnyfo>Vezi toate programele și prețurile</a> </p>`} </div> </section>`;
}, "/opt/kassia-site/src/components/KassiaPricingCatalog.astro", void 0);

var __freeze = Object.freeze;
var __defProp = Object.defineProperty;
var __template = (cooked, raw) => __freeze(__defProp(cooked, "raw", { value: __freeze(raw || cooked.slice()) }));
var _a;
const $$CostumeCatalog = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$CostumeCatalog;
  const { heading, subheading, cards = [] } = Astro2.props;
  const isFullCatalog = cards.length > 12;
  const { data: configRows } = await supabase.from("kassia_site_config").select("key,value");
  const config = Object.fromEntries(configRows?.map((row) => [row.key, row.value]) || []);
  const phone = config.phone || "0763795919";
  const phoneClean = phone.replace(/[^0-9]/g, "");
  const whatsappNumber = phoneClean.startsWith("0") ? "4" + phoneClean : phoneClean;
  return renderTemplate(_a || (_a = __template(["", '<section id="catalog-costume" class="catalog-section bg-white" data-astro-cid-v4rlkyg3> <div class="container" data-astro-cid-v4rlkyg3> <h2 class="section-heading text-center" data-astro-cid-v4rlkyg3>', "</h2> ", ' <div class="catalog-search-sticky-container" style="position: sticky; top: 0px; z-index: 1001; background: rgba(255, 255, 255, 0.95); backdrop-filter: blur(10px); padding: 1rem 0; margin-bottom: 2rem; border-bottom: 1px solid rgba(168, 85, 247, 0.1);" data-astro-cid-v4rlkyg3> <div class="catalog-search-wrapper" style="width: 100%; max-width: 600px; margin: 0 auto; padding: 0 1rem; box-sizing: border-box;" data-astro-cid-v4rlkyg3> <div class="search-input-container" style="position: relative; width: 100%;" data-astro-cid-v4rlkyg3> <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="position: absolute; left: 1.2rem; top: 50%; transform: translateY(-50%); color: var(--text-muted);" data-astro-cid-v4rlkyg3><circle cx="11" cy="11" r="8" data-astro-cid-v4rlkyg3></circle><line x1="21" y1="21" x2="16.65" y2="16.65" data-astro-cid-v4rlkyg3></line></svg> <input type="text" id="catalog-search" placeholder="Caută personajul preferat..." style="width: 100%; box-sizing: border-box; padding: 1.1rem 1rem 1.1rem 3.2rem; border-radius: 99px; border: 2px solid #e2e8f0; font-size: 1.05rem; outline: none; transition: border-color 0.2s, box-shadow 0.2s; color: var(--text-main); background: #fff; box-shadow: 0 4px 15px rgba(0,0,0,0.05);" data-astro-cid-v4rlkyg3> </div> </div> </div> <div class="catalog-grid" id="catalog-grid-container" data-astro-cid-v4rlkyg3> ', ' </div> <div id="catalog-no-results" style="display: none; text-align: center; padding: 4rem 1rem; background: #f8fafc; border-radius: 16px; margin: 2rem 0;" data-astro-cid-v4rlkyg3> <div style="font-size: 3.5rem; margin-bottom: 1rem;" data-astro-cid-v4rlkyg3>👀</div> <h3 style="font-size: 1.5rem; color: var(--text-main); margin-bottom: 0.5rem; font-weight: 800;" data-astro-cid-v4rlkyg3>Nu am găsit exact acest personaj...</h3> <p style="color: var(--text-muted); font-size: 1.05rem; margin-bottom: 2rem;" data-astro-cid-v4rlkyg3>Dar s-ar putea să-ți placă personajele noastre cele mai iubite:</p> </div> <div class="text-center mt-4 pt-4" data-astro-cid-v4rlkyg3> ', ` </div> </div> </section> <script>
  (function() {
      function normalizeText(text) {
        if(!text) return "";
        return text.normalize("NFD").replace(/[\\u0300-\\u036f]/g, "").toLowerCase().replace(/[^a-z0-9\\s]/g, " ").replace(/\\s+/g, " ").trim();
      }

      function getPhoneticQuery(qw) {
         const phonetics = {
            'betmen': 'batman',
            'spaidarman': 'spiderman',
            'spaidar': 'spiderman',
            'michi': 'mickey',
            'maus': 'mouse',
            'maichi': 'mickey',
            'elza': 'elsa',
            'stici': 'stitch',
            'peis': 'paw',
            'patrol': 'patrol',
            'pepa': 'peppa',
            'pipa': 'peppa',
            'halouin': 'halloween',
            'kreciun': 'craciun',
            'mosu': 'mos'
         };
         return phonetics[qw] || qw;
      }

      function getSemanticKeywords(title) {
         const t = title.toLowerCase();
         let kw = "";
         if (/(elsa|anna|rapunzel|ariel|alba ca zapada|cenusareasa|aurora|belle|jasmine|merida|tiana|moana|barbie|unicorn)/.test(t)) {
            kw += " fata fete fetita fetite printesa printese regat roz magie ";
         }
         if (/(spiderman|batman|superman|ironman|hulk|captain america|thor|sonic|transformers|optimus|bumblebee|ninja|dinozaur)/.test(t)) {
            kw += " baiat baieti erou eroi supererou putere actiune ";
         }
         return kw;
      }

      function levenshteinDistance(a, b) {
        const matrix = [];
        for (let i = 0; i <= b.length; i++) {
          matrix[i] = [i];
        }
        for (let j = 0; j <= a.length; j++) {
          matrix[0][j] = j;
        }
        for (let i = 1; i <= b.length; i++) {
          for (let j = 1; j <= a.length; j++) {
            if (b.charAt(i - 1) == a.charAt(j - 1)) {
              matrix[i][j] = matrix[i - 1][j - 1];
            } else {
              matrix[i][j] = Math.min(matrix[i - 1][j - 1] + 1, Math.min(matrix[i][j - 1] + 1, matrix[i - 1][j] + 1));
            }
          }
        }
        return matrix[b.length][a.length];
      }

      function initCostumeSearch() {
         const searchContainer = document.querySelector('.catalog-search-sticky-container');
         const header = document.querySelector('.site-header');
         const catalogSection = document.getElementById('catalog-costume');
         
         if (header && searchContainer) {
             header.appendChild(searchContainer);
             searchContainer.style.position = 'static';
             searchContainer.style.padding = '0.5rem 0 1rem 0';
             searchContainer.style.marginBottom = '0';
             searchContainer.style.borderBottom = 'none';
         }

         const loadMoreBtn = document.getElementById('load-more-btn');
         const searchInput = document.getElementById('catalog-search');
         const cards = Array.from(document.querySelectorAll('.catalog-card'));
         const gridContainer = document.getElementById('catalog-grid-container');

         let currentlyLoaded = 12;

         function applyVisibility() {
           const rawQuery = searchInput ? searchInput.value : '';
           const q = normalizeText(rawQuery);
           const stopwords = ["si", "de", "cu", "la", "pentru", "vreau", "as", "vrea", "doresc", "imi", "trebuie", "un", "o", "niste", "din", "in", "pe", "ca", "sa", "sunt", "este", "au", "caut", "cautam", "avem", "ne", "ar", "interesa"];
           
           let queryWords = q.split(' ').filter(w => w.length > 0 && !stopwords.includes(w));
           queryWords = queryWords.map(qw => getPhoneticQuery(qw));
           
           if (queryWords.length > 0 && catalogSection) {
              const rect = catalogSection.getBoundingClientRect();
              if (rect.top > 200) {
                  window.scrollTo({
                      top: catalogSection.offsetTop - 140,
                      behavior: 'smooth'
                  });
              }
           }
           
           const MIN_SCORE_TO_SHOW_RESULTS = 20;
           let scoredCards = [];

           cards.forEach((card, idx) => {
             const rawTitle = card.getAttribute('data-title') || '';
             const rawDesc = card.getAttribute('data-desc') || '';
             
             const nTitle = normalizeText(rawTitle);
             const nDesc = normalizeText(rawDesc);
             const semanticKw = normalizeText(getSemanticKeywords(rawTitle));

             let score = 0;
             let isMatch = false;

             if (queryWords.length === 0 && q.length === 0) {
                isMatch = true;
                score = 100;
             } else if (queryWords.length === 0 && q.length > 0) {
                isMatch = false;
                score = 0;
             } else {
                const cardWords = [...nTitle.split(' '), ...nDesc.split(' '), ...semanticKw.split(' ')].filter(w=>w.length > 0);

                queryWords.forEach(qw => {
                    let bestWordScore = 0;

                    if (qw.length >= 3) {
                        if (nTitle.includes(qw)) bestWordScore = Math.max(bestWordScore, 50);
                        else if (nDesc.includes(qw)) bestWordScore = Math.max(bestWordScore, 30);
                        else if (semanticKw.includes(qw)) bestWordScore = Math.max(bestWordScore, 25);
                    } else {
                        if (cardWords.includes(qw)) bestWordScore = Math.max(bestWordScore, 50);
                        else if (qw.length >= 2 && cardWords.some(w => w.startsWith(qw))) bestWordScore = Math.max(bestWordScore, 30);
                    }

                    if (bestWordScore > 0) {
                        score += bestWordScore;
                    } else {
                        for(let i=0; i<cardWords.length; i++) {
                            let cw = cardWords[i];
                            if (cw === qw || (qw.length >= 3 && cw.includes(qw)) || (cw.length >= 4 && qw.includes(cw)) || (qw.length >= 2 && cw.startsWith(qw))) {
                                score += 20;
                                break;
                            }
                            if (qw.length >= 3 && cw.length >= 3) {
                                let dist = levenshteinDistance(qw, cw);
                                let maxLen = Math.max(qw.length, cw.length);
                                let ratio = dist / maxLen;
                                if ( (dist <= 1 || (qw.length >= 5 && dist <= 2 && ratio <= 0.3)) && (qw[0] === cw[0] || dist <= 1) ) {
                                    score += 20;
                                    break;
                                }
                            }
                        }
                    }
                });

                isMatch = score >= MIN_SCORE_TO_SHOW_RESULTS;
             }

             if (queryWords.length > 0) {
               if (isMatch) {
                 scoredCards.push({ card, score, originalIdx: idx });
               } else {
                 card.style.display = 'none';
               }
             } else {
               if (idx < currentlyLoaded) {
                 card.style.display = 'flex';
               } else {
                 card.style.display = 'none';
               }
             }
           });

           const noResultsEl = document.getElementById('catalog-no-results');

           if (queryWords.length > 0) {
             scoredCards.sort((a, b) => b.score - a.score);
             
             if (scoredCards.length === 0) {
                if (noResultsEl) noResultsEl.style.display = 'block';
                let fallbackShown = 0;
                cards.forEach(card => {
                   const title = card.getAttribute('data-title') || '';
                   if (fallbackShown < 4 && (title === 'elsa' || title === 'spiderman' || title === 'skye (patrula catelusilor)' || title.includes('mickey'))) {
                       card.style.display = 'flex';
                       gridContainer.appendChild(card);
                       fallbackShown++;
                   } else {
                       card.style.display = 'none';
                   }
                });
             } else {
                if (noResultsEl) noResultsEl.style.display = 'none';
                scoredCards.forEach(sc => {
                    sc.card.style.display = 'flex';
                    gridContainer.appendChild(sc.card);
                });
             }
           } else {
             if (noResultsEl) noResultsEl.style.display = 'none';
             const sortedByIndex = cards.slice().sort((a, b) => {
                const idxA = cards.indexOf(a);
                const idxB = cards.indexOf(b);
                return idxA - idxB;
             });
             sortedByIndex.forEach(c => gridContainer.appendChild(c));
           }

           if (loadMoreBtn) {
             if (queryWords.length > 0) {
               loadMoreBtn.style.display = 'none';
             } else {
               if (currentlyLoaded < cards.length) {
                 loadMoreBtn.style.display = 'inline-block';
               } else {
                 loadMoreBtn.style.display = 'none';
               }
             }
           }
         }

         if (searchInput) {
           searchInput.addEventListener('input', applyVisibility);
         }

         if (loadMoreBtn) {
           loadMoreBtn.addEventListener('click', () => {
             currentlyLoaded += 12;
             applyVisibility();
           });
         }
      }

      initCostumeSearch();
      setTimeout(initCostumeSearch, 100);
      setTimeout(initCostumeSearch, 500);
  })();
<\/script>`], ["", '<section id="catalog-costume" class="catalog-section bg-white" data-astro-cid-v4rlkyg3> <div class="container" data-astro-cid-v4rlkyg3> <h2 class="section-heading text-center" data-astro-cid-v4rlkyg3>', "</h2> ", ' <div class="catalog-search-sticky-container" style="position: sticky; top: 0px; z-index: 1001; background: rgba(255, 255, 255, 0.95); backdrop-filter: blur(10px); padding: 1rem 0; margin-bottom: 2rem; border-bottom: 1px solid rgba(168, 85, 247, 0.1);" data-astro-cid-v4rlkyg3> <div class="catalog-search-wrapper" style="width: 100%; max-width: 600px; margin: 0 auto; padding: 0 1rem; box-sizing: border-box;" data-astro-cid-v4rlkyg3> <div class="search-input-container" style="position: relative; width: 100%;" data-astro-cid-v4rlkyg3> <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="position: absolute; left: 1.2rem; top: 50%; transform: translateY(-50%); color: var(--text-muted);" data-astro-cid-v4rlkyg3><circle cx="11" cy="11" r="8" data-astro-cid-v4rlkyg3></circle><line x1="21" y1="21" x2="16.65" y2="16.65" data-astro-cid-v4rlkyg3></line></svg> <input type="text" id="catalog-search" placeholder="Caută personajul preferat..." style="width: 100%; box-sizing: border-box; padding: 1.1rem 1rem 1.1rem 3.2rem; border-radius: 99px; border: 2px solid #e2e8f0; font-size: 1.05rem; outline: none; transition: border-color 0.2s, box-shadow 0.2s; color: var(--text-main); background: #fff; box-shadow: 0 4px 15px rgba(0,0,0,0.05);" data-astro-cid-v4rlkyg3> </div> </div> </div> <div class="catalog-grid" id="catalog-grid-container" data-astro-cid-v4rlkyg3> ', ' </div> <div id="catalog-no-results" style="display: none; text-align: center; padding: 4rem 1rem; background: #f8fafc; border-radius: 16px; margin: 2rem 0;" data-astro-cid-v4rlkyg3> <div style="font-size: 3.5rem; margin-bottom: 1rem;" data-astro-cid-v4rlkyg3>👀</div> <h3 style="font-size: 1.5rem; color: var(--text-main); margin-bottom: 0.5rem; font-weight: 800;" data-astro-cid-v4rlkyg3>Nu am găsit exact acest personaj...</h3> <p style="color: var(--text-muted); font-size: 1.05rem; margin-bottom: 2rem;" data-astro-cid-v4rlkyg3>Dar s-ar putea să-ți placă personajele noastre cele mai iubite:</p> </div> <div class="text-center mt-4 pt-4" data-astro-cid-v4rlkyg3> ', ` </div> </div> </section> <script>
  (function() {
      function normalizeText(text) {
        if(!text) return "";
        return text.normalize("NFD").replace(/[\\\\u0300-\\\\u036f]/g, "").toLowerCase().replace(/[^a-z0-9\\\\s]/g, " ").replace(/\\\\s+/g, " ").trim();
      }

      function getPhoneticQuery(qw) {
         const phonetics = {
            'betmen': 'batman',
            'spaidarman': 'spiderman',
            'spaidar': 'spiderman',
            'michi': 'mickey',
            'maus': 'mouse',
            'maichi': 'mickey',
            'elza': 'elsa',
            'stici': 'stitch',
            'peis': 'paw',
            'patrol': 'patrol',
            'pepa': 'peppa',
            'pipa': 'peppa',
            'halouin': 'halloween',
            'kreciun': 'craciun',
            'mosu': 'mos'
         };
         return phonetics[qw] || qw;
      }

      function getSemanticKeywords(title) {
         const t = title.toLowerCase();
         let kw = "";
         if (/(elsa|anna|rapunzel|ariel|alba ca zapada|cenusareasa|aurora|belle|jasmine|merida|tiana|moana|barbie|unicorn)/.test(t)) {
            kw += " fata fete fetita fetite printesa printese regat roz magie ";
         }
         if (/(spiderman|batman|superman|ironman|hulk|captain america|thor|sonic|transformers|optimus|bumblebee|ninja|dinozaur)/.test(t)) {
            kw += " baiat baieti erou eroi supererou putere actiune ";
         }
         return kw;
      }

      function levenshteinDistance(a, b) {
        const matrix = [];
        for (let i = 0; i <= b.length; i++) {
          matrix[i] = [i];
        }
        for (let j = 0; j <= a.length; j++) {
          matrix[0][j] = j;
        }
        for (let i = 1; i <= b.length; i++) {
          for (let j = 1; j <= a.length; j++) {
            if (b.charAt(i - 1) == a.charAt(j - 1)) {
              matrix[i][j] = matrix[i - 1][j - 1];
            } else {
              matrix[i][j] = Math.min(matrix[i - 1][j - 1] + 1, Math.min(matrix[i][j - 1] + 1, matrix[i - 1][j] + 1));
            }
          }
        }
        return matrix[b.length][a.length];
      }

      function initCostumeSearch() {
         const searchContainer = document.querySelector('.catalog-search-sticky-container');
         const header = document.querySelector('.site-header');
         const catalogSection = document.getElementById('catalog-costume');
         
         if (header && searchContainer) {
             header.appendChild(searchContainer);
             searchContainer.style.position = 'static';
             searchContainer.style.padding = '0.5rem 0 1rem 0';
             searchContainer.style.marginBottom = '0';
             searchContainer.style.borderBottom = 'none';
         }

         const loadMoreBtn = document.getElementById('load-more-btn');
         const searchInput = document.getElementById('catalog-search');
         const cards = Array.from(document.querySelectorAll('.catalog-card'));
         const gridContainer = document.getElementById('catalog-grid-container');

         let currentlyLoaded = 12;

         function applyVisibility() {
           const rawQuery = searchInput ? searchInput.value : '';
           const q = normalizeText(rawQuery);
           const stopwords = ["si", "de", "cu", "la", "pentru", "vreau", "as", "vrea", "doresc", "imi", "trebuie", "un", "o", "niste", "din", "in", "pe", "ca", "sa", "sunt", "este", "au", "caut", "cautam", "avem", "ne", "ar", "interesa"];
           
           let queryWords = q.split(' ').filter(w => w.length > 0 && !stopwords.includes(w));
           queryWords = queryWords.map(qw => getPhoneticQuery(qw));
           
           if (queryWords.length > 0 && catalogSection) {
              const rect = catalogSection.getBoundingClientRect();
              if (rect.top > 200) {
                  window.scrollTo({
                      top: catalogSection.offsetTop - 140,
                      behavior: 'smooth'
                  });
              }
           }
           
           const MIN_SCORE_TO_SHOW_RESULTS = 20;
           let scoredCards = [];

           cards.forEach((card, idx) => {
             const rawTitle = card.getAttribute('data-title') || '';
             const rawDesc = card.getAttribute('data-desc') || '';
             
             const nTitle = normalizeText(rawTitle);
             const nDesc = normalizeText(rawDesc);
             const semanticKw = normalizeText(getSemanticKeywords(rawTitle));

             let score = 0;
             let isMatch = false;

             if (queryWords.length === 0 && q.length === 0) {
                isMatch = true;
                score = 100;
             } else if (queryWords.length === 0 && q.length > 0) {
                isMatch = false;
                score = 0;
             } else {
                const cardWords = [...nTitle.split(' '), ...nDesc.split(' '), ...semanticKw.split(' ')].filter(w=>w.length > 0);

                queryWords.forEach(qw => {
                    let bestWordScore = 0;

                    if (qw.length >= 3) {
                        if (nTitle.includes(qw)) bestWordScore = Math.max(bestWordScore, 50);
                        else if (nDesc.includes(qw)) bestWordScore = Math.max(bestWordScore, 30);
                        else if (semanticKw.includes(qw)) bestWordScore = Math.max(bestWordScore, 25);
                    } else {
                        if (cardWords.includes(qw)) bestWordScore = Math.max(bestWordScore, 50);
                        else if (qw.length >= 2 && cardWords.some(w => w.startsWith(qw))) bestWordScore = Math.max(bestWordScore, 30);
                    }

                    if (bestWordScore > 0) {
                        score += bestWordScore;
                    } else {
                        for(let i=0; i<cardWords.length; i++) {
                            let cw = cardWords[i];
                            if (cw === qw || (qw.length >= 3 && cw.includes(qw)) || (cw.length >= 4 && qw.includes(cw)) || (qw.length >= 2 && cw.startsWith(qw))) {
                                score += 20;
                                break;
                            }
                            if (qw.length >= 3 && cw.length >= 3) {
                                let dist = levenshteinDistance(qw, cw);
                                let maxLen = Math.max(qw.length, cw.length);
                                let ratio = dist / maxLen;
                                if ( (dist <= 1 || (qw.length >= 5 && dist <= 2 && ratio <= 0.3)) && (qw[0] === cw[0] || dist <= 1) ) {
                                    score += 20;
                                    break;
                                }
                            }
                        }
                    }
                });

                isMatch = score >= MIN_SCORE_TO_SHOW_RESULTS;
             }

             if (queryWords.length > 0) {
               if (isMatch) {
                 scoredCards.push({ card, score, originalIdx: idx });
               } else {
                 card.style.display = 'none';
               }
             } else {
               if (idx < currentlyLoaded) {
                 card.style.display = 'flex';
               } else {
                 card.style.display = 'none';
               }
             }
           });

           const noResultsEl = document.getElementById('catalog-no-results');

           if (queryWords.length > 0) {
             scoredCards.sort((a, b) => b.score - a.score);
             
             if (scoredCards.length === 0) {
                if (noResultsEl) noResultsEl.style.display = 'block';
                let fallbackShown = 0;
                cards.forEach(card => {
                   const title = card.getAttribute('data-title') || '';
                   if (fallbackShown < 4 && (title === 'elsa' || title === 'spiderman' || title === 'skye (patrula catelusilor)' || title.includes('mickey'))) {
                       card.style.display = 'flex';
                       gridContainer.appendChild(card);
                       fallbackShown++;
                   } else {
                       card.style.display = 'none';
                   }
                });
             } else {
                if (noResultsEl) noResultsEl.style.display = 'none';
                scoredCards.forEach(sc => {
                    sc.card.style.display = 'flex';
                    gridContainer.appendChild(sc.card);
                });
             }
           } else {
             if (noResultsEl) noResultsEl.style.display = 'none';
             const sortedByIndex = cards.slice().sort((a, b) => {
                const idxA = cards.indexOf(a);
                const idxB = cards.indexOf(b);
                return idxA - idxB;
             });
             sortedByIndex.forEach(c => gridContainer.appendChild(c));
           }

           if (loadMoreBtn) {
             if (queryWords.length > 0) {
               loadMoreBtn.style.display = 'none';
             } else {
               if (currentlyLoaded < cards.length) {
                 loadMoreBtn.style.display = 'inline-block';
               } else {
                 loadMoreBtn.style.display = 'none';
               }
             }
           }
         }

         if (searchInput) {
           searchInput.addEventListener('input', applyVisibility);
         }

         if (loadMoreBtn) {
           loadMoreBtn.addEventListener('click', () => {
             currentlyLoaded += 12;
             applyVisibility();
           });
         }
      }

      initCostumeSearch();
      setTimeout(initCostumeSearch, 100);
      setTimeout(initCostumeSearch, 500);
  })();
<\/script>`])), maybeRenderHead(), heading, subheading && renderTemplate`<p class="catalog-subtitle text-center" data-astro-cid-v4rlkyg3>${subheading}</p>`, cards.map((card, idx) => renderTemplate`<div${addAttribute(`catalog-card ${idx >= 12 && isFullCatalog ? "hidden-card" : ""}`, "class")}${addAttribute(idx >= 12 && isFullCatalog ? "display: none;" : "", "style")}${addAttribute(card.title.toLowerCase(), "data-title")}${addAttribute(card.short_description.toLowerCase(), "data-desc")} data-astro-cid-v4rlkyg3> <div class="catalog-card-image" data-astro-cid-v4rlkyg3> <img${addAttribute(card.image_url, "src")}${addAttribute(card.alt_text || card.title, "alt")}${addAttribute(card.width || 600, "width")}${addAttribute(card.height || 600, "height")} loading="lazy" decoding="async" data-astro-cid-v4rlkyg3> </div> <div class="catalog-card-content" data-astro-cid-v4rlkyg3> <h3 class="catalog-card-title" data-astro-cid-v4rlkyg3>${card.title}</h3> <p class="catalog-card-desc" data-astro-cid-v4rlkyg3>${card.short_description}</p> <a${addAttribute(`https://wa.me/${whatsappNumber}?text=${encodeURIComponent("Bună! M-ar interesa costumul/personajul " + card.title + " din catalogul Kassia. Îmi puteți spune dacă este disponibil pentru data evenimentului?")}`, "href")} target="_blank" rel="noopener" class="catalog-card-cta"${addAttribute(`Verifică disponibilitatea pentru ${card.title} pe WhatsApp`, "aria-label")} data-astro-cid-v4rlkyg3>Verifică disponibilitatea &rarr;</a> </div> </div>`), isFullCatalog ? renderTemplate`<button id="load-more-btn" class="btn-primary" style="display: inline-block; padding: 1rem 2rem; border-radius: 99px; font-weight: 700; background: var(--primary); color: white; border: none; cursor: pointer; transition: transform 0.2s;" data-astro-cid-v4rlkyg3>
Încarcă mai multe costume
</button>` : renderTemplate`<a href="/catalog-costume/" class="btn-primary" style="display: inline-block; padding: 1rem 2rem; border-radius: 99px; font-weight: 700; background: var(--primary); color: white; text-decoration: none; transition: transform 0.2s;" data-astro-cid-v4rlkyg3>
Vezi catalogul complet de costume
</a>`);
}, "/opt/kassia-site/src/components/CostumeCatalog.astro", void 0);

const $$Breadcrumbs = createComponent(($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$Breadcrumbs;
  const { path, title } = Astro2.props;
  const pathSegments = path.split("/").filter(Boolean);
  const breadcrumbs = [];
  breadcrumbs.push({ name: "Acasă", url: "/" });
  let currentUrl = "";
  pathSegments.forEach((segment, index) => {
    currentUrl += `/${segment}`;
    const isLast = index === pathSegments.length - 1;
    const segmentName = isLast ? title : segment.replace(/-/g, " ");
    breadcrumbs.push({
      name: segmentName.charAt(0).toUpperCase() + segmentName.slice(1),
      url: isLast ? null : `${currentUrl}/`
    });
  });
  return renderTemplate`${maybeRenderHead()}<nav aria-label="Breadcrumb" class="breadcrumbs" data-astro-cid-ilhxcym7> <div class="container" data-astro-cid-ilhxcym7> <ol data-astro-cid-ilhxcym7> ${breadcrumbs.map((crumb, index) => renderTemplate`<li${addAttribute(!crumb.url ? "current" : "", "class")} data-astro-cid-ilhxcym7> ${crumb.url ? renderTemplate`<a${addAttribute(crumb.url, "href")} data-astro-cid-ilhxcym7>${crumb.name}</a>` : renderTemplate`<span aria-current="page" data-astro-cid-ilhxcym7>${crumb.name}</span>`} ${index < breadcrumbs.length - 1 && renderTemplate`<span class="separator" data-astro-cid-ilhxcym7>›</span>`} </li>`)} </ol> </div> </nav>`;
}, "/opt/kassia-site/src/components/Breadcrumbs.astro", void 0);

const $$ = createComponent(async ($$result, $$props, $$slots) => {
  const Astro2 = $$result.createAstro($$props, $$slots);
  Astro2.self = $$;
  const currentPath = Astro2.url.pathname;
  const redirectTarget = getLegacyRedirect(currentPath);
  if (redirectTarget) {
    return Astro2.redirect(appendSearch(redirectTarget, Astro2.url.search), 301);
  }
  if (isKnownGonePath(currentPath)) {
    Astro2.response.status = 410;
    return Astro2.rewrite("/410");
  }
  const path = normalizeRequestPath(currentPath);
  if (!path) {
    Astro2.response.status = 404;
    return Astro2.rewrite("/404");
  }
  if (isReservedFileRoute(path) && path !== currentPath) {
    return Astro2.redirect(appendSearch(path, Astro2.url.search), 301);
  }
  if (isFileLikePath(path)) {
    Astro2.response.status = 404;
    return Astro2.rewrite("/404");
  }
  const { data: page, error: pageError } = await supabase.from("kassia_pages").select("id,path,slug,page_type,title,h1,meta_title,meta_description,canonical_url,status,index_status,include_in_sitemap,priority,updated_at,show_pricing_preview").eq("path", path).maybeSingle();
  if (pageError) {
    console.error("KASSIA_PAGE_LOOKUP_FAILED", {
      code: pageError.code || "UNKNOWN",
      path
    });
    Astro2.response.status = 503;
    return Astro2.rewrite("/503");
  }
  if (!page) {
    Astro2.response.status = 404;
    return Astro2.rewrite("/404");
  }
  if (isGonePageStatus(page.status) && true) {
    Astro2.response.status = 410;
    return Astro2.rewrite("/410");
  }
  if (page.status !== "published" && true) {
    Astro2.response.status = 404;
    return Astro2.rewrite("/404");
  }
  if (path !== currentPath) {
    return Astro2.redirect(appendSearch(path, Astro2.url.search), 301);
  }
  const showCanonicalPricing = shouldShowCanonicalPricing(page.slug, Boolean(page.show_pricing_preview));
  const showPreviewPricing = showCanonicalPricing && page.slug !== PRICING_PAGE_SLUG;
  const secondaryResults = await Promise.all([
    supabase.from("kassia_page_sections").select("id,section_type,heading,content,order_index").eq("page_id", page.id).order("order_index", { ascending: true }),
    supabase.from("kassia_internal_links").select("id,source_page_id,target_page_id,anchor_text,target_page:kassia_pages!target_page_id(path,status)").eq("source_page_id", page.id),
    supabase.from("kassia_site_config").select("key,value"),
    supabase.from("kassia_faqs").select("id,question,answer,order_index").eq("page_id", page.id).order("order_index", { ascending: true }),
    supabase.from("kassia_gallery_items").select("id,url,alt_text,order_index").eq("page_id", page.id).order("order_index", { ascending: true })
  ]);
  const secondaryFailure = secondaryResults.find((result) => result.error);
  if (secondaryFailure) {
    console.error("KASSIA_SECONDARY_CONTENT_QUERY_FAILED", {
      code: secondaryFailure.error?.code || "UNKNOWN",
      path
    });
    return Astro2.rewrite("/503");
  }
  const [
    { data: rawSections },
    { data: internalLinks },
    { data: configRows },
    { data: faqs },
    { data: gallery }
  ] = secondaryResults;
  function rewriteLegacyInternalUrl(value) {
    if (typeof value !== "string" || value.trim() === "") return value;
    try {
      const parsed = new URL(value, SITE_ORIGIN);
      if (parsed.origin !== SITE_ORIGIN) return value;
      const target = getLegacyRedirect(parsed.pathname);
      if (!target) return value;
      const rewritten = `${target}${parsed.search}${parsed.hash}`;
      return /^https?:\/\//i.test(value) ? `${SITE_ORIGIN}${rewritten}` : rewritten;
    } catch {
      return value;
    }
  }
  function rewriteLegacyLinksInHtml(value) {
    if (typeof value !== "string" || !value.includes("href")) return value;
    return value.replace(/href\s*=\s*(["'])([^"']+)\1/gi, (match, quote, href) => {
      const rewritten = rewriteLegacyInternalUrl(href);
      return rewritten !== href ? `href=${quote}${rewritten}${quote}` : match;
    });
  }
  function normalizeSectionContent(content) {
    if (!content || typeof content !== "object" || Array.isArray(content)) return {};
    return {
      ...content,
      body: rewriteLegacyLinksInHtml(content.body),
      cta_url: rewriteLegacyInternalUrl(content.cta_url)
    };
  }
  function parseSectionContent(value) {
    if (value && typeof value === "object" && !Array.isArray(value)) return normalizeSectionContent(value);
    if (typeof value !== "string") return {};
    const trimmed = value.trim();
    if (!trimmed) return {};
    try {
      const parsed = JSON.parse(trimmed);
      return parsed && typeof parsed === "object" && !Array.isArray(parsed) ? normalizeSectionContent(parsed) : { body: rewriteLegacyLinksInHtml(trimmed) };
    } catch {
      return { body: rewriteLegacyLinksInHtml(trimmed) };
    }
  }
  const sections = (rawSections || []).map((section) => ({ ...section, content: parseSectionContent(section.content) })).filter((section) => section.content?.is_active !== false).filter((section) => !shouldSuppressLegacyPricingSection(section, showCanonicalPricing));
  const publishedLinks = internalLinks ? internalLinks.filter((link) => link.target_page && link.target_page.status === "published").map((link) => ({
    ...link,
    target_page: {
      ...link.target_page,
      path: rewriteLegacyInternalUrl(link.target_page.path)
    }
  })) : [];
  const robots = page.index_status === "index" ? "index, follow" : "noindex, follow";
  const siteUrl = SITE_ORIGIN;
  const canonical = buildSelfCanonical(path);
  const pageTitle = page.meta_title || page.title || page.h1 || "Kassia Events";
  const pageDescription = page.meta_description || "Servicii pentru petreceri și evenimente în București și Ilfov.";
  const animatoriSlugs = [
    "animatori-petreceri-copii",
    "animatori-petreceri-copii-bucuresti",
    "preturi-animatori-copii-bucuresti",
    "oferta-animatori-petreceri-copii-bucuresti",
    "personaje-animatori-copii-bucuresti",
    "animatori-tematici-petreceri-copii-bucuresti",
    "mascote-petreceri-copii-bucuresti",
    "pictura-pe-fata-copii-bucuresti",
    "modelaj-baloane-copii-bucuresti",
    "jocuri-interactive-copii-bucuresti",
    "mini-disco-copii-bucuresti",
    "animatori-copii"
  ];
  const isAnimatoriPage = animatoriSlugs.includes(page?.slug);
  const config = Object.fromEntries(configRows?.map((row) => [row.key, row.value]) || []);
  const phone = config.phone;
  const validFaqs = faqs?.filter((f) => f.question && f.answer && !f.question.startsWith("Draft FAQ") && f.answer !== "Placeholder") || [];
  const validImages = gallery?.filter((g) => g.url && g.url.trim() !== "") || [];
  const schemas = [];
  const localBusinessSchema = {
    "@context": "https://schema.org",
    "@type": "LocalBusiness",
    "@id": `${siteUrl}/#organization`,
    "name": "Kassia Events",
    "url": siteUrl,
    "logo": `${siteUrl}/logo.png`,
    "image": validImages.length > 0 ? validImages[0].url : void 0
  };
  if (phone) {
    localBusinessSchema.telephone = phone;
  }
  if (config && Object.keys(config).length > 0) {
    localBusinessSchema.address = {
      "@type": "PostalAddress",
      "addressRegion": "București & Ilfov",
      "addressCountry": "RO"
    };
  }
  schemas.push(localBusinessSchema);
  const sectorMatch = page?.slug?.match(/sector-([1-6])/);
  const schemaPricingPrograms = getSchemaPricingPrograms(page.slug, Boolean(page.show_pricing_preview));
  if (["service", "service_pillar", "event", "location", "satellite"].includes(page.page_type) || schemaPricingPrograms.length > 0) {
    let areaServed = "București & Ilfov";
    if (sectorMatch) {
      areaServed = `Sectorul ${sectorMatch[1]}, București`;
    }
    const serviceSchema = {
      "@context": "https://schema.org",
      "@type": "Service",
      "name": page.h1 || page.title,
      "provider": {
        "@id": `${siteUrl}/#organization`
      },
      "areaServed": areaServed
    };
    if (page.slug === "animatori-petreceri-copii" || String(page.slug || "").startsWith("animatori-petreceri-copii-sector-")) {
      serviceSchema.aggregateRating = {
        "@type": "AggregateRating",
        "ratingValue": "4.9",
        "reviewCount": "970"
      };
      serviceSchema.review = [
        {
          "@type": "Review",
          "author": { "@type": "Person", "name": "Andreea M." },
          "datePublished": "2017-05-12",
          "reviewRating": { "@type": "Rating", "ratingValue": "5" },
          "reviewBody": "Animatoarea Elsa a fost minunată, copiii au fost captivați de jocuri și dansuri pe tot parcursul petrecerii."
        },
        {
          "@type": "Review",
          "author": { "@type": "Person", "name": "Mihai C." },
          "datePublished": "2016-06-18",
          "reviewRating": { "@type": "Rating", "ratingValue": "5" },
          "reviewBody": "Spiderman a ținut toți băieții în priză cu concursuri și activități interactive super amuzante."
        },
        {
          "@type": "Review",
          "author": { "@type": "Person", "name": "Raluca I." },
          "datePublished": "2017-07-02",
          "reviewRating": { "@type": "Rating", "ratingValue": "5" },
          "reviewBody": "Pictura pe față a fost realizată cu mult talent și vopsele sigure pentru piele. Copiii au fost încântați!"
        }
      ];
      if (schemaPricingPrograms.length > 0) {
        serviceSchema.hasOfferCatalog = buildOfferCatalog(schemaPricingPrograms);
      }
    }
    if (!serviceSchema.hasOfferCatalog && schemaPricingPrograms.length > 0) {
      serviceSchema.hasOfferCatalog = buildOfferCatalog(schemaPricingPrograms);
    }
    schemas.push(serviceSchema);
  }
  if (validFaqs.length > 0) {
    schemas.push({
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": validFaqs.map((faq) => ({
        "@type": "Question",
        "name": faq.question,
        "acceptedAnswer": {
          "@type": "Answer",
          "text": faq.answer
        }
      }))
    });
  }
  const pathSegments = path.split("/").filter(Boolean);
  if (pathSegments.length > 0) {
    const itemListElement = pathSegments.map((segment, index) => ({
      "@type": "ListItem",
      "position": index + 1,
      "name": index === pathSegments.length - 1 ? page.h1 || page.title || segment.replace(/-/g, " ") : segment.replace(/-/g, " "),
      "item": `${siteUrl}/${pathSegments.slice(0, index + 1).join("/")}/`
    }));
    schemas.push({
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": itemListElement
    });
  }
  const ogImage = validImages.length > 0 ? validImages[0].url : void 0;
  const whatsappText = `Buna! As dori detalii despre ${page.h1 || page.title || "serviciile voastre"}.`;
  const phoneClean = (config.phone || "0763795919").replace(/[^0-9]/g, "");
  const whatsappNumber = phoneClean.startsWith("0") ? "4" + phoneClean : phoneClean;
  const defaultWaUrl = `https://wa.me/${whatsappNumber}?text=${encodeURIComponent(whatsappText)}`;
  function getCtaUrl(url) {
    if (!url || url === "#" || url === "" || url === "/contact" || url === "/contact/") {
      return defaultWaUrl;
    }
    return rewriteLegacyInternalUrl(url);
  }
  return renderTemplate`${renderComponent($$result, "Layout", $$Layout, { "title": pageTitle, "description": pageDescription, "canonical": canonical, "robots": robots, "schemas": schemas, "ogImage": ogImage, "isAnimatori": isAnimatoriPage, "data-astro-cid-fzx4jmue": true }, { "default": async ($$result2) => renderTemplate` ${maybeRenderHead()}<div class="kassia-premium-page" data-astro-cid-fzx4jmue> ${renderComponent($$result2, "Breadcrumbs", $$Breadcrumbs, { "path": path, "title": page.h1 || page.title || "", "data-astro-cid-fzx4jmue": true })}  ${(() => {
    const heroSec = sections?.find((s) => s.section_type === "hero");
    const hasBody = typeof heroSec?.content?.body === "string" && heroSec.content.body.trim() !== "";
    return renderTemplate`<header${addAttribute(`hero-section ${heroSec?.content?.image_url ? "has-image" : ""}`, "class")} data-astro-cid-fzx4jmue> <div class="hero-overlay" data-astro-cid-fzx4jmue></div> <div class="container hero-content-wrapper" data-astro-cid-fzx4jmue> <div class="hero-text-content" data-astro-cid-fzx4jmue> <h1 class="page-title" data-astro-cid-fzx4jmue>${page.h1 || page.title}</h1> ${hasBody ? renderTemplate`${renderComponent($$result2, "Fragment", Fragment, { "data-astro-cid-fzx4jmue": true }, { "default": async ($$result3) => renderTemplate` <div class="hero-subtitle" data-astro-cid-fzx4jmue>${unescapeHTML(heroSec.content.body)}</div> ${heroSec.content?.cta_text && renderTemplate`<a${addAttribute(getCtaUrl(heroSec.content?.cta_url), "href")} class="btn-primary" style="margin-top:2rem; display:inline-block;" data-astro-cid-fzx4jmue> ${heroSec.content.cta_text} </a>`}` })}` : renderTemplate`${renderComponent($$result2, "Fragment", Fragment, { "data-astro-cid-fzx4jmue": true }, { "default": async ($$result3) => renderTemplate`${page.meta_description && renderTemplate`<p class="hero-subtitle" data-astro-cid-fzx4jmue>${page.meta_description}</p>`}` })}`} </div> ${heroSec?.content?.image_url && renderTemplate`<div class="hero-image-wrapper" data-astro-cid-fzx4jmue> <img${addAttribute(heroSec.content.image_url, "src")}${addAttribute(page.h1 || page.title || "Kassia Events", "alt")} class="hero-image" width="1200" height="800" loading="eager" fetchpriority="high" decoding="sync" data-astro-cid-fzx4jmue> </div>`} </div> </header>`;
  })()}  ${sections && sections.some((s) => s.section_type === "feature_card") && renderTemplate`<section class="feature-cards-section bg-light" style="padding: 4rem 0;" data-astro-cid-fzx4jmue> <div class="container" data-astro-cid-fzx4jmue> <div class="service-cards-grid" style="margin-top: 0;" data-astro-cid-fzx4jmue> ${sections.filter((s) => s.section_type === "feature_card").map((card) => renderTemplate`<div class="service-card" data-astro-cid-fzx4jmue> <div class="service-card-image-natural" style="position: relative; width: 100%; overflow: hidden;" data-astro-cid-fzx4jmue> ${card.content?.image_url && card.content.image_url.trim() !== "" && renderTemplate`<img${addAttribute(card.content.image_url, "src")}${addAttribute(card.content?.image_alt || "Card vizual Kassia", "alt")} width="800" height="800" loading="lazy" decoding="async" style="width: 100%; height: auto; display: block;" data-astro-cid-fzx4jmue>`} <div class="service-card-overlay" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: linear-gradient(to top, rgba(0,0,0,0.4) 0%, transparent 50%);" data-astro-cid-fzx4jmue></div> </div> <div class="service-card-content" data-astro-cid-fzx4jmue> <h3 class="service-card-title" data-astro-cid-fzx4jmue>${card.heading}</h3> ${card.content?.body && renderTemplate`<div class="service-card-subtitle prose" style="font-size:0.95rem; line-height:1.5;" data-astro-cid-fzx4jmue>${unescapeHTML(card.content.body)}</div>`} ${card.content?.cta_text && renderTemplate`<a${addAttribute(getCtaUrl(card.content?.cta_url), "href")} class="service-card-cta" style="margin-top: auto; display:inline-block; padding-top:1rem;" data-astro-cid-fzx4jmue>${card.content.cta_text} &rarr;</a>`} </div> </div>`)} </div> </div> </section>`}  ${sections && sections.filter((s) => s.section_type === "service_card").length > 0 && renderTemplate`<section class="service-cards-section bg-white" data-astro-cid-fzx4jmue> <div class="container" data-astro-cid-fzx4jmue> <h2 class="section-heading text-center" data-astro-cid-fzx4jmue>Alege Serviciul Dorit</h2> <div class="service-cards-grid" data-astro-cid-fzx4jmue> ${sections.filter((s) => s.section_type === "service_card").map((card) => renderTemplate`<a${addAttribute(getCtaUrl(card.content?.cta_url), "href")} class="service-card-link" data-astro-cid-fzx4jmue> <div class="service-card" data-astro-cid-fzx4jmue> <div class="service-card-image" data-astro-cid-fzx4jmue> ${card.content?.image_url && card.content.image_url.trim() !== "" && renderTemplate`<img${addAttribute(card.content.image_url, "src")}${addAttribute(card.content?.image_alt || "Activitate pentru petreceri de copii", "alt")} width="800" height="800" loading="lazy" decoding="async" data-astro-cid-fzx4jmue>`} <div class="service-card-overlay" data-astro-cid-fzx4jmue></div> </div> <div class="service-card-content" data-astro-cid-fzx4jmue> <h3 class="service-card-title" data-astro-cid-fzx4jmue>${card.heading}</h3> ${card.content?.subheading && renderTemplate`<p class="service-card-subtitle" data-astro-cid-fzx4jmue>${card.content.subheading}</p>`} <span class="service-card-cta" data-astro-cid-fzx4jmue>${card.content?.cta_text || "Vezi Detalii"} &rarr;</span> </div> </div> </a>`)} </div> </div> </section>`}  ${page.slug === "preturi-decoratiuni-baloane" ? renderTemplate`${renderComponent($$result2, "Fragment", Fragment, { "data-astro-cid-fzx4jmue": true }, { "default": async ($$result3) => renderTemplate`${sections && sections.filter((s) => s.heading === "Cum se calculează prețul unui decor cu baloane?").map((section) => renderTemplate`<section class="content-section bg-light" id="cum-se-calculeaza" data-astro-cid-fzx4jmue> <div class="container section-grid" style="grid-template-columns: 1fr; max-width: 800px; text-align: center;" data-astro-cid-fzx4jmue> <div class="section-text" data-astro-cid-fzx4jmue> <h2 class="section-heading" data-astro-cid-fzx4jmue>${section.heading}</h2> ${section.content?.body && renderTemplate`<div class="section-body prose" data-astro-cid-fzx4jmue>${unescapeHTML(section.content.body)}</div>`} </div> </div> </section>`)}<div id="content" class="container" style="padding: 4rem 1rem;" data-astro-cid-fzx4jmue> <div class="pricing-details-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 2rem;" data-astro-cid-fzx4jmue> ${sections && sections.filter((s) => !["hero", "gallery", "faq", "service_card"].includes(s.section_type) && s.heading !== "Cum se calculează prețul unui decor cu baloane?").map((section) => renderTemplate`<div class="pricing-detail-card"${addAttribute(section.heading ? "preturi-" + section.heading.replace("Prețuri ", "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "") : void 0, "id")} style="background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); border: 1px solid #e2e8f0; display: flex; flex-direction: column;" data-astro-cid-fzx4jmue> <h3 class="pricing-card-title" style="font-size: 1.5rem; margin-bottom: 1rem; color: var(--primary-dark);" data-astro-cid-fzx4jmue>${section.heading}</h3> ${section.content?.body && renderTemplate`<div class="pricing-card-body prose" style="flex-grow: 1; margin-bottom: 1.5rem;" data-astro-cid-fzx4jmue>${unescapeHTML(section.content.body)}</div>`} ${section.content?.cta_text && renderTemplate`<a${addAttribute(getCtaUrl(section.content?.cta_url), "href")} class="btn-primary" style="align-self: flex-start; margin-top: auto;" data-astro-cid-fzx4jmue>${section.content.cta_text}</a>`} </div>`)} </div> </div> ` })}` : renderTemplate`<div id="content" class="sections-wrapper" data-astro-cid-fzx4jmue> ${showPreviewPricing && renderTemplate`${renderComponent($$result2, "KassiaPricingCatalog", $$KassiaPricingCatalog, { "variant": "preview", "locationName": String(page.slug || "").includes("voluntari") ? "orașul Voluntari" : "București și Ilfov", "data-astro-cid-fzx4jmue": true })}`} ${page.slug === PRICING_PAGE_SLUG && renderTemplate`${renderComponent($$result2, "KassiaPricingCatalog", $$KassiaPricingCatalog, { "variant": "full", "data-astro-cid-fzx4jmue": true })}`} ${sections && sections.filter((s) => !["hero", "gallery", "faq", "service_card", "testimonials_section", "process_steps", "feature_card"].includes(s.section_type)).map((section, index) => {
    if (section.section_type === "costume_catalog") {
      return renderTemplate`${renderComponent($$result2, "CostumeCatalog", $$CostumeCatalog, { "heading": section.heading, "subheading": section.content?.body, "cards": section.content?.cards || [], "data-astro-cid-fzx4jmue": true })}`;
    }
    const isTextOnly = !section.content?.image_url || section.content.image_url.trim() === "";
    return renderTemplate`${renderComponent($$result2, "Fragment", Fragment, { "data-astro-cid-fzx4jmue": true }, { "default": async ($$result3) => renderTemplate` <section${addAttribute(section.heading ? "preturi-" + section.heading.replace("Prețuri ", "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "") : void 0, "id")}${addAttribute(`content-section ${index % 2 === 0 ? "bg-light" : "bg-white"}`, "class")} data-astro-cid-fzx4jmue> <div${addAttribute(`container section-grid ${isTextOnly ? "text-only" : ""}`, "class")} data-astro-cid-fzx4jmue> <div class="section-text" data-astro-cid-fzx4jmue> ${section.heading && renderTemplate`<h2 class="section-heading" data-astro-cid-fzx4jmue>${section.heading}</h2>`} ${section.content?.subheading && renderTemplate`<h3 class="section-subheading" data-astro-cid-fzx4jmue>${section.content.subheading}</h3>`} ${section.content?.body && renderTemplate`<div class="section-body" data-astro-cid-fzx4jmue>${unescapeHTML(section.content.body)}</div>`} ${section.content?.cta_text && renderTemplate`<a${addAttribute(getCtaUrl(section.content?.cta_url), "href")} class="btn-primary" data-astro-cid-fzx4jmue>${section.content.cta_text}</a>`} </div>  ${section.content?.image_url && section.content.image_url.trim() !== "" && renderTemplate`<div class="section-image-placeholder" data-astro-cid-fzx4jmue> <img${addAttribute(section.content.image_url, "src")}${addAttribute(section.content?.image_alt || "Activitate pentru petreceri de copii", "alt")} width="800" height="600" loading="lazy" decoding="async" data-astro-cid-fzx4jmue> </div>`} </div> </section> ` })}`;
  })} </div>`}  ${sections && sections.some((s) => s.section_type === "gallery") && gallery && gallery.some((img) => img.url && img.url.trim() !== "") && renderTemplate`<section class="gallery-section bg-light" data-astro-cid-fzx4jmue> <div class="container" data-astro-cid-fzx4jmue> <h2 class="section-heading text-center" data-astro-cid-fzx4jmue>${sections.find((s) => s.section_type === "gallery")?.heading || "Galerie Foto"}</h2> <div class="gallery-grid" data-astro-cid-fzx4jmue> ${gallery.filter((img) => img.url && img.url.trim() !== "").map((img) => renderTemplate`<figure class="gallery-item" data-astro-cid-fzx4jmue> <img${addAttribute(img.url, "src")}${addAttribute(img.alt_text || "Galerie", "alt")} width="800" height="800" loading="lazy" decoding="async" data-astro-cid-fzx4jmue> </figure>`)} </div> </div> </section>`}  ${validFaqs.length > 0 && renderTemplate`<section class="faq-section bg-white" data-astro-cid-fzx4jmue> <div class="container" data-astro-cid-fzx4jmue> <h2 class="section-heading text-center" data-astro-cid-fzx4jmue>Întrebări Frecvente</h2> <div class="faq-accordion" data-astro-cid-fzx4jmue> ${validFaqs.map((faq) => renderTemplate`<details class="faq-details" data-astro-cid-fzx4jmue> <summary class="faq-summary" data-astro-cid-fzx4jmue>${faq.question}</summary> <div class="faq-answer" data-astro-cid-fzx4jmue>${faq.answer}</div> </details>`)} </div> </div> </section>`} ${renderComponent($$result2, "ReviewsCarousel", $$ReviewsCarousel, { "sector": sectorMatch ? sectorMatch[1] : null, "data-astro-cid-fzx4jmue": true })} ${renderComponent($$result2, "Footer", $$Footer, { "internalLinks": publishedLinks, "isAnimatori": isAnimatoriPage, "data-astro-cid-fzx4jmue": true })} </div> ` })}`;
}, "/opt/kassia-site/src/pages/[...slug].astro", void 0);
const $$file = "/opt/kassia-site/src/pages/[...slug].astro";
const $$url = "/[...slug]";

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  default: $$,
  file: $$file,
  url: $$url
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
