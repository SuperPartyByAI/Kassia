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
      heading: 'Spectacole de Magie și Iluzionism pentru Copii în București',
      content: {
        body: `
<div style="font-size:1.3rem; font-weight:700; margin-bottom:1.5rem; display:flex; flex-direction:column; gap:0.75rem; color:#f8fafc;">
  <span style="color:#fcd34d; font-size:1.4rem; text-transform:uppercase; letter-spacing:1px;">Un show spectaculos, interactiv și 100% sigur!</span>
  <span>Sărbătoritul devine Magicianul Onorific. Trucuri incredibile, apariții surpriză și energie magică pentru cea mai tare petrecere!</span>
</div>
<div style="display:flex; justify-content:center; gap:1.25rem; flex-wrap:wrap; margin-top:2.5rem;">
  <a href="#pachete" class="btn-primary" style="background:#0f172a; color:white; padding:16px 32px; border-radius:99px; text-decoration:none; font-weight:800; font-size:1.1rem;">Vezi Pachetele Magice</a>
  <a href="https://wa.me/40763795919?text=Buna!%20Vreau%20detalii%20despre%20spectacolul%20de%20magie." class="btn-primary" style="background:#25D366; color:white; padding:16px 32px; border-radius:99px; text-decoration:none; font-weight:800; font-size:1.1rem; box-shadow:0 10px 15px -3px rgba(37,211,102,0.4);">Verifică Disponibilitatea</a>
</div>
        `,
        image_url: "/images/animatori/animator-petrecere-copii-bucuresti-hero.webp"
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 20,
      heading: 'Magie adevărată care fascinează copiii și uimește părinții',
      content: {
        subheading: 'Dincolo de scamatorii: o experiență interactivă completă',
        body: `
        <p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Un spectacol de magie Kassia Events nu este o reprezentație statică la care copiii doar privesc. Este o piesă de teatru interactivă, extrem de amuzantă, concepută pe baza psihologiei celor mici. Magicianul nostru știe cum să capteze instantaneu atenția a zeci de copii, menținându-i complet fascinați timp de 30 sau 45 de minute, fără ca vreunul să se plictisească.</p>
        <p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">De la apariția spectaculoasă a iepurașului din joben și transformarea unor obiecte banale în fața ochilor lor, până la numere complexe de mentalism (pentru copiii mai mari), fiecare truc este însoțit de un val de râsete și aplauze. Iar partea cea mai bună? Sărbătoritul este implicat direct și primește cel mai mare ropot de aplauze!</p>
        
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 2rem; margin-top: 3rem;">
          <div style="background: white; padding: 2rem; border-radius: 16px; border: 1px solid #e2e8f0; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
            <div style="font-size: 3rem; margin-bottom: 1rem;">🎩</div>
            <h3 style="font-size: 1.25rem; font-weight: 800; color: #0f172a; margin-bottom: 0.5rem;">Comedie și Magie</h3>
            <p style="color: #475569; font-size: 0.95rem;">Râsul este cheia. Trucurile noastre sunt asezonate cu o tonă de umor special gândit pentru copii.</p>
          </div>
          <div style="background: white; padding: 2rem; border-radius: 16px; border: 1px solid #e2e8f0; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
            <div style="font-size: 3rem; margin-bottom: 1rem;">🕊️</div>
            <h3 style="font-size: 1.25rem; font-weight: 800; color: #0f172a; margin-bottom: 0.5rem;">Animale Surpriză</h3>
            <p style="color: #475569; font-size: 0.95rem;">Apariția porumbeilor sau a iepurașului alb este momentul de vârf care lasă copiii cu gura căscată.</p>
          </div>
          <div style="background: white; padding: 2rem; border-radius: 16px; border: 1px solid #e2e8f0; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
            <div style="font-size: 3rem; margin-bottom: 1rem;">🌟</div>
            <h3 style="font-size: 1.25rem; font-weight: 800; color: #0f172a; margin-bottom: 0.5rem;">Rol Principal</h3>
            <p style="color: #475569; font-size: 0.95rem;">Sărbătoritul primește pelerina și bagheta, devenind ucenicul oficial al magicianului.</p>
          </div>
        </div>
        `
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 40,
      heading: 'Alege Pachetul de Magie potrivit',
      content: {
        body: `
        <div id="pachete" style="background: linear-gradient(180deg, #f8fafc 0%, #ffffff 100%); padding: 4rem 2rem; border-radius: 24px; margin: 3rem 0; width: 100%; box-shadow: 0 4px 20px rgba(0,0,0,0.03); border:1px solid #e2e8f0;">
          <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 3rem; max-width:1000px; margin: 0 auto;">
            
            <div style="background: white; padding: 3rem 2rem; border-radius: 24px; border: 1px solid #e2e8f0; text-align: center; display:flex; flex-direction:column; position:relative;">
              <h3 style="font-size: 1.8rem; font-weight: 900; color: #0f172a; margin-bottom:0.5rem;">Magic Show (30 Min)</h3>
              <span style="display:inline-block; font-size:1.1rem; font-weight:700; color:#3b82f6; margin-bottom:1.5rem;">Ideal pentru vârsta 3-6 ani</span>
              <p style="color: #475569; margin: 0 0 2rem; line-height:1.7; font-size:1.05rem;">Un spectacol rapid, alert, plin de elemente vizuale și culori. Evităm trucurile complexe care necesită multă răbdare, axându-ne pe comedie de situație și apariții vizuale imediate.</p>
              <ul style="text-align:left; color:#475569; margin-bottom:3rem; padding-left:1.5rem; line-height:1.8;">
                <li>✓ Trucuri cu dispariții și apariții fulger</li>
                <li>✓ Gaguri comice potrivite vârstei</li>
                <li>✓ Sărbătoritul capătă puteri magice</li>
              </ul>
              <a href="https://wa.me/40763795919" target="_blank" style="margin-top:auto; display: inline-block; padding: 1.25rem 2.5rem; background: #0f172a; color: white; border-radius: 99px; font-weight: 800; text-decoration: none; font-size:1.1rem; transition:transform 0.2s;">Cere Ofertă Preț</a>
            </div>

            <div style="background: white; padding: 3rem 2rem; border-radius: 24px; border: 3px solid #a855f7; box-shadow: 0 25px 50px -12px rgba(168,85,247, 0.15); text-align: center; display:flex; flex-direction:column; transform:scale(1.02); position:relative;">
              <span style="position: absolute; top: -16px; left: 50%; transform: translateX(-50%); background: linear-gradient(to right, #a855f7, #ec4899); color: white; padding: 8px 24px; border-radius: 99px; font-size: 0.9rem; font-weight: 800; letter-spacing:1px; box-shadow:0 4px 10px rgba(168,85,247,0.3);">PREMIUM VIP</span>
              <h3 style="font-size: 1.8rem; font-weight: 900; color: #0f172a; margin-bottom:0.5rem;">Iluzionism VIP (45 Min)</h3>
              <span style="display:inline-block; font-size:1.1rem; font-weight:700; color:#ec4899; margin-bottom:1.5rem;">Pentru copiii 6-12 ani</span>
              <p style="color: #475569; margin: 0 0 2rem; line-height:1.7; font-size:1.05rem;">Show-ul care te lasă fără cuvinte! Recomandat copiilor care deja înțeleg concepte complexe și încearcă să "prindă" magicianul. Trucurile sunt mult mai avansate, incluzând foc rece inofensiv și levitații.</p>
              <ul style="text-align:left; color:#475569; margin-bottom:3rem; padding-left:1.5rem; line-height:1.8;">
                <li>✓ Numere de mentalism / citirea gândurilor</li>
                <li>✓ Efecte speciale sigure (foc rece, fum)</li>
                <li>✓ Apariție animale (porumbel/iepuraș)</li>
                <li>✓ Sesiune foto extinsă cu sărbătoritul</li>
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
      order_index: 45,
      heading: 'Spectacol de Magie acasă, la curte, restaurant sau grădiniță',
      content: {
        body: '<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Unul dintre marile avantaje ale spectacolelor noastre de magie este <strong>versatilitatea locației</strong>. Magicianul nostru poate adapta show-ul pentru aproape orice tip de spațiu, aducând magia exact acolo unde are loc petrecerea ta.</p><ul style="font-size:1.15rem; line-height:1.8; color:#475569;"><li><strong>Acasă (În Living):</strong> Creăm o mini-scenă direct în sufragerie. Trucurile de proximitate funcționează perfect aici.</li><li><strong>La Curte / În Aer Liber:</strong> Un spațiu excelent, dar avem nevoie de o zonă ferită de vânt puternic sau soare direct pentru a proteja recuzita și animalele.</li><li><strong>La Restaurant / Sală de Evenimente (Botez, Nuntă, Tăierea Moțului):</strong> Magicianul captează atenția copiilor (și adesea și a adulților), oferindu-le o activitate captivantă în timp ce restul invitaților se relaxează.</li><li><strong>La Grădiniță sau Școală:</strong> Ideal pentru serbări sau zile de naștere sărbătorite cu colegii de clasă. Magicianul știe să gestioneze grupuri mari de 20-30 de copii simultan.</li></ul>'
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 50,
      heading: 'Ce EVITĂM cu strictețe în timpul spectacolului?',
      content: {
        body: '<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Spre deosebire de iluzioniștii pentru adulți, magia pentru copii necesită un grad maxim de siguranță și o cu totul altă abordare psihologică. La Kassia Events garantăm că:</p><ul style="font-size:1.15rem; line-height:1.8; color:#475569;"><li><strong>Fără foc periculos:</strong> Folosim doar "foc rece" (care nu arde și se stinge instantaneu), doar acolo unde spațiul permite.</li><li><strong>Fără trucuri care sperie:</strong> Evităm iluziile care implică obiecte ascuțite, "tăieri" sau orice poate fi perceput ca înfricoșător de copiii sub 7 ani.</li><li><strong>Fără glume nepotrivite:</strong> Limbajul și atitudinea sunt 100% prietenoase, educative și adaptate vârstei copiilor, respectând standardele de calitate Kassia.</li><li><strong>Nu ridiculizăm copiii:</strong> Unii magicieni amatori fac glume pe seama copiilor. Noi construim trucul astfel încât copilul să iasă victorios și aplaudat.</li></ul>'
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 60,
      heading: 'Cum decurge prezența magicianului (Pas cu Pas)',
      content: {
        body: '<ol style="font-size:1.15rem; line-height:1.8; color:#475569; padding-left:1.5rem;"><li><strong>Sosirea:</strong> Magicianul ajunge la locație cu 20-30 de minute înainte de ora stabilită. Va fi îmbrăcat casual și va avea nevoie de un spațiu ferit (o baie, o altă cameră) pentru a-și pregăti recuzita în secret (costumația, animalele etc.).</li><li><strong>Pregătirea "Micii Scene":</strong> Într-un spațiu de minim 2x2 metri, își va așeza măsuța magică. Copiii vor fi invitați să se așeze pe jos, în semicerc, pentru a asigura un unghi de vizionare perfect.</li><li><strong>Spectacolul (30/45 min):</strong> Începe show-ul! Muzică, râsete, trucuri interactive, culminând cu apariția iepurașului sau trucul grandios final în care sărbătoritul capătă puteri magice.</li><li><strong>Sesiunea Foto:</strong> După finalul furtunos, magicianul mai rămâne 5-10 minute pentru fotografii alături de sărbătorit (și eventual cu iepurașul, în condiții sigure).</li></ol>'
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 70,
      heading: 'Diferența de adaptare: 3-6 ani vs. 7-12 ani',
      content: {
        body: '<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Rețeta succesului nostru este personalizarea. Un truc de cărți matematic va plictisi un copil de 4 ani, dar va fascina un preadolescent de 10 ani.</p><div style="display:flex; flex-direction:column; gap:1.5rem;"><div style="background:#f8fafc; padding:1.5rem; border-left:4px solid #3b82f6;"><strong>Pentru 3-6 ani:</strong> Focus pe vizual și comedie. Folosim baghete care se rup "din greșeală", eșarfe care își schimbă culoarea, mingiuțe care dispar din mână, și trucuri în care magicianul "greșește" intenționat pentru ca cei mici să îl corecteze râzând.</div><div style="background:#f8fafc; padding:1.5rem; border-left:4px solid #a855f7;"><strong>Pentru 7-12 ani:</strong> Focus pe mister și imposibil. Trucuri de mentalism (cum ai ghicit cartea?), levitație a obiectelor mici, inele chinezești și efecte care sfidează legile fizicii, tratând copiii ca pe adulți inteligenți.</div></div>'
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 80,
      heading: 'Zone acoperite pentru Spectacolul de Magie',
      content: {
        body: '<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Suntem prezenți zilnic cu momente de magie pe tot teritoriul Municipiului București și în toate localitățile din județul Ilfov. Organizăm spectacole în: Sectorul 1, Sectorul 2, Sectorul 3, Sectorul 4, Sectorul 5, Sectorul 6.</p><p style="font-size:1.15rem; line-height:1.7;"><strong>Județul Ilfov:</strong> Otopeni, Tunari, Voluntari, Pipera, Pantelimon, Bragadiru, Popești-Leordeni, Berceni, Corbeanca, Snagov, Mogoșoaia, Chitila și restul localităților limitrofe. <em>(Notă: Pentru Ilfov se aplică o taxă modică de transport calculată transparent pe baza distanței).</em></p>'
      }
    },
    {
      page_id: page.id,
      section_type: 'service_details',
      order_index: 90,
      heading: 'Magician pentru Botez și Tăierea Moțului (Turtei)',
      content: {
        body: '<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">În mod tradițional, la botezuri sau la prima aniversare (tăierea moțului), sărbătoritul este prea mic pentru a înțelege magia. Totuși, **spectacolul de magie este una dintre cele mai rezervate opțiuni pentru aceste evenimente!** De ce?</p><p style="font-size:1.15rem; line-height:1.7;">Pentru că la un botez există întotdeauna un grup de 10-15 copii invitați (cu vârste între 4 și 12 ani). În timp ce adulții socializează, mănâncă sau dansează, un spectacol de magie de 45 de minute transformă un colț al restaurantului într-un hub de distracție totală, menținând toți copiii ocupați, fascinați și cuminți!</p>'
      }
    },
    {
      page_id: page.id,
      section_type: 'gallery',
      order_index: 100,
      heading: 'Magia Kassia în Imagini',
      content: {}
    },
    {
      page_id: page.id,
      section_type: 'cta_final',
      order_index: 110,
      heading: 'Planifică un moment magic garantat!',
      content: {}
    },
    {
      page_id: page.id,
      section_type: 'testimonials_section',
      order_index: 120,
      content: {}
    }
  ];
  
  const { error } = await supabase.from('kassia_page_sections').insert(sections);
  if (error) {
    console.error("ERROR INSERTING SECTIONS:", error);
    return;
  }

  // Insert massive FAQs
  const faqs = [
    {
      page_id: page.id,
      question: "La ce vârstă este recomandat spectacolul de magie?",
      answer: "Spectacolul este excelent pentru copiii de peste 3 ani. Pachetul Magic Show (30 min) este creat vizual pentru preșcolari, în timp ce Iluzionism VIP (45 min) este fantastic pentru școlarii peste 6-7 ani.",
      order_index: 10
    },
    {
      page_id: page.id,
      question: "Cum rezerv un magician și cu cât timp înainte?",
      answer: "Cel mai sigur este să programați cu 2-3 săptămâni în avans, mai ales pentru sâmbătă sau duminică la prânz. Rezervarea se face telefonic sau pe WhatsApp la 0763 795 919.",
      order_index: 20
    },
    {
      page_id: page.id,
      question: "Apar animale vii în spectacolul de magie?",
      answer: "Da! Pachetul Iluzionism VIP include de regulă apariția unui porumbel sau iepuraș (vă rugăm să verificați disponibilitatea exactă la momentul rezervării, deoarece depinde de artistul alocat).",
      order_index: 30
    },
    {
      page_id: page.id,
      question: "De cât spațiu este nevoie în casă/restaurant?",
      answer: "Magicianul are nevoie de o zonă liberă de aproximativ 2x2 metri pentru el și măsuța lui, plus spațiu în fața sa pentru ca toți copiii să poată sta așezați în semicerc (ca la teatru).",
      order_index: 40
    },
    {
      page_id: page.id,
      question: "Magicianul este îmbrăcat mereu cu pelerină și joben?",
      answer: "Stilul nostru este modern! Unii artiști adoptă stilul clasic cu joben, dar majoritatea au un look contemporan, foarte îngrijit, cu veste cu paiete, papion și o ținută profesionistă, fără a arăta demodați.",
      order_index: 50
    },
    {
      page_id: page.id,
      question: "Ce se întâmplă dacă sunt prea puțini copii?",
      answer: "Magia funcționează chiar și cu 3-4 copii! De fapt, la petrecerile restrânse, interacțiunea este mult mai profundă, fiecare copil participând la aproape fiecare truc.",
      order_index: 60
    },
    {
      page_id: page.id,
      question: "Asigurați sonorizare proprie?",
      answer: "Da, magicianul vine echipat cu o boxă portabilă pentru fundalul muzical și sunetele de efect. Nu este necesar să ne conectați la sistemul restaurantului.",
      order_index: 70
    },
    {
      page_id: page.id,
      question: "Se poate prelungi spectacolul peste 45 de minute?",
      answer: "Din experiența noastră, capacitatea de concentrare maximă a copiilor pe o singură activitate de tip 'spectacol' este de 45 de minute. Orice depășește această durată duce la agitație. Recomandăm îmbinarea magiei cu un program cu animatori.",
      order_index: 80
    }
  ];

  const { error: errorFaq } = await supabase.from('kassia_faqs').insert(faqs);
  if (errorFaq) console.error("ERROR INSERTING FAQS:", errorFaq);

  // Gallery
  await supabase.from('kassia_gallery_items').delete().eq('page_id', page.id);
  const galleryItems = [
    { page_id: page.id, url: '/images/animatori/jocuri-interactive-petreceri-copii.jpg', alt_text: 'Magician Bucuresti', order_index: 10 },
    { page_id: page.id, url: '/images/animatori/animator-pictura-pe-fata-copii.jpg', alt_text: 'Copii uimiti magie', order_index: 20 },
    { page_id: page.id, url: '/images/animatori/baloane-modelabile-petreceri-copii.jpg', alt_text: 'Trucuri petrecere', order_index: 30 }
  ];
  const { error: errorGal } = await supabase.from('kassia_gallery_items').insert(galleryItems);
  if (errorGal) console.error("ERROR INSERTING GALLERY:", errorGal);

  console.log('BEHEMOTH Magic Page V3 successfully built!');
}

run();
