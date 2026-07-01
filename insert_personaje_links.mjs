import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const targetUrl = '/personaje-animatori-copii-bucuresti/';

const contentMap = {
  '/': {
    heading: 'Peste 300 de personaje pentru petreceri copii',
    body: '<p>Alege dintre personaje de poveste, supereroi, mascote și personaje tematice pentru copii de vârste diferite.</p>',
    cta_text: 'Vezi personajele'
  },
  '/animatori-petreceri-copii/': {
    heading: 'Personaje pentru petreceri de copii',
    body: '<p>Kassia pune la dispoziție peste 300 de costume și personaje tematice pentru petreceri de copii în București și Ilfov. Poți alege personaje de poveste, prințese, supereroi, mascote și personaje moderne pentru grupe de vârstă diferite.</p>',
    cta_text: 'Vezi personajele disponibile'
  },
  '/animatori-petreceri-copii-sector-1/': {
    heading: 'Alegerea personajului pentru eveniment',
    body: '<p>Pentru petrecerile organizate în Sector 1, poți alege dintr-o colecție extinsă de personaje pentru copii, de la prințese și supereroi până la mascote și personaje moderne. Disponibilitatea se confirmă în funcție de data evenimentului.</p>',
    cta_text: 'Vezi personajele disponibile'
  },
  '/animatori-petreceri-copii-sector-2/': {
    heading: 'Personaje tematice pentru petrecerea ta',
    body: '<p>Dacă organizezi evenimentul în Sector 2, poți consulta catalogul de personaje Kassia pentru a alege o tematică potrivită vârstei copiilor și stilului petrecerii.</p>',
    cta_text: 'Vezi personajele disponibile'
  },
  '/animatori-petreceri-copii-sector-3/': {
    heading: 'Personaje variate pentru copii',
    body: '<p>Pentru petrecerile din Sector 3, personajul poate fi ales dintr-un catalog generos cu prințese, mascote, supereroi, personaje din desene animate și variante sezoniere.</p>',
    cta_text: 'Vezi personajele disponibile'
  },
  '/animatori-petreceri-copii-sector-4/': {
    heading: 'Selecția personajului potrivit',
    body: '<p>Evenimentele din Sector 4 pot include personaje tematice adaptate vârstei copiilor, de la personaje clasice la trendurile moderne ale momentului.</p>',
    cta_text: 'Vezi personajele disponibile'
  },
  '/animatori-petreceri-copii-sector-5/': {
    heading: 'Mascote și personaje animate',
    body: '<p>Pentru petrecerile din Sector 5, poți alege o variantă potrivită pentru eveniment, de la mascote prietenoase pentru cei mici până la personaje dinamice pentru grupe mai mari.</p>',
    cta_text: 'Vezi personajele disponibile'
  },
  '/animatori-petreceri-copii-sector-6/': {
    heading: 'Alege personajul preferat',
    body: '<p>Petrecerile organizate în Sector 6 pot include personaje din colecția Kassia de peste 300 de costume, în funcție de disponibilitatea pentru data aleasă.</p>',
    cta_text: 'Vezi personajele disponibile'
  },
  '/preturi-animatori-copii-bucuresti/': {
    heading: null,
    body: '<p>Alegerea personajului se confirmă separat, în funcție de disponibilitatea costumului dorit pentru data evenimentului. Ai la dispoziție o gamă variată din care să alegeți.</p>',
    cta_text: 'Vezi personajele disponibile'
  }
};

async function run() {
  const paths = Object.keys(contentMap);
  const { data: pages } = await supabase.from('kassia_pages').select('id, path').in('path', paths);
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, page_id, content, order_index');

  const results = [];

  for (const p of paths) {
    const page = pages.find(pg => pg.path === p);
    if (!page) {
      results.push({ Pagină: p, DB: 'lipsă', DOM: 'lipsă', 'Anchor Text': '-', Acțiune: 'Eroare (pagină lipsă)', Verdict: 'ISSUE FOUND' });
      continue;
    }

    const pageSections = sections.filter(s => s.page_id === page.id);
    const hasLink = pageSections.some(s => JSON.stringify(s.content).includes(targetUrl));

    if (hasLink) {
      results.push({ Pagină: p, DB: 'există', DOM: 'există', 'Anchor Text': 'N/A', Acțiune: 'Sărit', Verdict: 'OK' });
    } else {
      const maxOrder = pageSections.reduce((max, s) => Math.max(max, s.order_index || 0), 0);
      
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

      const { error } = await supabase.from('kassia_page_sections').insert(newSection);
      if (error) {
        results.push({ Pagină: p, DB: 'lipsă', DOM: 'lipsă', 'Anchor Text': '-', Acțiune: 'Eroare la insert', Verdict: 'ISSUE FOUND' });
      } else {
        results.push({ Pagină: p, DB: 'există (nou)', DOM: 'pending', 'Anchor Text': contentMap[p].cta_text, Acțiune: 'Inserat block scurt', Verdict: 'OK' });
      }
    }
  }

  console.table(results);
}

run();
