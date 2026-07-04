import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const path = '/spectacol-magie-copii-bucuresti/';
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', path).single();
  
  await supabase.from('kassia_page_sections').delete().eq('page_id', page.id);
  
  const sections = [
    {
      page_id: page.id,
      section_type: 'hero',
      order_index: 10,
      heading: 'Spectacole de Magie și Iluzionism pentru Copii în București',
      content: {
        body: `
<div style="font-size:1.25rem; font-weight:600; margin-bottom:1.5rem; display:flex; flex-direction:column; gap:0.5rem;">
  <span style="color:#10b981; font-size:1.2rem;">Un show interactiv cu trucuri și mister</span>
  <span>Copilul tău devine asistentul principal al magicianului!</span>
</div>
<div style="display:flex; justify-content:center; gap:1rem; flex-wrap:wrap; margin-top:2rem;">
  <a href="#pachete" class="btn-primary" style="background:#0f172a; color:white; padding:12px 24px; border-radius:30px; text-decoration:none; font-weight:bold;">Vezi pachetele</a>
  <a href="https://wa.me/40763795919" class="btn-primary" style="background:#25D366; color:white; padding:12px 24px; border-radius:30px; text-decoration:none; font-weight:bold;">Scrie pe WhatsApp</a>
</div>
        `,
        image_url: "/images/animatori/animator-petrecere-copii-bucuresti-hero.webp"
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 20,
      heading: 'Cum se desfășoară spectacolul de magie?',
      content: {
        body: '<p>Spectacolul nostru de magie nu este doar o reprezentație vizuală, ci o experiență interactivă. Magicianul nostru știe cum să capteze atenția celor mici prin trucuri de prestidigitație, apariții misterioase și momente comice.</p><ul><li>Trucuri vizuale adaptate vârstei copiilor.</li><li>Momente de comedie care stârnesc hohote de râs.</li><li>Implicarea directă a sărbătoritului (devine "magician onorific").</li><li>Atmosferă plină de mister și participare activă.</li></ul>'
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 30,
      heading: null,
      content: {
        body: `
        <div id="pachete" style="background: #f8fafc; padding: 4rem 2rem; border-radius: 24px; margin: 3rem 0; width: 100%;">
          <div style="text-align: center; margin-bottom: 3rem;">
            <h2 style="font-size: 2.2rem; font-weight: 800; color: #0f172a;">Pachete Spectacol Magie</h2>
            <p style="color: #64748b; font-size: 1.1rem; max-width: 600px; margin: 1rem auto 0;">Spectacolul este perfect pentru petreceri acasă, la restaurant sau grădiniță.</p>
          </div>
          <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; max-width:900px; margin: 0 auto;">
            <div style="background: white; padding: 2.5rem 2rem; border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 4px 6px rgba(0,0,0,0.05); text-align: center;">
              <h3 style="font-size: 1.5rem; font-weight: 800; color: #0f172a;">Magic Show (30 Min)</h3>
              <p style="color: #475569; margin: 1rem 0 2rem; line-height:1.6;">Ideal pentru copiii mai mici (3-6 ani). Menține atenția maximă prin trucuri vizuale și rapide.</p>
              <a href="https://wa.me/40763795919" target="_blank" style="display: inline-block; padding: 1rem 2.5rem; background: #3b82f6; color: white; border-radius: 99px; font-weight: 700; text-decoration: none;">Cere Ofertă Preț</a>
            </div>
            <div style="background: white; padding: 2.5rem 2rem; border-radius: 16px; border: 2px solid #3b82f6; box-shadow: 0 10px 15px rgba(59, 130, 246, 0.1); text-align: center; position: relative;">
              <span style="position: absolute; top: -14px; left: 50%; transform: translateX(-50%); background: #3b82f6; color: white; padding: 6px 16px; border-radius: 99px; font-size: 0.85rem; font-weight: 800;">RECOMANDAT</span>
              <h3 style="font-size: 1.5rem; font-weight: 800; color: #0f172a;">Iluzionism VIP (45 Min)</h3>
              <p style="color: #475569; margin: 1rem 0 2rem; line-height:1.6;">Pentru copiii peste 6 ani. Show complex, participare interactivă intensă și trucuri avansate.</p>
              <a href="https://wa.me/40763795919" target="_blank" style="display: inline-block; padding: 1rem 2.5rem; background: #3b82f6; color: white; border-radius: 99px; font-weight: 700; text-decoration: none;">Cere Ofertă Preț</a>
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
        body: '<p>Magicianul va sosi la locație cu 20-30 de minute înainte de începerea programului pentru a pregăti recuzita în secret. Este necesar un spațiu de minim 2x2 metri pentru desfășurarea numerelor și așezarea copiilor. Spectacolul se poate desfășura atât în interior, cât și în aer liber.</p>'
      }
    },
    {
      page_id: page.id,
      section_type: 'testimonials_section',
      order_index: 50,
      content: {}
    }
  ];
  
  await supabase.from('kassia_page_sections').insert(sections);
  console.log('Fixed Magic Page!');
}

run();
