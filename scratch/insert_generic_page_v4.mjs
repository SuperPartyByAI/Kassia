import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null }
});

const PAGE_ID = '3a754972-74d7-4632-9dfa-2aa9be7682db';
const PATH = '/animatori-petreceri-copii/';

async function runStagedInsert() {
  console.log("=== INIȚIERE FLUX STAGED INSERT V4 ===");

  // 1. Verificare existență
  const { data: existingPage } = await supabase
    .from('kassia_pages')
    .select('id, path')
    .eq('path', PATH)
    .maybeSingle();

  if (existingPage) {
    console.log(`[AVERTISMENT] Pagina cu URL-ul ${PATH} există deja în baza de date cu ID-ul: ${existingPage.id}.`);
    // Salvăm backup local al paginii curente înainte de orice altă acțiune
    const { data: oldSections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', existingPage.id);
    const { data: oldFaqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', existingPage.id);
    const backup = { page: existingPage, sections: oldSections, faqs: oldFaqs };
    fs.writeFileSync('scratch/backup_generic_page_before_insert.json', JSON.stringify(backup, null, 2));
    console.log("Backup-ul paginii existente a fost salvat la: scratch/backup_generic_page_before_insert.json");
    console.log("Pentru siguranță, scriptul se oprește pentru a preveni suprascrierea.");
    process.exit(0);
  }

  try {
    // 2. Inserare Pagină ca DRAFT / NOINDEX / SITEMAP FALSE
    console.log("Pas 1: Inserare kassia_pages cu status 'draft'...");
    const { error: pageErr } = await supabase
      .from('kassia_pages')
      .insert({
        id: PAGE_ID,
        path: PATH,
        slug: 'animatori-petreceri-copii',
        page_type: 'service_pillar',
        h1: 'Animatori pentru petreceri de copii',
        title: 'Animatori petreceri copii | Servicii de animație și personaje',
        meta_title: 'Animatori petreceri copii | Servicii de animație și personaje',
        meta_description: 'Animatori pentru petreceri de copii, cu jocuri interactive, mascote, pictură pe față, modelaj de baloane, mini-disco și activități tematice adaptate vârstei copiilor.',
        canonical_url: 'https://www.kassia.ro/animatori-petreceri-copii/',
        status: 'draft',
        index_status: 'noindex',
        include_in_sitemap: false,
        priority: 0.9,
        updated_at: new Date().toISOString()
      });

    if (pageErr) throw new Error(`Inserare pagină eșuată: ${pageErr.message}`);

    // 3. Inserare secțiuni
    console.log("Pas 2: Inserare secțiuni (conținut atenuat)...");
    const sections = [
      { id: 'e1f8ba36-0568-450f-a38e-09dcba821bc1', page_id: PAGE_ID, section_type: 'hero', order_index: 0, heading: 'Hero Section', content: { body: 'Descoperă servicii de animație pentru petreceri de copii, concepute pentru a aduce energie și veselie la evenimente. Programele orientative includ jocuri interactive, dansuri tematice, pictură pe față și modelaj de baloane, fiind structurate cu scopul de a susține o atmosferă veselă pentru cei mici.', cta_text: 'Trimite detaliile petrecerii', cta_url: '/contact/', image_url: '/images/animatori/animatori-copii-bucuresti-hero.webp', image_alt: 'Animatori pentru petreceri de copii' } },
      { id: 'f3d5ba42-789a-412d-b0a3-a612dfba98e1', page_id: PAGE_ID, section_type: 'service_details', order_index: 1, heading: 'Ce rol are un animator la un eveniment pentru copii', content: { heading: 'Ce rol are un animator la un eveniment pentru copii', body: 'Prezența unui animator la o petrecere aduce energie și sprijin în organizare, oferind celor mici o atmosferă dinamică. Rolul animatorului este de a atrage interesul copiilor și de a-i ghida prin activități adaptate dinamicii grupului. Acesta coordonează momentele de joacă, încurajează implicarea tuturor participanților și contribuie la menținerea unei atmosfere calde. În timp ce copiii se implică în activități într-un cadru prietenos, părinții și adulții pot beneficia de mai mult timp pentru socializare. Pentru detalii suplimentare, ne puteți contacta prin formularul de pe pagina de <a href="/contact/">Contact</a>.', image_url: '/images/animatori/animatori-copii-bucuresti-program-animatie.webp', image_alt: 'Animator coordonând activități pentru copii' } },
      { id: 'a1d82f34-1234-4567-89ab-cdef01234567', page_id: PAGE_ID, section_type: 'activities_grid', order_index: 2, heading: 'Activități tematice și divertisment interactiv', content: { cards: [ { title: 'Jocuri interactive', body: 'Ștafete distractive, concursuri de grup și provocări pline de haz care încurajează mișcarea și spiritul de echipă.', image_url: '/images/animatori/animatori-copii-bucuresti-jocuri-interactive.webp', image_alt: 'Jocuri interactive pentru copii' }, { title: 'Pictură pe față', body: 'Transformări inedite în personaje îndrăgite, realizate cu culori sigure, antialergice și ușor de curățat. Detalii suplimentare sunt disponibile pe pagina dedicată pentru <a href="/pictura-pe-fata-copii-bucuresti/">Pictură pe față</a>.', image_url: '/images/animatori/animatori-copii-bucuresti-pictura-pe-fata.webp', image_alt: 'Pictură pe față copii' }, { title: 'Modelaj din baloane', body: 'Figurine colorate sub formă de flori, săbii sau animăluțe, modelate pe loc și care pot fi oferite copiilor ca amintire. Detalii sunt disponibile pe pagina dedicată pentru <a href="/modelaj-baloane-copii-bucuresti/">Modelaj de baloane</a>.', image_url: '/images/animatori/animatori-copii-bucuresti-modelaj-baloane.webp', image_alt: 'Figurine din baloane modelate' }, { title: 'Mini-disco și dansuri', body: 'Coregrafii simple, muzică veselă și mișcări accesibile care susțin implicarea micilor dansatori. Informații suplimentare găsiți pe pagina dedicată pentru <a href="/mini-disco-copii-bucuresti/">Mini-disco</a>.', image_url: '/images/animatori/animatori-copii-bucuresti-mini-disco.webp', image_alt: 'Copii dansând la mini-disco' }, { title: 'Mascote îndrăgite', body: 'Apariții simpatice ale personajelor îndrăgite din desene animate, oferind momente potrivite pentru fotografii. Detalii despre personaje găsiți pe pagina de <a href="/mascote-petreceri-copii-bucuresti/">Mascote pentru petreceri</a>.', image_url: '/images/animatori/animatori-copii-bucuresti-mascota-generica.webp', image_alt: 'Mascotă pentru petrecere' }, { title: 'Ateliere practice', body: 'Activități creative de crafting și modelaj manual, unde copiii își pot dezvolta imaginația și pot realiza mici decorațiuni tematice.', image_url: '/images/animatori/animatori-copii-bucuresti-atelier-creativ.webp', image_alt: 'Atelier de creație pentru copii' } ] } },
      { id: 'b2e93f45-2345-5678-9abc-def012345678', page_id: PAGE_ID, section_type: 'service_details', order_index: 3, heading: 'Cum alegi personajele potrivite în funcție de vârstă', content: { heading: 'Cum alegi personajele potrivite în funcție de vârstă', body: 'Selectarea tematicii potrivite este utilă pentru dinamica petrecerii. Pentru copiii foarte mici și copiii de grădiniță, sunt indicate de regulă personaje blânde, mascote simpatice și o interacțiune calmă, bazată pe povești scurte și jocuri senzoriale simple. În cazul în care avem copii de școală primară, personajele dinamice, supereroii, prințesele active sau personajele din desene animate pot susține interesul acestora. Pentru copiii mai mari, activitățile bazate pe jocuri de logică, provocări pe echipe și coregrafiile moderne sunt adesea preferate în detrimentul mascotelor clasice, oferindu-le o experiență adaptată preocupărilor lor. Puteți consulta opțiunile noastre de personaje pe pagina dedicată pentru <a href="/mascote-petreceri-copii-bucuresti/">Mascote pentru petreceri</a>.', image_url: '/images/animatori/animatori-copii-bucuresti-varste-copii.webp', image_alt: 'Copii de diferite vârste la petrecere' } },
      { id: 'c3a04f56-3456-6789-abcd-ef0123456789', page_id: PAGE_ID, section_type: 'service_details', order_index: 4, heading: 'Tipuri de evenimente unde prezența animatorilor aduce valoare', content: { heading: 'Tipuri de evenimente unde prezența animatorilor aduce valoare', body: 'Serviciile de animație sunt concepute pentru a se adapta diverselor contexte familiale și educaționale. La aniversări, animatorul ajută la ghidarea ritmului jocurilor, menținând atenția participanților. La botezuri, nunți sau alte evenimente de familie, prezența acestuia oferă copiilor activități dedicate de joacă, facilitând relaxarea părinților. De asemenea, animatorii pot aduce un plus de dinamism la serbări în grădinițe, activități la școală sau evenimente desfășurate în spații de joacă, contribuind la o coordonare atentă a activităților.', image_url: '/images/animatori/animatori-copii-bucuresti-evenimente.webp', image_alt: 'Evenimente de familie cu animatori' } },
      { id: 'd4b15f67-4567-789a-bcde-f0123456789a', page_id: PAGE_ID, section_type: 'service_details', order_index: 5, heading: 'Cum se desfășoară un program de animație de succes', content: { heading: 'Cum se desfășoară un program de animație de succes', body: 'Un program de animație este construit de obicei pe o dinamică echilibrată între momentele de mișcare și cele de repaus. De regulă, evenimentul debutează cu o etapă de acomodare, în care animatorii facilitează integrarea copiilor în poveste. Urmează jocurile interactive de grup și micile competiții care ajută la consumarea energiei într-un mod coordonat. Ulterior, activitatea se îndreaptă către latura artistică și creativă, incluzând mini-disco, pictură pe față și modelaj de baloane. Această structură contribuie la menținerea atenției copiilor pe parcursul activităților. Pentru a analiza diverse variante de organizare, puteți consulta secțiunea dedicată de <a href="/pachete-animatori-copii-bucuresti/">Programe animatori copii</a>.', image_url: '/images/animatori/animatori-copii-bucuresti-program-animatie.webp', image_alt: 'Animator desfășurând programul la petrecere' } },
      { id: 'e5c26f78-5678-89ab-cdef-0123456789ab', page_id: PAGE_ID, section_type: 'service_details', order_index: 6, heading: 'Servicii conexe care completează atmosfera de sărbătoare', content: { heading: 'Servicii conexe care completează atmosfera de sărbătoare', body: 'Pentru a completa decorul festiv, serviciile de animație pot fi asociate cu elemente complementare de organizare. Decorurile tematice realizate din ghirlande de baloane sau panourile foto personalizate oferă un fundal plăcut pentru fotografiile de familie. De asemenea, introducerea unei pinate colorate sau prezența mascotelor la momentul tortului pot adăuga un plus de suspans și divertisment. Aceste elemente opționale susțin amenajarea unui spațiu de petrecere primitor.', image_url: '/images/animatori/animatori-copii-bucuresti-servicii-complementare.webp', image_alt: 'Decoruri de baloane și servicii complementare' } },
      { id: 'f6d37f89-6789-9abc-def0-123456789abc', page_id: PAGE_ID, section_type: 'process_steps', order_index: 7, heading: 'Ghid pentru planificarea programului de animație', content: { steps: [ { title: 'Stabilirea profilului invitaților', body: 'Luarea în considerare a numărului de copii și a vârstei medii a acestora ajută la selectarea activităților potrivite.' }, { title: 'Alegerea tematicii și a personajelor', body: 'Alegerea personajelor preferate ale copilului contribuie la personalizarea atmosferei.' }, { title: 'Configurarea activităților în locație', body: 'Adaptarea jocurilor în funcție de spațiul disponibil (acasă, restaurant, aer liber).' }, { title: 'Pregătirea accesoriilor și a materialelor', body: 'Pregătirea din timp a recuzitei de joc, a culorilor pentru face-painting și a baloanelor de modelat.' } ], image_url: '/images/animatori/animatori-copii-bucuresti-desfasurare-petrecere.webp', image_alt: 'Ghid planificare program' } },
      { id: 'a7e48fa0-789a-a123-b456-c789d0123456', page_id: PAGE_ID, section_type: 'cta_final', order_index: 9, heading: 'Planifică activitățile pentru petrecerea copilului', content: { body: 'Suntem deschiși să te ajutăm în planificarea programului de divertisment pentru copii. Ne poți trimite detalii despre data petrecerii, categoriile de vârstă ale invitaților și tematica dorită, iar noi îți vom propune soluții adaptate contextului tău. De asemenea, poți consulta paginile noastre locale pentru detalii specifice zonelor de activitate, cum ar fi secțiunile pentru <a href="/animatori-petreceri-copii-bucuresti/">Animatori petreceri copii București</a> și <a href="/animatori-petreceri-copii-sector-1/">Animatori petreceri copii Sector 1</a>.', cta_text: 'Trimite detaliile petrecerii', cta_url: '/contact/', image_url: '/images/animatori/animatori-copii-bucuresti-cta-final.webp', image_alt: 'Planifică activitățile cu Kassia' } }
    ];

    for (const s of sections) {
      const { error: secErr } = await supabase.from('kassia_page_sections').insert({ ...s, updated_at: new Date().toISOString() });
      if (secErr) throw new Error(`Eroare la secțiunea ${s.id}: ${secErr.message}`);
    }
    console.log("Secțiuni introduse cu succes.");

    // 4. Inserare FAQs
    console.log("Pas 3: Inserare FAQs...");
    const faqs = [
      { id: 'f1a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c', page_id: PAGE_ID, order_index: 1, question: 'Ce activități desfășoară un animator la o petrecere?', answer: 'Animatorul ghidează copiii prin jocuri dinamice, concursuri interactive, dansuri pe muzică ritmată (mini-disco), sesiuni de pictură pe față și oferă figurine modelate din baloane colorate.' },
      { id: 'f2a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c', page_id: PAGE_ID, order_index: 2, question: 'Cum se alege personajul potrivit pentru copii?', answer: 'Alegerea se face în funcție de preferințele copilului și de vârsta acestuia. Personajele din povești sunt potrivite pentru cei mai mici, în timp ce supereroii și atelierele tematice tind să atragă copiii mai mari.' },
      { id: 'f3a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c', page_id: PAGE_ID, order_index: 3, question: 'De ce spațiu este nevoie pentru jocurile cu animatori?', answer: 'Activitățile pot fi adaptate pentru orice spațiu, fie că petrecerea are loc în interiorul casei, la o grădiniță, într-un restaurant sau în aer liber (în curte sau parc).' },
      { id: 'f4a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c', page_id: PAGE_ID, order_index: 4, question: 'Cum se adaptează programul dacă sunt copii de vârste diferite?', answer: 'Echipa propune o alternanță între jocurile dinamice de grup și activitățile individuale mai lejere (cum ar fi pictura pe față sau modelajul de baloane), pentru a încuraja participarea fiecărui copil.' },
      { id: 'f5a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c', page_id: PAGE_ID, order_index: 5, question: 'Animatorii pot asigura și decorul din baloane?', answer: 'Da, evenimentele pot fi completate cu decoruri tematice realizate din ghirlande de baloane, panouri foto tematice sau arcade potrivite stilului ales pentru petrecere.' },
      { id: 'f6a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c', page_id: PAGE_ID, order_index: 6, question: 'Cu cât timp înainte este recomandat să discutăm detaliile?', answer: 'Este recomandat să ne contactați cu câteva săptămâni înainte de eveniment pentru a verifica disponibilitatea echipei pentru data și ora dorite.' },
      { id: 'f7a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c', page_id: PAGE_ID, order_index: 7, question: 'Ce recuzită aduc animatorii la petrecere?', answer: 'Echipa aduce accesoriile specifice desfășurării jocurilor (corzi, tuneluri, saci, recuzită tematică) și materiale profesionale pentru pictură facială și modelaj.' },
      { id: 'f8a2b3c4-d5e6-4f7a-8b9c-0d1e2f3a4b5c', page_id: PAGE_ID, order_index: 8, question: 'Cum se pregătește locația înainte de sosirea echipei?', answer: 'Se recomandă eliberarea unei zone de joacă sigure, fără obstacole periculoase, și organizarea unui spațiu minim care să permită deplasarea în siguranță a copiilor.' }
    ];

    for (const f of faqs) {
      const { error: faqErr } = await supabase.from('kassia_faqs').insert(f);
      if (faqErr) throw new Error(`Eroare la FAQ ${f.id}: ${faqErr.message}`);
    }
    console.log("FAQ-uri introduse cu succes.");

    // 5. Verificare cantitativă (Auditare date)
    console.log("Pas 4: Validare cantitativă a datelor stocate...");
    const { data: dbSections } = await supabase.from('kassia_page_sections').select('id').eq('page_id', PAGE_ID);
    const { data: dbFaqs } = await supabase.from('kassia_faqs').select('id').eq('page_id', PAGE_ID);

    if (!dbSections || dbSections.length !== 9) {
      throw new Error(`Eroare validare: numărul de secțiuni din DB este ${dbSections?.length || 0}, se așteptau exact 9.`);
    }
    if (!dbFaqs || dbFaqs.length !== 8) {
      throw new Error(`Eroare validare: numărul de FAQ-uri din DB este ${dbFaqs?.length || 0}, se așteptau exact 8.`);
    }

    console.log(`[VALIDARE REUȘITĂ] Pagina a fost creată corect ca DRAFT. Secțiuni înregistrate: ${dbSections.length}/9. FAQ-uri înregistrate: ${dbFaqs.length}/8.`);
    console.log("=== FLUX STAGED INSERT V4 COMPLETAT CU SUCCES ===");

  } catch (err) {
    console.error("[EROARE CRITICĂ DETECTATĂ] Inserarea staged a eșuat. Procesul se oprește. Pagina rămâne în stadiul de Draft/Noindex pentru siguranță și depanare manuală. Nu s-a rulat nicio instrucțiune DELETE.", err.message);
    process.exit(1);
  }
}

runStagedInsert().catch(console.error);
