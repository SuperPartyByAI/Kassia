import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';
config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const pagePath = '/animatori-petreceri-copii/';
  const { data: page } = await supabase.from('kassia_pages').select('id, title').eq('path', pagePath).single();
  
  if (!page) {
    console.log("Page not found");
    return;
  }
  const pageId = page.id;

  // 1. Add Sections
  const newSections = [
    {
      page_id: pageId,
      section_type: 'service_details',
      heading: 'Exemple de programe pentru petreceri copii',
      content: {
        body: '<p>Fiecare petrecere este unică, motiv pentru care am creat programe flexibile ce pot fi personalizate în detaliu. Puteți opta pentru un program scurt, ideal pentru copiii mai mici, unde accentul se pune pe jocuri de cunoaștere și modelaj de baloane, sau pentru un program extins, cu mini-disco, pictură pe față și concursuri dinamice.</p>',
        cta_text: 'Cere ofertă personalizată',
        cta_url: '/contact/'
      },
      order_index: 3.1
    },
    {
      page_id: pageId,
      section_type: 'service_details',
      heading: 'Activități incluse',
      content: {
        body: '<p>Programul cu animatori este plin de energie și include o varietate de activități, adaptate din mers în funcție de reacțiile copiilor:</p><ul><li>jocuri interactive;</li><li>mini-disco;</li><li>modelaj baloane;</li><li>pictură pe față;</li><li>concursuri;</li><li>personaje tematice;</li><li>adaptare după vârsta copiilor;</li><li>adaptare după locație.</li></ul>'
      },
      order_index: 3.2
    },
    {
      page_id: pageId,
      section_type: 'service_details',
      heading: 'Pentru ce tipuri de evenimente sunt potriviți animatorii',
      content: {
        body: '<p>Indiferent de ocazie, un animator profesionist știe cum să aducă bucurie și să mențină atenția copiilor. Serviciile noastre sunt potrivite pentru:</p><ul><li>aniversări copii;</li><li>botez / moț / turtă;</li><li>petreceri la restaurant;</li><li>petreceri acasă;</li><li>grădinițe / școli;</li><li>evenimente private.</li></ul>'
      },
      order_index: 3.3
    }
  ];

  for (const sec of newSections) {
    await supabase.from('kassia_page_sections').insert(sec);
  }

  // 2. Add FAQs
  const newFaqs = [
    { page_id: pageId, question: 'Cât durează un program cu animatori?', answer: 'Un program standard durează de obicei între o oră și două ore, în funcție de numărul de copii și de complexitatea activităților dorite. Se poate prelungi la cerere.', order_index: 100 },
    { page_id: pageId, question: 'Pentru câți copii este potrivit un animator?', answer: 'Recomandăm un animator pentru grupuri de până la 12-15 copii, pentru a ne asigura că fiecare copil primește atenția necesară și este implicat activ în jocuri.', order_index: 101 },
    { page_id: pageId, question: 'Animatorul vine cu recuzită?', answer: 'Da, animatorii noștri vin pregătiți cu toată recuzita necesară pentru jocuri, concursuri, modelaj de baloane și kit-uri profesionale pentru pictură pe față.', order_index: 102 },
    { page_id: pageId, question: 'Se poate adapta programul după vârsta copiilor?', answer: 'Categoric! Jocurile și abordarea sunt complet diferite pentru un grup de copii de 3 ani față de unul de 8 ani. Animatorul se va adapta pe loc energiei și vârstei participanților.', order_index: 103 },
    { page_id: pageId, question: 'Putem combina animatorii cu mascote sau decoruri cu baloane?', answer: 'Da, oferim posibilitatea de a adăuga mascote la momentul tortului sau de a personaliza spațiul cu decoruri tematice din baloane pentru o experiență completă.', order_index: 104 },
    { page_id: pageId, question: 'Cum cerem o ofertă pentru data petrecerii?', answer: 'Cel mai simplu este să ne contactați telefonic sau prin WhatsApp. Verificați disponibilitatea cu noi și vom stabili împreună pachetul ideal pentru evenimentul dumneavoastră.', order_index: 105 }
  ];

  for (const faq of newFaqs) {
    await supabase.from('kassia_faqs').insert(faq);
  }

  // 3. Add Internal Links
  const linkSlugs = [
    '/animatori-petreceri-copii-bucuresti/',
    '/programe-animatori-copii/',
    '/personaje-petreceri-copii/',
    '/animatori-petreceri-copii-sector-1/',
    '/animatori-petreceri-copii-sector-2/',
    '/animatori-petreceri-copii-floreasca/'
  ];

  for (const targetPath of linkSlugs) {
    // Check if target page exists and is published + index
    const { data: targetPage } = await supabase.from('kassia_pages').select('id, status, index_status, title').eq('path', targetPath).single();
    
    if (targetPage && targetPage.status === 'published' && targetPage.index_status === 'index') {
      // Check if link already exists
      const { data: existingLink } = await supabase.from('kassia_internal_links')
        .select('id')
        .eq('source_page_id', pageId)
        .eq('target_page_id', targetPage.id)
        .single();
        
      if (!existingLink) {
        await supabase.from('kassia_internal_links').insert({
          source_page_id: pageId,
          target_page_id: targetPage.id,
          anchor_text: targetPage.title
        });
        console.log("Added link to:", targetPath);
      } else {
        console.log("Link already exists for:", targetPath);
      }
    } else {
      console.log("Skipped link (not found or not indexable):", targetPath);
    }
  }

  console.log("UPDATE_DB_DONE");
}

run();
