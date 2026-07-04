import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const path = '/spectacol-magie-copii-bucuresti/';
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', path).single();
  
  await supabase.from('kassia_page_sections').delete().eq('page_id', page.id);
  await supabase.from('kassia_faqs').delete().eq('page_id', page.id);
  
  const sections = [
    {
      page_id: page.id,
      section_type: 'hero',
      order_index: 10,
      heading: 'Spectacole de Magie și Iluzionism pentru Copii',
      content: {
        body: `
<div style="font-size:1.3rem; font-weight:700; margin-bottom:1.5rem; display:flex; flex-direction:column; gap:0.75rem; color:#f8fafc;">
  <span style="color:#fcd34d; font-size:1.4rem; text-transform:uppercase; letter-spacing:1px;">Un show spectaculos, creat special pentru vârsta lor!</span>
  <span>Copilul tău va deveni "Magicianul Onorific" și va ajuta la cele mai amuzante trucuri. Magic, Interactiv și de Neuitat!</span>
</div>
<div style="display:flex; justify-content:center; gap:1.25rem; flex-wrap:wrap; margin-top:2.5rem;">
  <a href="#pachete" class="btn-primary" style="background:#0f172a; color:white; padding:16px 32px; border-radius:99px; text-decoration:none; font-weight:800; font-size:1.1rem;">Vezi Pachetele și Prețurile</a>
  <a href="https://wa.me/40763795919?text=Buna!%20Vreau%20detalii%20despre%20spectacolul%20de%20magie." class="btn-primary" style="background:#25D366; color:white; padding:16px 32px; border-radius:99px; text-decoration:none; font-weight:800; font-size:1.1rem; box-shadow:0 10px 15px -3px rgba(37,211,102,0.4);">Scrie-ne pe WhatsApp</a>
</div>
        `,
        image_url: "/images/animatori/animator-petrecere-copii-bucuresti-hero.webp"
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 20,
      heading: 'Pășește într-o lume plină de farmec și mister!',
      content: {
        subheading: 'Un spectacol în care Râsul și Magia se împletesc perfect',
        body: `
        <p style="font-size:1.15rem; line-height:1.7;">Spectacolul nostru de magie este conceput special pentru dinamica petrecerilor de copii. Magicianul Kassia Events nu urcă pe o scenă îndepărtată pentru a face trucuri plictisitoare cu cărți, ci coboară direct în mijlocul copiilor, creând o energie debordantă.</p>
        <p style="font-size:1.15rem; line-height:1.7;">Folosim recuzită colorată, elemente vizuale de impact și un stil de comunicare extrem de amuzant, adaptat pentru a menține vie atenția celor mici pe tot parcursul programului. Sărbătoritul este în centrul atenției, primind bagheta magică și rostind cuvintele fermecate care fac trucul să funcționeze!</p>
        
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 2rem; margin-top: 3rem;">
          <div style="background: white; padding: 2rem; border-radius: 16px; border: 1px solid #e2e8f0; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
            <div style="font-size: 3rem; margin-bottom: 1rem;">🎩</div>
            <h3 style="font-size: 1.25rem; font-weight: 800; color: #0f172a; margin-bottom: 0.5rem;">Trucuri Interactive</h3>
            <p style="color: #475569; font-size: 0.95rem;">Fiecare copil are ocazia să se implice. Folosim baghete uriașe, cărți colorate și pălării fermecate.</p>
          </div>
          <div style="background: white; padding: 2rem; border-radius: 16px; border: 1px solid #e2e8f0; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
            <div style="font-size: 3rem; margin-bottom: 1rem;">🕊️</div>
            <h3 style="font-size: 1.25rem; font-weight: 800; color: #0f172a; margin-bottom: 0.5rem;">Apariții Surpriză</h3>
            <p style="color: #475569; font-size: 0.95rem;">Porumbei sau un iepuraș adevărat pot apărea din cutii goale sau din pălăria magicianului!</p>
          </div>
          <div style="background: white; padding: 2rem; border-radius: 16px; border: 1px solid #e2e8f0; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
            <div style="font-size: 3rem; margin-bottom: 1rem;">🌟</div>
            <h3 style="font-size: 1.25rem; font-weight: 800; color: #0f172a; margin-bottom: 0.5rem;">Sărbătoritul Vedetă</h3>
            <p style="color: #475569; font-size: 0.95rem;">Va primi un rol principal și va ajuta la finalizarea marelui truc de la finalul spectacolului.</p>
          </div>
        </div>
        `
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 40,
      heading: 'Alege pachetul perfect pentru petrecerea ta',
      content: {
        body: `
        <div id="pachete" style="background: linear-gradient(180deg, #f8fafc 0%, #ffffff 100%); padding: 4rem 2rem; border-radius: 24px; margin: 3rem 0; width: 100%; box-shadow: 0 4px 20px rgba(0,0,0,0.03); border:1px solid #e2e8f0;">
          <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 3rem; max-width:1000px; margin: 0 auto;">
            
            <div style="background: white; padding: 3rem 2rem; border-radius: 24px; border: 1px solid #e2e8f0; text-align: center; display:flex; flex-direction:column; position:relative;">
              <h3 style="font-size: 1.8rem; font-weight: 900; color: #0f172a; margin-bottom:0.5rem;">Magic Show</h3>
              <span style="display:inline-block; font-size:1.1rem; font-weight:700; color:#3b82f6; margin-bottom:1.5rem;">Durată: 30 de Minute</span>
              <p style="color: #475569; margin: 0 0 2rem; line-height:1.7; font-size:1.05rem;">Conceput pentru menținerea atenției copiilor mai mici (3-6 ani). Un show extrem de dinamic, plin de culori, cu trucuri rapide și umor garantat. Nu apucă să se plictisească nicio secundă!</p>
              <ul style="text-align:left; color:#475569; margin-bottom:3rem; padding-left:1.5rem; line-height:1.8;">
                <li>✓ Trucuri cu dispariții de obiecte</li>
                <li>✓ Gaguri comice și implicare activă</li>
                <li>✓ Muzică de fundal pentru atmosferă</li>
              </ul>
              <a href="https://wa.me/40763795919" target="_blank" style="margin-top:auto; display: inline-block; padding: 1.25rem 2.5rem; background: #0f172a; color: white; border-radius: 99px; font-weight: 800; text-decoration: none; font-size:1.1rem; transition:transform 0.2s;">Cere Ofertă Preț</a>
            </div>

            <div style="background: white; padding: 3rem 2rem; border-radius: 24px; border: 3px solid #a855f7; box-shadow: 0 25px 50px -12px rgba(168,85,247, 0.15); text-align: center; display:flex; flex-direction:column; transform:scale(1.02); position:relative;">
              <span style="position: absolute; top: -16px; left: 50%; transform: translateX(-50%); background: linear-gradient(to right, #a855f7, #ec4899); color: white; padding: 8px 24px; border-radius: 99px; font-size: 0.9rem; font-weight: 800; letter-spacing:1px; box-shadow:0 4px 10px rgba(168,85,247,0.3);">CEL MAI SOLICITAT</span>
              <h3 style="font-size: 1.8rem; font-weight: 900; color: #0f172a; margin-bottom:0.5rem;">Iluzionism VIP</h3>
              <span style="display:inline-block; font-size:1.1rem; font-weight:700; color:#ec4899; margin-bottom:1.5rem;">Durată: 45 de Minute</span>
              <p style="color: #475569; margin: 0 0 2rem; line-height:1.7; font-size:1.05rem;">Experiența supremă! Recomandat pentru copiii de peste 5-6 ani care au capacitatea să înțeleagă magia complexă. Include trucuri cu foc rece (inofensiv) și momente unice.</p>
              <ul style="text-align:left; color:#475569; margin-bottom:3rem; padding-left:1.5rem; line-height:1.8;">
                <li>✓ Numere complexe de mentalism/iluzionism</li>
                <li>✓ Apariție Iepuraș/Porumbei (în funcție de disponibilitate)</li>
                <li>✓ Diplome "Magician Onorific" pentru sărbătorit</li>
                <li>✓ Sesiune foto la final</li>
              </ul>
              <a href="https://wa.me/40763795919" target="_blank" style="margin-top:auto; display: inline-block; padding: 1.25rem 2.5rem; background: linear-gradient(to right, #a855f7, #ec4899); color: white; border-radius: 99px; font-weight: 800; text-decoration: none; font-size:1.1rem; transition:transform 0.2s;">Cere Ofertă Preț</a>
            </div>

          </div>
        </div>
        `
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 50,
      heading: 'De ce să alegi un Magician Kassia Events?',
      content: {
        body: '<p style="font-size:1.15rem; line-height:1.7;">Diferența dintre o petrecere bună și una extraordinară o face profesionistul care o susține. Magicianul nostru nu este doar un om cu o pelerină care face scamatorii, ci un <strong>artist complet, antrenat în psihologia copilului</strong>. Știe exact când să pluseze cu glume, cum să gestioneze copiii foarte energici și cum să transforme orice timiditate într-un hohot de râs.</p><p style="font-size:1.15rem; line-height:1.7;">Folosim exclusiv recuzită profesională, sigură și adaptată (fără obiecte periculoase, fără fum toxic sau zgomote deranjante). Totul este gândit pentru ca petrecerea ta din București sau Ilfov să se desfășoare în perfectă siguranță.</p>'
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 60,
      heading: 'Detalii Organizatorice - Cum ne pregătim?',
      content: {
        body: '<ul style="font-size:1.15rem; line-height:1.8; color:#475569;"><li><strong>Spațiu necesar:</strong> Spectacolul necesită o zonă de minim 2x2 metri liberă (o mini-scenă improvizată), cu copiii așezați în semicerc în fața magicianului.</li><li><strong>Timp de pregătire:</strong> Magicianul va sosi cu aproximativ 20-30 de minute înainte de începerea show-ului. Va avea nevoie de un colț ferit de ochii copiilor pentru a-și pregăti "magia" în secret.</li><li><strong>Locație:</strong> Putem susține spectacolul acasă, în living, în curte (dacă vremea permite și e o zonă umbrită), la restaurant, loc de joacă sau grădiniță.</li></ul>'
      }
    },
    {
      page_id: page.id,
      section_type: 'gallery',
      order_index: 70,
      heading: 'Magia în Imagini',
      content: {}
    },
    {
      page_id: page.id,
      section_type: 'testimonials_section',
      order_index: 80,
      content: {}
    }
  ];
  
  const { error } = await supabase.from('kassia_page_sections').insert(sections);
  if (error) {
    console.error("ERROR INSERTING SECTIONS:", error);
    return;
  }

  // Insert FAQs
  const faqs = [
    {
      page_id: page.id,
      question: "La ce vârstă este recomandat spectacolul de magie?",
      answer: "Spectacolul nostru este excelent pentru copiii între 3 și 12 ani. Pachetul Magic Show de 30 de minute este ideal pentru vârstele 3-6 ani. Pachetul VIP de 45 de minute este perfect pentru copiii de peste 6 ani care înțeleg concepte complexe și sunt fascinați de cum funcționează iluzionismul.",
      order_index: 10
    },
    {
      page_id: page.id,
      question: "Cum rezerv un magician și cu cât timp înainte?",
      answer: "Recomandăm rezervarea cu cel puțin 2-3 săptămâni înainte, mai ales dacă evenimentul are loc în weekend (sâmbătă sau duminică). Rezervarea se face foarte simplu prin WhatsApp la 0763 795 919 sau telefonic.",
      order_index: 20
    },
    {
      page_id: page.id,
      question: "Apar animale vii în spectacolul de magie?",
      answer: "Da! Pachetul Iluzionism VIP poate include (în funcție de disponibilitatea artistului) apariția surpriză a unui iepuraș drăgălaș sau a porumbeilor.",
      order_index: 30
    },
    {
      page_id: page.id,
      question: "Putem chema magicianul și la grădiniță?",
      answer: "Absolut! Deplasăm magicienii la serbări, petreceri de sfârșit de an școlar, sau aniversări celebrate la grădiniță sau școală.",
      order_index: 40
    }
  ];

  const { error: errorFaq } = await supabase.from('kassia_faqs').insert(faqs);
  if (errorFaq) console.error("ERROR INSERTING FAQS:", errorFaq);

  // Gallery
  await supabase.from('kassia_gallery_items').delete().eq('page_id', page.id);
  const galleryItems = [
    { page_id: page.id, url: '/images/animatori/jocuri-interactive-petreceri-copii.jpg', alt_text: 'Magie copii', order_index: 10 },
    { page_id: page.id, url: '/images/animatori/animator-pictura-pe-fata-copii.jpg', alt_text: 'Surpriza magie', order_index: 20 },
    { page_id: page.id, url: '/images/animatori/baloane-modelabile-petreceri-copii.jpg', alt_text: 'Magician', order_index: 30 }
  ];
  const { error: errorGal } = await supabase.from('kassia_gallery_items').insert(galleryItems);
  if (errorGal) console.error("ERROR INSERTING GALLERY:", errorGal);

  console.log('GOD TIER Magic Page V2 successfully built!');
}

run();
