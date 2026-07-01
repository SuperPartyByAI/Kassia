import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import ws from 'ws';
import * as cheerio from 'cheerio';
import fs from 'fs';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  realtime: {
    transport: ws,
  },
});

const targetPaths = [
  '/animatori-petreceri-copii/',
  '/animatori-petreceri-copii-bucuresti/',
  '/animatori-petreceri-copii-sector-1/',
  '/animatori-petreceri-copii-sector-2/',
  '/animatori-petreceri-copii-sector-3/',
  '/animatori-petreceri-copii-sector-4/',
  '/animatori-petreceri-copii-sector-5/',
  '/animatori-petreceri-copii-sector-6/',
  '/animatori-petreceri-copii-herastrau/',
  '/pictura-pe-fata-copii-bucuresti/',
  '/mascote-petreceri-copii-bucuresti/',
  '/mini-disco-copii-bucuresti/',
  '/modelaj-baloane-copii-bucuresti/',
  '/pachete-animatori-copii-bucuresti/',
  '/preturi-animatori-copii-bucuresti/',
  '/animatori-tematici-petreceri-copii-bucuresti/'
];

function unicodeRegex(word) {
  return new RegExp(`(?<![a-zA-ZăâîșțĂÂÎȘȚ])${word}(?![a-zA-ZăâîșțĂÂÎȘȚ])`, 'gi');
}

const forbiddenTerms = [
  'antialergic', 'antialergice',
  'hipoalergenic', 'hipoalergenice',
  'dermatologic', 'testate dermatologic', 'avizate dermatologic',
  'non-toxice', 'non-toxic',
  'pachet', 'pachete', 'pachetul', 'pachetele', 'pachetului', 'pachetelor',
  'rezervă', 'rezervare', 'rezervarea', 'rezervări', 'rezervați', 'rezervi',
  'preț', 'prețuri', 'prețului', 'tarife', 'costuri', 'cost',
  'face painting', 'face-painting',
  'complet sigure', 'siguranță absolută', 'culori sigure', 'sigure'
];

function getVisibleText(htmlOrText) {
  if (!htmlOrText) return '';
  if (htmlOrText.includes('<') && htmlOrText.includes('>')) {
    try {
      const $ = cheerio.load(`<body>${htmlOrText}</body>`);
      return $('body').text();
    } catch (e) {
      return htmlOrText;
    }
  }
  return htmlOrText;
}

async function run() {
  const { data: pages } = await supabase
    .from('kassia_pages')
    .select('id, path, title, meta_description')
    .in('path', targetPaths);

  const pageIds = pages.map(p => p.id);

  const { data: sections } = await supabase
    .from('kassia_page_sections')
    .select('id, page_id, section_type, heading, content, order_index')
    .in('page_id', pageIds);

  const { data: faqs } = await supabase
    .from('kassia_faqs')
    .select('id, page_id, question, answer, order_index')
    .in('page_id', pageIds);

  console.log(`Found ${pages.length} pages, ${sections.length} sections, ${faqs.length} FAQs.`);

  const violations = [];

  const check = (text, page, source, recordId, fieldName, meta) => {
    if (!text) return;
    const visibleText = getVisibleText(text);
    const lowerText = visibleText.toLowerCase();

    for (const term of forbiddenTerms) {
      const regex = unicodeRegex(term);
      if (regex.test(lowerText)) {
        violations.push({
          path: page.path,
          source,
          recordId,
          fieldName,
          meta,
          term,
          text
        });
        break;
      }
    }
  };

  for (const page of pages) {
    check(page.title, page, 'kassia_pages', page.id, 'title', 'Page Title');
    check(page.meta_description, page, 'kassia_pages', page.id, 'meta_description', 'Page Meta Description');

    const pageSecs = sections.filter(s => s.page_id === page.id);
    const pageFaqs = faqs.filter(f => f.page_id === page.id);

    for (const sec of pageSecs) {
      check(sec.heading, page, 'kassia_page_sections', sec.id, 'heading', `Section: ${sec.section_type}, Order: ${sec.order_index}`);
      
      const content = sec.content;
      if (!content) continue;

      if (typeof content === 'string') {
        check(content, page, 'kassia_page_sections', sec.id, 'content', `Section: ${sec.section_type}, Order: ${sec.order_index}`);
      } else if (typeof content === 'object') {
        const checkObj = (obj, currentPath = '') => {
          if (!obj) return;
          if (typeof obj === 'string') {
            check(obj, page, 'kassia_page_sections', sec.id, `content${currentPath}`, `Section: ${sec.section_type}, Order: ${sec.order_index}`);
          } else if (Array.isArray(obj)) {
            obj.forEach((item, idx) => checkObj(item, `${currentPath}[${idx}]`));
          } else if (typeof obj === 'object') {
            for (const key of Object.keys(obj)) {
              checkObj(obj[key], `${currentPath}.${key}`);
            }
          }
        };
        checkObj(content);
      }
    }

    for (const faq of pageFaqs) {
      check(faq.question, page, 'kassia_faqs', faq.id, 'question', `FAQ Order: ${faq.order_index}`);
      check(faq.answer, page, 'kassia_faqs', faq.id, 'answer', `FAQ Order: ${faq.order_index}`);
    }
  }

  let out = `Found ${violations.length} total violations.\n`;
  for (const v of violations) {
    out += `\n==================================================\n`;
    out += `Page: ${v.path}\n`;
    out += `Source: ${v.source} | Record ID: ${v.recordId} | Field: ${v.fieldName} | Meta: ${v.meta}\n`;
    out += `Violating Term: "${v.term}"\n`;
    out += `Text:\n${v.text}\n`;
  }
  
  fs.writeFileSync('scratch/violations.log', out);
  console.log(`Saved ${violations.length} violations to scratch/violations.log`);
}

run().catch(console.error);
