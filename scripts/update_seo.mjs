import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });

import { createClient } from '@supabase/supabase-js';

const sbUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const sbKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(sbUrl, sbKey);

async function run() {
  const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db';

  console.log('Updating metadata...');
  const { error: pageErr } = await supabase.from('kassia_pages')
    .update({
      meta_title: 'Animatori Petreceri Copii București & Ilfov | Închirieri Personaje',
      meta_description: 'Rezervă animatori petreceri copii în București și Ilfov. Alege din 70+ personaje de poveste! Programe interactive, magie, face-painting și baloane. Fără taxe ascunse.'
    })
    .eq('id', pageId);
  
  if (pageErr) console.error(pageErr);

  console.log('Updating section 1: De ce aleg părinții Kassia...');
  const { error: s1Err } = await supabase.from('kassia_page_sections')
    .update({
      section_type: 'content',
      content: '<p>Alegerea agenției potrivite pentru petrecerea copilului tău face diferența între un eveniment memorabil și unul stresant. Părinții din București ne aleg pentru:</p><ul><li><strong>Profesionalism și punctualitate:</strong> Animatorii noștri ajung întotdeauna la timp și sunt pregătiți să înceapă imediat.</li><li><strong>Costume Premium:</strong> Peste 70 de personaje (Elsa, Spiderman, Mickey, Batman și multe altele) în costume autentice, igienizate după fiecare eveniment.</li><li><strong>Flexibilitate:</strong> Venim acasă, la locul de joacă, la restaurant sau la grădiniță, oriunde în București și județul Ilfov.</li></ul>'
    })
    .eq('id', '9ca37172-3e69-4b7a-bf13-8eea6d2b97c0');
  
  if (s1Err) console.error(s1Err);

  console.log('Updating section 2: Ce evităm când organizăm activități...');
  const { error: s2Err } = await supabase.from('kassia_page_sections')
    .update({
      section_type: 'content',
      content: '<p>Experiența noastră de peste 10 ani ne-a învățat nu doar ce funcționează, ci și <strong>ce trebuie evitat complet</strong> într-un program cu copii:</p><ul><li><strong>Excluderea copiilor timizi:</strong> Animatorii Kassia folosesc tehnici blânde pentru a integra fiecare copil în jocurile interactive, fără a forța pe nimeni.</li><li><strong>Materiale ieftine:</strong> Folosim exclusiv vopsele de face-painting testate dermatologic și non-toxice, potrivite pentru pielea sensibilă a copiilor.</li><li><strong>Muzică nepotrivită:</strong> Avem un playlist atent selecționat, adaptat vârstei copiilor, fără conținut explicit sau irelevant.</li></ul>'
    })
    .eq('id', '5d66b0a9-a299-4ed4-8192-e33f9ef9cdd5');

  if (s2Err) console.error(s2Err);

  console.log('Done.');
}

run();
