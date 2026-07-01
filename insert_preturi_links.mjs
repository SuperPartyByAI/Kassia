import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const targetUrl = '/preturi-animatori-copii-bucuresti/';

const contentMap = {
  '/': {
    heading: 'Detalii pentru programele cu animatori',
    body: '<p>Poți consulta variantele de program cu 1 personaj animator, 2 personaje animatoare și animatori pe picioroange pe pagina dedicată detaliilor pentru animatori.</p>',
    cta_text: 'Vezi detaliile pentru animatori'
  },
  '/animatori-petreceri-copii/': {
    heading: 'Detalii pentru programe și durată',
    body: '<p>Pentru alegerea programului potrivit, consultă pagina dedicată detaliilor pentru animatori copii, unde sunt explicate variantele cu 1 personaj animator, 2 personaje animatoare și animatori pe picioroange.</p>',
    cta_text: 'Vezi detaliile pentru animatori'
  },
  '/animatori-petreceri-copii-sector-1/': {
    heading: 'Detalii pentru programul de animație',
    body: '<p>Înainte de rezervare, poți consulta variantele de program disponibile pentru animatori copii în București și Ilfov, în funcție de durata evenimentului și tipul de animație dorit.</p>',
    cta_text: 'Vezi detaliile pentru animatori'
  },
  '/animatori-petreceri-copii-sector-2/': {
    heading: 'Detalii pentru programul de animație',
    body: '<p>Înainte de rezervare, poți consulta variantele de program disponibile pentru animatori copii în București și Ilfov, în funcție de durata evenimentului și tipul de animație dorit.</p>',
    cta_text: 'Vezi detaliile pentru animatori'
  },
  '/animatori-petreceri-copii-sector-3/': {
    heading: 'Detalii pentru programul de animație',
    body: '<p>Înainte de rezervare, poți consulta variantele de program disponibile pentru animatori copii în București și Ilfov, în funcție de durata evenimentului și tipul de animație dorit.</p>',
    cta_text: 'Vezi detaliile pentru animatori'
  },
  '/animatori-petreceri-copii-sector-4/': {
    heading: 'Detalii pentru programul de animație',
    body: '<p>Înainte de rezervare, poți consulta variantele de program disponibile pentru animatori copii în București și Ilfov, în funcție de durata evenimentului și tipul de animație dorit.</p>',
    cta_text: 'Vezi detaliile pentru animatori'
  },
  '/animatori-petreceri-copii-sector-5/': {
    heading: 'Detalii pentru programul de animație',
    body: '<p>Înainte de rezervare, poți consulta variantele de program disponibile pentru animatori copii în București și Ilfov, în funcție de durata evenimentului și tipul de animație dorit.</p>',
    cta_text: 'Vezi detaliile pentru animatori'
  },
  '/animatori-petreceri-copii-sector-6/': {
    heading: 'Detalii pentru programul de animație',
    body: '<p>Înainte de rezervare, poți consulta variantele de program disponibile pentru animatori copii în București și Ilfov, în funcție de durata evenimentului și tipul de animație dorit.</p>',
    cta_text: 'Vezi detaliile pentru animatori'
  }
};

async function run() {
  const paths = Object.keys(contentMap);
  const { data: pages } = await supabase.from('kassia_pages').select('id, path').in('path', paths);

  for (const p of paths) {
    const page = pages.find(pg => pg.path === p);
    if (!page) continue;

    const { data: sections } = await supabase.from('kassia_page_sections').select('id, content, order_index').eq('page_id', page.id);
    const hasLink = sections.some(s => s.content && s.content.cta_url === targetUrl);

    if (!hasLink) {
      const maxOrder = sections.reduce((max, s) => Math.max(max, s.order_index || 0), 0);
      
      const newSection = {
        page_id: page.id,
        section_type: 'content',
        heading: contentMap[p].heading,
        order_index: maxOrder + 10,
        content: {
          body: contentMap[p].body,
          cta_text: contentMap[p].cta_text,
          cta_url: targetUrl
        }
      };

      await supabase.from('kassia_page_sections').insert(newSection);
      console.log('Inserted into', p);
    } else {
      console.log('Already exists in', p);
    }
  }
}

run();
