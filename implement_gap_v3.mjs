import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import { config } from 'dotenv';
config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function checkIndexable(path) {
  const { data } = await supabase.from('kassia_pages').select('status, index_status').eq('path', path).single();
  return data && data.status === 'published' && data.index_status === 'index';
}

async function run() {
  const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db';
  console.log("Saving snapshot...");
  
  const { data: beforeSections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId);
  const { data: beforeFaqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', pageId);
  const { data: beforeLinks } = await supabase.from('kassia_internal_links').select('*').eq('source_page_id', pageId);
  
  fs.writeFileSync('audit_animatori_pillar_gap_v3/snapshot_before.json', JSON.stringify({ sections: beforeSections, faqs: beforeFaqs, links: beforeLinks }, null, 2));
  
  console.log("Applying GAP V3 changes idempotently...");
  
  const newSections = [
    {
      heading: 'Variante de programe pentru petreceri copii',
      section_type: 'service_details',
      order_index: 30,
      content: {
        body: `
          <h3>Program scurt pentru grupuri mici</h3>
          <p>Potrivit pentru petreceri restrânse, acasă, grădiniță sau spații mici. Include jocuri de grup, modelaj baloane și activități rapide.</p>
          <a href="/contact/" class="btn btn-primary">Cere ofertă personalizată</a>
          
          <h3>Program standard pentru aniversări copii</h3>
          <p>Potrivit pentru cele mai multe petreceri. Include jocuri interactive, muzică, mini-disco, pictură pe față și modelaj baloane, în funcție de vârsta copiilor și spațiu.</p>
          <a href="/contact/" class="btn btn-primary">Cere ofertă personalizată</a>
          
          <h3>Program extins cu animatori, mascote și decoruri</h3>
          <p>Potrivit pentru evenimente mai mari sau tematice. Poate combina animatorii cu mascote și personaje tematice din catalogul Kassia, plus decoruri cu baloane, în funcție de disponibilitate.</p>
          <a href="/contact/" class="btn btn-primary">Cere ofertă personalizată</a>
        `
      }
    },
    {
      heading: 'Recuzită, mascote și adaptarea programului după vârstă',
      section_type: 'service_details',
      order_index: 31,
      content: {
        body: `
          <ul>
            <li><strong>Recuzită de joc:</strong> Jocuri diversificate aduse de animatori.</li>
            <li><strong>Muzică și atmosferă:</strong> Boxă portabilă pentru mini-disco și jocuri muzicale.</li>
            <li><strong>Modelaj baloane:</strong> Baloane speciale și tehnici pentru a crea diverse forme.</li>
            <li><strong>Pictură pe față:</strong> Materiale sigure pentru pielea copiilor, incluse în pachetele aplicabile.</li>
            <li><strong>Mascote și personaje tematice:</strong> Disponibile la cerere din catalogul Kassia.</li>
            <li><strong>Adaptare după vârstă:</strong> Programe structurate diferit pentru grupele 1–3 ani, 4–7 ani și 8–12 ani.</li>
            <li><strong>Adaptare la locație:</strong> Program flexibil, gândit special pentru acasă, restaurant, grădiniță sau spațiu de joacă.</li>
          </ul>
        `
      }
    }
  ];

  const sectionsInserted = [];
  for (const s of newSections) {
    const exists = beforeSections.find(x => x.heading === s.heading);
    if (!exists) {
      await supabase.from('kassia_page_sections').insert({ page_id: pageId, ...s });
      sectionsInserted.push(s.heading);
      console.log(`Inserted section: ${s.heading}`);
    } else {
      console.log(`Section already exists: ${s.heading}`);
    }
  }
  
  const newFaqs = [
    { question: 'Cum ne asigurăm că animatorul ajunge la timp?', answer: 'Echipa noastră confirmă toate detaliile logistice înainte de eveniment. Animatorul se prezintă la locație cu suficient timp înainte pentru a se pregăti de începerea programului.' },
    { question: 'Ce se întâmplă dacă la petrecere sunt și copii mai mari?', answer: 'Animatorii noștri sunt instruiți să adapteze jocurile și interacțiunea din mers, astfel încât și copiii mai mari să fie integrați sau cel puțin distrați de activitățile propuse.' }
  ];
  
  const faqsInserted = [];
  let maxFaqOrder = beforeFaqs.length > 0 ? Math.max(...beforeFaqs.map(f => f.order_index)) : 0;
  
  for (const f of newFaqs) {
    const exists = beforeFaqs.find(x => x.question === f.question);
    if (!exists) {
      maxFaqOrder += 1;
      await supabase.from('kassia_faqs').insert({ page_id: pageId, order_index: maxFaqOrder, ...f });
      faqsInserted.push(f.question);
      console.log(`Inserted FAQ: ${f.question}`);
    } else {
      console.log(`FAQ already exists: ${f.question}`);
    }
  }
  
  // Internal Links Check
  const potentialPaths = [
    '/animatori-petreceri-copii-sector-1/',
    '/animatori-petreceri-copii-sector-2/',
    '/animatori-petreceri-copii-sector-3/',
    '/animatori-petreceri-copii-sector-4/',
    '/animatori-petreceri-copii-sector-5/',
    '/animatori-petreceri-copii-sector-6/',
    '/animatori-petreceri-copii-bucuresti/',
    '/animatori-petreceri-copii-floreasca/'
  ];
  
  const linksAdded = [];
  for (const path of potentialPaths) {
    const isIndexable = await checkIndexable(path);
    if (isIndexable) {
      const { data: targetData } = await supabase.from('kassia_pages').select('id').eq('path', path).single();
      if (targetData) {
        const exists = beforeLinks.find(x => x.target_page_id === targetData.id);
        if (!exists) {
          await supabase.from('kassia_internal_links').insert({ source_page_id: pageId, target_page_id: targetData.id });
          linksAdded.push(path);
          console.log(`Added internal link to: ${path}`);
        } else {
          console.log(`Link already exists to: ${path}`);
        }
      }
    } else {
      console.log(`Skipped non-indexable/missing link: ${path}`);
    }
  }
  
  fs.writeFileSync('audit_animatori_pillar_gap_v3/implemented_changes.json', JSON.stringify({
    sectionsInserted, faqsInserted, linksAdded
  }, null, 2));

  console.log("DB_IMPLEMENTATION_DONE");
}
run();
