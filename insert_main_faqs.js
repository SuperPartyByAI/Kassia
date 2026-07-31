import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase
        .from('kassia_pages')
        .select('id')
        .eq('slug', 'animatori-petreceri-copii')
        .single();
        
    if (!page) return;

    // Check if FAQs already exist to prevent duplicates
    const { data: existingFaq } = await supabase
        .from('kassia_page_sections')
        .select('id')
        .eq('page_id', page.id)
        .eq('section_type', 'faq');
        
    if (existingFaq && existingFaq.length > 0) {
        console.log("FAQs already exist!");
        return;
    }

    const faqs = [
        {
            heading: "Se plătește taxă de transport pentru București sau Ilfov?",
            body: "Nu, pentru toate evenimentele desfășurate în interiorul Municipiului București (orice sector) <strong>deplasarea este 100% gratuită</strong>. Pentru zonele din județul Ilfov (ex: Voluntari, Pipera, Bragadiru, Popești-Leordeni etc.), se percepe o mică taxă de transport menită exclusiv să acopere costul combustibilului (de obicei între 30 și 50 de lei, în funcție de distanță). Costul total îți va fi comunicat clar de la început."
        },
        {
            heading: "Ce se întâmplă dacă sunt mai mult de 15 copii la petrecere?",
            body: "Pentru a asigura o atmosferă super distractivă, implicarea fiecărui copil la jocuri și suficient timp pentru pictura pe față și modelajul de baloane, recomandăm <strong>alegerea a cel puțin doi animatori</strong> dacă aveți peste 15 copii invitați. Acest lucru previne formarea cozilor la pictură și menține o dinamică perfectă a jocurilor pe echipe."
        },
        {
            heading: "Cu cât timp înainte trebuie făcută rezervarea?",
            body: "Pentru weekend-uri (sâmbătă și duminică) care sunt de departe cele mai aglomerate, recomandăm ferm să plasați rezervarea cu <strong>cel puțin 2-3 săptămâni înainte</strong> pentru a vă asigura că personajul mult visat de copilul dumneavoastră este disponibil la ora dorită. Pentru zilele din cursul săptămânii, o rezervare cu câteva zile înainte este, de cele mai multe ori, suficientă."
        },
        {
            heading: "Animatorii folosesc materiale sigure pentru pictura pe față?",
            body: "Absolut! Siguranța copiilor este prioritatea Kassia Events. Folosim <strong>exclusiv vopsele profesionale pe bază de apă, hipoalergenice și non-toxice</strong> (ex: Snazaroo, Diamond FX), special create pentru pielea sensibilă a copiilor. Se îndepărtează extrem de ușor cu apă și puțin săpun sau cu șervețele umede."
        }
    ];

    let orderIndex = 110;
    for (const faq of faqs) {
        await supabase.from('kassia_page_sections').insert({
            page_id: page.id,
            section_type: 'faq',
            heading: faq.heading,
            content: { body: faq.body },
            order_index: orderIndex++
        });
    }

    console.log("Inserted 4 FAQs successfully.");
}

run();
