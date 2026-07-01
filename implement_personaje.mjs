import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import { v4 as uuidv4 } from 'uuid';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  console.log("=== EXECUTING DB WRITE FOR PERSONAJE PAGE ===");

  // 1. Create the new page in kassia_pages
  const newPageId = uuidv4();
  const pageData = {
    id: newPageId,
    slug: 'personaje-animatori-copii-bucuresti',
    page_type: 'service_pillar',
    path: '/personaje-animatori-copii-bucuresti/',
    title: 'Personaje animatori copii București și Ilfov | Peste 300 personaje Kassia',
    meta_title: 'Personaje animatori copii București și Ilfov | Peste 300 personaje Kassia',
    meta_description: 'Alege din peste 300 de personaje pentru animatori copii în București și Ilfov: prințese, supereroi, mascote, personaje din desene animate și personaje sezoniere pentru petreceri, grădinițe și evenimente pentru copii.',
    h1: 'Personaje animatori copii în București și Ilfov',
    status: 'published',
    canonical_url: 'https://www.kassia.ro/personaje-animatori-copii-bucuresti/',
    index_status: 'index',
    include_in_sitemap: true,
    created_at: new Date().toISOString(),
    updated_at: new Date().toISOString()
  };

  const { error: pageErr } = await supabase.from('kassia_pages').insert(pageData);
  if (pageErr) { console.error("Error creating page:", pageErr); process.exit(1); }
  console.log("Created new page:", pageData.path);

  // 2. Create sections for the new page
  const sections = [
    { type: 'hero_content', title: '', body: 'Kassia pune la dispoziție peste 300 de costume și personaje tematice pentru petreceri de copii în București și Ilfov. Poți alege personaje de poveste, prințese, supereroi, mascote, personaje vesele pentru copii mici, personaje inspirate din desene animate și variante sezoniere pentru evenimente organizate pe tot parcursul anului.', cta_text: 'Trimite detaliile petrecerii', cta_url: '#contact' },
    { type: 'content_block', title: 'Personaje foarte cerute pentru petreceri copii', body: 'Pentru preferințele cele mai întâlnite la petrecerile de copii, avem pregătite cele mai căutate personaje ale momentului. Printre preferințele clasice și moderne se numără Elsa, Anna, Spider-Man, Mickey Mouse, Minnie Mouse, Batman, Sonic, Stitch, Paw Patrol (Chase, Marshall, Skye), Mario, Luigi, Pikachu, Wednesday, Barbie, Bluey, Labubu, Hello Kitty, Minecraft / Creeper, Lightning McQueen și Scooby Doo.' },
    { type: 'content_block', title: 'Prințese și personaje de poveste', body: 'O petrecere de basm are nevoie de personajul potrivit. Selecția noastră include prințese îndrăgite, zâne, sirene și eroine magice. Printre cele mai solicitate se află Elsa, Anna, Rapunzel, Ariel, Cenușăreasa, Albă ca Zăpada, Belle, Jasmine, Moana / Vaiana, Tinkerbell și Unicornul vesel.' },
    { type: 'content_block', title: 'Supereroi pentru petreceri copii', body: 'Pentru petreceri pline de energie și aventură, supereroii noștri sunt pregătiți să aducă acțiunea direct la evenimentul tău. Poți invita personaje precum Spider-Man, Batman, Superman, Iron Man, Captain America, Hulk, Thor, Black Panther, Deadpool, Joker, Harley Quinn, precum și alți eroi de acțiune potriviți pentru petreceri tematice dinamice.' },
    { type: 'content_block', title: 'Mascote și personaje pentru copii mici', body: 'Cei mai mici sărbătoriți (1-4 ani) interacționează foarte bine cu mascote și personaje blânde, prietenoase și colorate. Avem disponibile costume cu Mickey, Minnie, Peppa Pig, Bluey, Cocomelon, Hello Kitty, Paw Patrol, Masha, Ursul, precum și o varietate de mascote animale adorabile: ursuleți, iepurași, căței și pisici.' },
    { type: 'content_block', title: 'Personaje moderne și trenduri actuale', body: 'Petrecerile copiilor țin pasul cu noile lansări și trenduri. Colecția Kassia este actualizată constant pentru a include personaje moderne, precum Labubu, Stitch, Angel, Wednesday, Enid, Bluey, personajele din Gabby’s Dollhouse, SuperKitties, universul Minecraft cu Creeper, frații Mario și universul Pikachu sau Sonic.' },
    { type: 'content_block', title: 'Personaje pentru ocazii speciale', body: 'Nu doar zilele de naștere necesită animație. Personajele noastre sunt disponibile pentru o gamă largă de evenimente: aniversări acasă sau la restaurant, petreceri la grădiniță, serbări școlare, botezuri, petreceri de familie, evenimente corporate cu invitați copii, petreceri de 1 Iunie sau petreceri tematice private.' },
    { type: 'content_block', title: 'Personaje sezoniere pe tot parcursul anului', body: 'Atmosfera de sărbătoare prinde viață prin personajele tematice potrivite sezonului:\n- Crăciun: Moș Crăciun, Crăciuniță, spiriduși, ren, om de zăpadă, Grinch.\n- Paște: Iepurașul de Paște, iepuriță, mascote de primăvară.\n- Halloween: Vrăjitoare, dovleac, vampir prietenos, pirați, fantome vesele, Wednesday.\n- 1 Iunie / serbări: Clovni, zâne, mascote, personaje colorate și magicieni.' },
    { type: 'content_block', title: 'Cum alegi personajul potrivit', body: 'Alegerea personajului potrivit ajută la crearea unei petreceri mai bine adaptate copiilor invitați. Îți recomandăm să ții cont de: vârsta copiilor invitați, tematica generală a petrecerii, spațiul disponibil pentru jocuri și activități, numărul de copii prezenți, energia grupului și, cel mai important, preferințele sărbătoritului. De asemenea, confirmarea din timp ajută la rezervarea personajului pentru data evenimentului.' },
    { type: 'content_block', title: 'Personaje în București și Ilfov', body: 'Indiferent de locația aleasă, animatorii și personajele noastre vin acolo unde se desfășoară distracția. Personajele pot veni la petreceri organizate acasă, la restaurant, la grădiniță, într-un spațiu de joacă, în curte, într-o sală de evenimente sau în orice locație privată din București și județul Ilfov.' },
    { type: 'content_block', title: 'Mențiune conformitate', body: 'Costumele și personajele folosite de echipa Kassia sunt achiziționate din surse conforme, iar selecția finală se stabilește în funcție de disponibilitatea pentru data evenimentului.' }
  ];

  for (let i=0; i<sections.length; i++) {
    const secData = {
      id: uuidv4(),
      page_id: newPageId,
      section_type: sections[i].type,
      order_index: i + 1,
      content: {
        title: sections[i].title,
        body: sections[i].body,
        cta_text: sections[i].cta_text,
        cta_url: sections[i].cta_url
      }
    };
    await supabase.from('kassia_page_sections').insert(secData);
  }
  console.log("Inserted 11 sections for the new page.");

  // 3. Create FAQs
  const faqs = [
    { q: "Câte personaje sunt disponibile pentru petreceri copii?", a: "<p>Punem la dispoziție o selecție de peste 300 de costume și personaje tematice, acoperind o gamă largă de preferințe pentru toate grupele de vârstă.</p>" },
    { q: "Putem alege un personaj anume pentru petrecere?", a: "<p>Da. Selecția finală se stabilește la momentul rezervării, în funcție de preferințele sărbătoritului și de disponibilitatea costumului pentru data aleasă.</p>" },
    { q: "Aveți prințese pentru petreceri de fete?", a: "<p>Da, punem la dispoziție o colecție bogată de prințese, zâne și eroine din povești, potrivite pentru petreceri cu tematică magică sau de basm.</p>" },
    { q: "Aveți supereroi pentru petreceri de copii?", a: "<p>Avem o selecție vastă de supereroi și personaje de acțiune, potrivite pentru petreceri dinamice și pline de energie, adresate atât băieților, cât și fetelor.</p>" },
    { q: "Aveți mascote potrivite pentru copii mici?", a: "<p>Da, pentru copiii de 1-4 ani recomandăm mascote blânde, animale prietenoase și personaje colorate care interacționează blând și nu îi sperie pe cei mici.</p>" },
    { q: "Aveți personaje pentru grădinițe și serbări?", a: "<p>Desigur. Personajele și animatorii noștri pot pregăti programe adaptate pentru grupe mai mari de copii la grădinițe, școli și serbări tematice.</p>" },
    { q: "Aveți personaje tematice pentru Crăciun, Paște sau Halloween?", a: "<p>Da, pe parcursul anului sunt disponibile personaje sezoniere specifice, precum Moș Crăciun, Spiriduși, Iepurașul de Paște, vrăjitoare, pirați și multe altele.</p>" },
    { q: "Se pot combina personajele cu pictură pe față și modelaj de baloane?", a: "<p>Da, majoritatea animatorilor pot include în programul lor și momente de pictură pe față sau modelaj de baloane, stabilite în funcție de programul ales.</p>" },
    { q: "Personajele sunt disponibile pentru deplasare și în Ilfov?", a: "<p>Da, personajele se pot deplasa atât în București (toate sectoarele), cât și la evenimente private din județul Ilfov.</p>" },
    { q: "Cum confirmăm disponibilitatea personajului dorit?", a: "<p>Disponibilitatea se confirmă telefonic sau pe WhatsApp, în momentul în care ne oferiți detaliile petrecerii (data, locația și durata evenimentului).</p>" },
    { q: "Putem schimba personajul dacă se schimbă tematica petrecerii?", a: "<p>Da, personajul poate fi schimbat, cu condiția să ne anunțați din timp și ca noul costum dorit să fie disponibil pentru ziua și ora evenimentului dumneavoastră.</p>" },
    { q: "Ce informații trebuie trimise pentru alegerea personajului?", a: "<p>Pentru o organizare eficientă, vă rugăm să ne transmiteți data, locația, numărul estimativ de copii, vârsta acestora și tematica preferată.</p>" }
  ];

  for (let i=0; i<faqs.length; i++) {
    const faqData = {
      id: uuidv4(),
      page_id: newPageId,
      question: faqs[i].q,
      answer: faqs[i].a,
      order_index: i + 1
    };
    await supabase.from('kassia_faqs').insert(faqData);
  }
  console.log("Inserted 12 FAQs for the new page.");

  // 4. Append internal linking sections to existing pages
  const internalLinksMap = [
    { path: '/', title: 'Peste 300 de personaje pentru petreceri copii', body: '<p>Alege dintre personaje de poveste, supereroi, mascote și personaje tematice pentru copii de vârste diferite.</p>', cta: 'Vezi personajele →' },
    { path: '/animatori-petreceri-copii/', title: 'Personaje pentru petreceri de copii', body: '<p>Kassia pune la dispoziție peste 300 de costume și personaje tematice pentru petreceri de copii în București și Ilfov. Poți alege personaje de poveste, prințese, supereroi, mascote, personaje vesele pentru copii mici și personaje dinamice pentru grupuri mai mari.</p>', cta: 'Vezi personajele disponibile →' },
    { path: '/animatori-petreceri-copii-sector-1/', title: 'Alegerea personajului pentru eveniment', body: '<p>Pentru petrecerile organizate în Sector 1 (Primăverii, Dorobanți, Floreasca, Băneasa etc.), poți alege dintr-o varietate de peste 300 de personaje pentru copii. Colecția include prințese, supereroi, mascote prietenoase și figuri populare din desene animate. Disponibilitatea se confirmă împreună cu echipa noastră în momentul rezervării.</p>', cta: 'Vezi personajele disponibile →' },
    { path: '/animatori-petreceri-copii-sector-2/', title: 'Personaje tematice pentru petrecerea ta', body: '<p>Dacă organizezi evenimentul în Sector 2 (Obor, Colentina, Pantelimon, Tei etc.), animatorul potrivit face toată diferența. Pune la dispoziția invitaților peste 300 de personaje, de la eroi de acțiune până la personaje de basm, adaptate vârstei copiilor.</p>', cta: 'Vezi personajele disponibile →' },
    { path: '/animatori-petreceri-copii-sector-3/', title: 'Personaje variate pentru copii', body: '<p>Pentru petrecerile din Sector 3 (Titan, Dristor, Vitan, Balta Albă etc.), personajul poate fi ales dintr-un catalog generos de peste 300 de opțiuni. Fie că preferi prințese, mascote pentru copii mici sau supereroi, selecția finală se stabilește în funcție de preferințele sărbătoritului și disponibilitate.</p>', cta: 'Vezi personajele disponibile →' },
    { path: '/animatori-petreceri-copii-sector-4/', title: 'Selecția personajului potrivit', body: '<p>Evenimentele din Sector 4 (Berceni, Tineretului, Văcărești etc.) prind viață cu ajutorul a peste 300 de personaje tematice. Ai libertatea să alegi costumul care se potrivește cu tematica aniversării, de la personaje clasice la trendurile moderne ale momentului.</p>', cta: 'Vezi personajele disponibile →' },
    { path: '/animatori-petreceri-copii-sector-5/', title: 'Mascote și personaje animate', body: '<p>Indiferent dacă petrecerea are loc în Cotroceni, Rahova sau 13 Septembrie (Sector 5), poți alege o variantă potrivită pentru eveniment. De la mascote de pluș pentru cei mai mici invitați, până la eroi dinamici pentru grupele mai mari, găsești sute de personaje disponibile.</p>', cta: 'Vezi personajele disponibile →' },
    { path: '/animatori-petreceri-copii-sector-6/', title: 'Alege personajul preferat', body: '<p>Petrecerile organizate în Drumul Taberei, Militari sau Crângași (Sector 6) pot include personaje din colecția noastră de peste 300 de costume, în funcție de disponibilitatea pentru data aleasă. Consultă opțiunile de prințese, supereroi și personaje la modă pentru a pregăti o atmosferă potrivită copiilor invitați.</p>', cta: 'Vezi personajele disponibile →' },
    { path: '/preturi-animatori-copii-bucuresti/', title: '', body: '<p>Alegerea personajului se confirmă separat, în funcție de disponibilitatea costumului dorit pentru data evenimentului. Ai la dispoziție o gamă variată din care să alegi.</p>', cta: 'Vezi personajele disponibile →' }
  ];

  for (const item of internalLinksMap) {
    const { data: pageData } = await supabase.from('kassia_pages').select('id').eq('path', item.path).single();
    if (!pageData) {
      console.warn("Target page not found for path:", item.path);
      continue;
    }
    
    // get max order index
    const { data: maxOrderData } = await supabase.from('kassia_page_sections').select('order_index').eq('page_id', pageData.id).order('order_index', { ascending: false }).limit(1);
    let nextOrder = 100;
    if (maxOrderData && maxOrderData.length > 0) nextOrder = maxOrderData[0].order_index + 1;

    const appendedSection = {
      id: uuidv4(),
      page_id: pageData.id,
      section_type: 'content_block',
      order_index: nextOrder,
      content: {
        title: item.title,
        body: item.body,
        cta_text: item.cta,
        cta_url: '/personaje-animatori-copii-bucuresti/'
      }
    };
    await supabase.from('kassia_page_sections').insert(appendedSection);
    console.log(`Appended internal link to ${item.path}`);
  }

  console.log("=== DB WRITE COMPLETED SUCCESSFULLY ===");
}

run();
