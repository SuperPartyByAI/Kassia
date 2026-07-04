import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii/').single();
  const pageId = page.id;

  // 1. DRAFT REPETITIVE SECTIONS
  const headingsToDraft = [
    'De ce aleg părinții Kassia pentru petrecerile copiilor?',
    'Animatori la domiciliu, la curte, restaurant sau grădiniță în București și Ilfov',
    'Zone acoperite în București și Ilfov',
    'Ce evităm când organizăm activități cu grupuri de copii',
    'Un personaj animator sau două personaje animatoare?',
    'Recuzită, mascote și adaptarea programului după vârstă',
    'Ce program alegi în funcție de vârsta copiilor?',
    'Exemple de programe pentru petreceri copii',
    'Variante de programe pentru petreceri copii',
    'Cum alegi corect programul cu animatori',
    'Pentru ce tipuri de evenimente sunt potriviți animatorii',
    'Activități incluse',
    'Personaje animatoare și teme potrivite pentru copii',
    'Servicii conexe care completează atmosfera de petrecere',
    'Ghid pentru planificarea programului de animație',
    'De ce să alegi Kassia Events pentru petrecerea copilului'
  ];

  for (const heading of headingsToDraft) {
     await supabase.from('kassia_page_sections')
        .update({ section_type: 'draft' })
        .eq('page_id', pageId)
        .eq('heading', heading);
  }

  // Draft custom_html and empty headings
  await supabase.from('kassia_page_sections')
      .update({ section_type: 'draft' })
      .eq('page_id', pageId)
      .eq('section_type', 'custom_html');

  // 2. INSERT NEW HIGH-CONVERTING SECTION
  const newSection = {
    page_id: pageId,
    section_type: 'service_details',
    order_index: 75,
    heading: 'Cum alegi pachetul corect pentru petrecerea ta?',
    content: {
       body: `
       <p style="font-size:1.1rem; line-height:1.7;">Alegerea numărului de animatori depinde de doi factori esențiali: <strong>numărul de copii</strong> și <strong>spațiul disponibil</strong>.</p>
       <div style="display:flex; gap:20px; flex-wrap:wrap; margin-top:20px;">
          <div style="flex:1; min-width:300px; padding:20px; background:#f8fafc; border-radius:12px; border-top: 4px solid #3b82f6;">
             <h3 style="font-size:1.2rem; font-weight:700; margin-bottom:10px;">Petrecere Acasă (Grup Mic)</h3>
             <p>Pentru apartament sau spații restrânse și grupuri de până la <strong>10-12 copii</strong>, un singur animator este perfect. Va reuși să țină atenția grupului, să facă face-painting și modelaj de baloane fără ca timpul de așteptare să devină plictisitor.</p>
          </div>
          <div style="flex:1; min-width:300px; padding:20px; background:#f8fafc; border-radius:12px; border-top: 4px solid #a855f7;">
             <h3 style="font-size:1.2rem; font-weight:700; margin-bottom:10px;">Restaurant sau Curte (Grup Mare)</h3>
             <p>Pentru spații deschise și grupuri de <strong>peste 15 copii</strong>, recomandăm cu tărie <strong>2 animatori</strong>. De ce? Unul pictează fețele, în timp ce al doilea susține jocurile. În plus, pot organiza competiții pe echipe (băieți vs fete, stafete), iar copiii nu se vor împrăștia.</p>
          </div>
       </div>
       <p style="margin-top:20px; font-weight:bold;">Timp recomandat: Minim 2 ore. Prima oră este dedicată jocurilor interactive, iar a doua oră include momentul tortului (prezentat de personaj), modelajul de baloane și ședința foto.</p>
       `
    }
  };

  await supabase.from('kassia_page_sections').insert([newSection]);
  
  console.log("Cleanup and Insert done successfully!");
}

run();
