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

export const ALL_ANIMATORI_PACKAGES = Object.freeze(
  PACKAGE_DEFINITIONS.map((entry) => Object.freeze({
    ...entry,
    includes: Object.freeze([...entry.includes])
  }))
);

export const CORE_ANIMATORI_PACKAGES = Object.freeze(
  ALL_ANIMATORI_PACKAGES.filter((entry) => entry.preview)
);

export const EXTENDED_ANIMATORI_PACKAGES = Object.freeze(
  ALL_ANIMATORI_PACKAGES.filter((entry) => !entry.preview)
);

export const DEPRECATED_ANIMATOR_PRICES = Object.freeze([350, 430, 560, 790, 860, 9999]);
export const PRICING_PAGE_SLUG = 'preturi-animatori-copii-bucuresti';

const LEGACY_PRICING_SECTION_TYPES = new Set([
  'pricing',
  'pricing_preview',
  'pricing_table',
  'pricing_programs',
  'pricing_full_table'
]);

const DEPRECATED_VISIBLE_PRICE_PATTERN = /(?:\b(?:350|430|560|790|860|9999)\s*(?:lei|ron)\b|["']?(?:price_amount|price)["']?\s*[:=]\s*["']?(?:350|430|560|790|860|9999)\b)/i;
const PRICING_CONTEXT_PATTERN = /(?:preț|pret|tarif|pachet|program|animator|picioroange)/i;

export function shouldShowCanonicalPricing(slug, showPricingPreview = false) {
  const value = String(slug || '').toLowerCase();
  return Boolean(
    value === PRICING_PAGE_SLUG ||
    value === 'animatori-petreceri-copii' ||
    value === 'animatori-petreceri-copii-bucuresti' ||
    /^animatori-petreceri-copii-sector-[1-6]$/.test(value) ||
    showPricingPreview
  );
}

export function getVisiblePricingPrograms(variant = 'preview') {
  return variant === 'full' ? ALL_ANIMATORI_PACKAGES : CORE_ANIMATORI_PACKAGES;
}

export function getSchemaPricingPrograms(slug, showPricingPreview = false) {
  const value = String(slug || '').toLowerCase();
  if (value === PRICING_PAGE_SLUG) return ALL_ANIMATORI_PACKAGES;
  return shouldShowCanonicalPricing(value, showPricingPreview)
    ? CORE_ANIMATORI_PACKAGES
    : [];
}

export function containsDeprecatedAnimatorPrice(value) {
  if (value === null || value === undefined) return false;
  let text;
  try {
    text = typeof value === 'string' ? value : JSON.stringify(value);
  } catch {
    return false;
  }
  return DEPRECATED_VISIBLE_PRICE_PATTERN.test(text);
}

export function shouldSuppressLegacyPricingSection(section, canonicalPricingEnabled = false) {
  if (!canonicalPricingEnabled || !section) return false;
  const sectionType = String(section.section_type || '').trim().toLowerCase();
  if (LEGACY_PRICING_SECTION_TYPES.has(sectionType)) return true;

  const searchable = `${String(section.heading || '')} ${typeof section.content === 'string' ? section.content : JSON.stringify(section.content || {})}`;
  return PRICING_CONTEXT_PATTERN.test(searchable) && containsDeprecatedAnimatorPrice(searchable);
}

export function buildOfferCatalog(programs = CORE_ANIMATORI_PACKAGES) {
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
