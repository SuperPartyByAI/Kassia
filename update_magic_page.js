import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const path = '/spectacol-magie-copii-bucuresti/';
  
  // 1. Get the page
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', path).single();
  if (!page) { console.log('Page not found'); return; }
  
  // 2. Update page metadata
  await supabase.from('kassia_pages').update({
    title: 'Spectacol de Magie Copii București - Iluzionist pentru Petreceri | Kassia',
    h1: 'Spectacol de Magie și Iluzionism pentru Copii',
    meta_title: 'Spectacol de Magie Copii București & Ilfov - Magician Petreceri',
    meta_description: 'Transformă petrecerea copilului tău într-o experiență de neuitat cu un spectacol de magie interactiv. Magician profesionist, trucuri fascinante și momente pline de umor.',
    index_status: 'published'
  }).eq('id', page.id);
  
  // 3. Delete old sections
  await supabase.from('kassia_page_sections').delete().eq('page_id', page.id);
  
  // 4. Insert new sections
  const sections = [
    {
      page_id: page.id,
      section_type: 'hero',
      order_index: 10,
      content: {
        title: "Spectacole de Magie pentru Petreceri Copii",
        subtitle: "Un show captivant, plin de mister, umor și trucuri interactive, adaptat pentru vârsta celor mici.",
        image_url: "/images/animatori/animator-petreceri-copii-bucuresti-kassia.jpg",
        image_alt: "Spectacol de magie pentru petreceri de copii Bucuresti"
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 20,
      heading: 'Un spectacol interactiv în care copiii devin asistenții magicianului',
      content: {
        body: '<p>Spectacolul nostru de magie nu este doar o reprezentație vizuală, ci o experiență interactivă în care sărbătoritul și invitații săi sunt implicați direct. Magicianul nostru știe cum să capteze atenția celor mici prin trucuri de prestidigitație, apariții misterioase și momente comice adaptate vârstei lor.</p><ul><li>Trucuri vizuale și de iluzionism adaptate copiilor.</li><li>Momente de comedie care stârnesc hohote de râs.</li><li>Implicarea directă a sărbătoritului (devine "magicianul onorific").</li><li>Atmosferă plină de mister și suspans.</li></ul>'
      }
    },
    {
      page_id: page.id,
      section_type: 'custom_html',
      order_index: 30,
      content: {
        html: `
        <div style="background: #f8fafc; padding: 4rem 2rem; border-radius: 24px; margin: 3rem 0;">
          <div style="text-align: center; margin-bottom: 3rem;">
            <h2 style="font-size: 2rem; font-weight: 800; color: #0f172a;">Pachete Spectacol Magie</h2>
            <p style="color: #64748b; font-size: 1.1rem; max-width: 600px; margin: 1rem auto 0;">Fiecare spectacol este adaptat spațiului tău (acasă, restaurant, grădiniță). Alege pachetul potrivit duratei dorite.</p>
          </div>
          <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem;">
            <div style="background: white; padding: 2rem; border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 4px 6px rgba(0,0,0,0.05); text-align: center;">
              <h3 style="font-size: 1.5rem; font-weight: 700; color: #0f172a;">Spectacol Magic (30 Min)</h3>
              <p style="color: #475569; margin: 1rem 0 2rem;">Ideal pentru copiii mai mici (3-6 ani) pentru a le menține atenția maximă.</p>
              <a href="https://wa.me/40763795919" target="_blank" style="display: inline-block; padding: 0.75rem 2rem; background: #3b82f6; color: white; border-radius: 99px; font-weight: 600; text-decoration: none;">Cere Ofertă Preț</a>
            </div>
            <div style="background: white; padding: 2rem; border-radius: 16px; border: 2px solid #3b82f6; box-shadow: 0 10px 15px rgba(59, 130, 246, 0.1); text-align: center; position: relative;">
              <span style="position: absolute; top: -12px; left: 50%; transform: translateX(-50%); background: #3b82f6; color: white; padding: 4px 12px; border-radius: 99px; font-size: 0.8rem; font-weight: 700;">CEL MAI SOLICITAT</span>
              <h3 style="font-size: 1.5rem; font-weight: 700; color: #0f172a;">Spectacol Iluzionism (45 Min)</h3>
              <p style="color: #475569; margin: 1rem 0 2rem;">Pentru copiii peste 6 ani, un show complex cu trucuri avansate și participare interactivă.</p>
              <a href="https://wa.me/40763795919" target="_blank" style="display: inline-block; padding: 0.75rem 2rem; background: #3b82f6; color: white; border-radius: 99px; font-weight: 600; text-decoration: none;">Cere Ofertă Preț</a>
            </div>
          </div>
        </div>
        `
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 40,
      heading: 'Detalii organizatorice importante',
      content: {
        body: '<p>Pentru o desfășurare optimă a spectacolului de magie, magicianul va sosi la locație cu 20-30 de minute înainte de începerea programului pentru a pregăti recuzita. Este necesar un spațiu de minim 2x2 metri pentru desfășurarea numerelor și asezarea copiilor în fața scenei improvizate. Spectacolul se poate desfășura atât în interior (restaurant, acasă, grădiniță), cât și în aer liber, cu condiția să existe o zonă ferită de vânt puternic.</p>'
      }
    },
    {
      page_id: page.id,
      section_type: 'testimonials_section',
      order_index: 50,
      content: {
        is_active: true
      }
    },
    {
      page_id: page.id,
      section_type: 'cta_final',
      order_index: 60,
      content: {
        is_active: true
      }
    }
  ];
  
  await supabase.from('kassia_page_sections').insert(sections);
  console.log('Magic page successfully rebuilt and published!');
}

run();
