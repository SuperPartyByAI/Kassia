import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const sectorsData = {
  1: {
    faqs: [
      { q: "Cât de repede ajungeți la o petrecere în zona Băneasa sau Floreasca?", a: "Echipa Kassia se deplasează fără taxe suplimentare în tot Sectorul 1. Pentru locațiile foarte aglomerate din nordul Capitalei, vă recomandăm rezervarea cu cel puțin 7 zile înainte." },
      { q: "Organizați petreceri la restaurantele din zona de nord a Sectorului 1?", a: "Da, ne coordonăm constant cu restaurantele, terasele și locurile de joacă din Primăverii, Dorobanți și Herăstrău pentru ca momentul animației să nu deranjeze ceilalți clienți." }
    ],
    map: "Sector+1,+Bucuresti"
  },
  2: {
    faqs: [
      { q: "Cât de repede ajungeți la o petrecere în zona Colentina sau Obor?", a: "Echipa Kassia se deplasează rapid și fără taxe ascunse în tot Sectorul 2. Pentru weekenduri, rezervările în zona de est se fac de regulă cu o săptămână înainte." },
      { q: "Puteți veni la o petrecere într-un apartament din Pantelimon?", a: "Sigur! Adaptăm activitățile la spațiul disponibil. În apartamente ne concentrăm pe jocuri de magie interactivă, coregrafii statice și pictură pe față." }
    ],
    map: "Sector+2,+Bucuresti"
  },
  3: {
    faqs: [
      { q: "Acoperiți tot Sectorul 3, inclusiv Titan și Dristor?", a: "Da, suntem prezenți la petrecerile din Titan, Dristor, Vitan, Balta Albă și zona Unirii, fără a percepe vreo taxă de transport." },
      { q: "Câți animatori recomandați pentru o petrecere la grădiniță în Sectorul 3?", a: "Pentru grupele standard de grădiniță (peste 15 copii), recomandăm pachetul cu 2 animatori pentru o organizare perfectă a jocurilor și ștafetelor." }
    ],
    map: "Sector+3,+Bucuresti"
  },
  4: {
    faqs: [
      { q: "Aveți acoperire pentru Berceni și Apărătorii Patriei?", a: "Da, asigurăm deplasare gratuită în tot Sectorul 4, acoperind zonele Berceni, Tineretului, Giurgiului și Văcărești." },
      { q: "Organizați activități în parcurile din Sectorul 4?", a: "Da, putem organiza programul în Orășelul Copiilor sau Parcul Tineretului, cu mențiunea că spațiul trebuie să ne permită desfășurarea jocurilor în siguranță." }
    ],
    map: "Sector+4,+Bucuresti"
  },
  5: {
    faqs: [
      { q: "Asigurați animație în Cotroceni sau 13 Septembrie?", a: "Absolut! Venim direct la locația dumneavoastră din Sectorul 5 (Cotroceni, 13 Septembrie, Rahova, Ferentari) fără niciun cost suplimentar pentru deplasare." },
      { q: "Dacă petrecerea e la curte în Sectorul 5, aduceți boxă?", a: "Da, toți animatorii noștri au sistem propriu de sunet portabil, suficient de puternic pentru petreceri în curte sau aer liber." }
    ],
    map: "Sector+5,+Bucuresti"
  },
  6: {
    faqs: [
      { q: "Cât de repede ajungeți la o petrecere în Militari Residence sau Drumul Taberei?", a: "Suntem activi în tot Sectorul 6 (Militari, Drumul Taberei, Crângași, Giulești). Dat fiind traficul din zonă, ne luăm mereu o marjă de eroare pentru a ajunge 100% la timp." },
      { q: "Puteți ține programul la un loc de joacă închiriat din Sectorul 6?", a: "Sigur, ne sincronizăm de multe ori cu personalul locațiilor din zonă (inclusiv mall-uri sau locuri de joacă private) pentru a aduce tortul și a menține energia copiilor sus." }
    ],
    map: "Sector+6,+Bucuresti"
  }
};

async function run() {
  for (let s = 1; s <= 6; s++) {
    const slug = `animatori-petreceri-copii-sector-${s}`;
    console.log(`Processing Level 3 for ${slug}...`);
    
    // Get page id
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', slug).single();
    if (!page) {
      console.log(`Page not found: ${slug}`);
      continue;
    }

    const { faqs, map } = sectorsData[s];

    // 1. Insert Local FAQs
    for (let i = 0; i < faqs.length; i++) {
        // Check if exists
        const { data: existingFaq } = await supabase.from('kassia_faqs').select('id').eq('page_id', page.id).eq('question', faqs[i].q);
        if (!existingFaq || existingFaq.length === 0) {
            await supabase.from('kassia_faqs').insert({
                page_id: page.id,
                question: faqs[i].q,
                answer: faqs[i].a,
                order_index: i + 1 // Will appear first
            });
            console.log(`Inserted FAQ ${i+1} for Sector ${s}`);
        }
    }

    // 2. Insert Google Maps Embed (only if it doesn't exist)
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', page.id);
    const hasMap = sections.some(sec => sec.content && JSON.stringify(sec.content).includes('google.com/maps'));
    
    if (!hasMap) {
        const iframeHtml = `<div style="width: 100%; height: 400px; border-radius: 16px; overflow: hidden; box-shadow: 0 10px 15px -3px rgba(0,0,0,0.1);"><iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?q=${map}&t=&z=13&ie=UTF8&iwloc=&output=embed"></iframe></div>`;
        
        await supabase.from('kassia_page_sections').insert({
            page_id: page.id,
            section_type: 'content_block',
            heading: null,
            content: {
                body: iframeHtml,
                title: `Aria de acoperire în Sectorul ${s}`
            },
            order_index: 25 // Towards the bottom
        });
        console.log(`Inserted Google Map for Sector ${s}`);
    } else {
        console.log(`Map already exists for Sector ${s}`);
    }
  }
}

run().then(() => console.log('Level 3 DB updates complete.'));
