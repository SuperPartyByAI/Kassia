import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  // Section 1: Intro (97ebab88-042b-4754-ab9d-c04cf43a1851)
  const newIntro = `<p>Organizăm programe interactive cu <a href="/animatori-petreceri-copii/">animatori pentru petreceri de copii</a>, adaptate în funcție de spațiu și vârsta copiilor. Venim cu energia și recuzita potrivite indiferent dacă evenimentul are loc în mediul urban sau în zona metropolitană.</p>`;
  await supabase.from('kassia_page_sections').update({ content: { body: newIntro } }).eq('id', '97ebab88-042b-4754-ab9d-c04cf43a1851');

  // Section 2: Sector 4 (267f5d49-0867-4fda-9b03-e3e288c4a58b)
  const newSector4 = `<p>Cartierul Berceni este una dintre cele mai dinamice zone din <a href="/animatori-petreceri-copii-sector-4/">Sector 4</a>. Ne adresăm familiilor din Piața Sudului, Constantin Brâncoveanu, Apărătorii Patriei, zona Metalurgiei sau Grand Arena. Pentru aceste zone, organizăm frecvent evenimente în apartamente, restaurante, grădinițe și spații de joacă indoor, adaptând jocurile pentru a se potrivi mediului restrâns sau animat al orașului.</p>`;
  await supabase.from('kassia_page_sections').update({ content: { body: newSector4 } }).eq('id', '267f5d49-0867-4fda-9b03-e3e288c4a58b');

  // Section 3: Activities (ab27ded1-3bda-4997-b0b7-9941d162690b)
  const newActivities = `<p>Programul este versatil și creat pentru a menține toți copiii implicați. Printre activitățile noastre se numără jocuri de grup, dansuri, mini-disco, concursuri, coregrafii și modelaj de baloane. Pentru momentele de relaxare, adăugăm activități creative și activități la măsuță.</p><p>De asemenea, prezența de <a href="/personaje-animatori-copii-bucuresti/">personaje pentru petreceri copii</a> și <a href="/mascote-petreceri-copii-bucuresti/">mascote pentru copii</a> poate fi integrată ușor, respectând întotdeauna principiul unei adaptări naturale după vârstă și spațiu.</p>`;
  await supabase.from('kassia_page_sections').update({ content: { body: newActivities } }).eq('id', 'ab27ded1-3bda-4997-b0b7-9941d162690b');

  // Section 4: Logistica (4304842b-59aa-4721-af52-efc3b4d0447a)
  // Need to insert "detalii pentru programele cu animatori" -> /preturi-animatori-copii-bucuresti/
  const newComuna = `<p>Pe lângă zona urbană, organizăm evenimente și pentru familiile din ansamblurile rezidențiale noi din Ilfov. Dacă organizați o petrecere la casă, într-o curte spațioasă, o vilă sau pentru un eveniment amplu în aer liber, animatorii noștri pot desfășura jocuri de mișcare și întreceri adaptate spațiului exterior.</p><p>Pentru comuna Berceni, discutăm toate aceste <a href="/preturi-animatori-copii-bucuresti/">detalii pentru programele cu animatori</a> și confirmăm logistica după ce primim adresa evenimentului.</p>`;
  await supabase.from('kassia_page_sections').update({ content: { body: newComuna } }).eq('id', '4304842b-59aa-4721-af52-efc3b4d0447a');


  // NEW SECTION: Carduri dual-intent
  const cardBody = `
<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 1.5rem; margin-top: 1rem;">
  <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #10b981;">
    <h3 style="margin-top:0; font-size: 1.1rem; color: #1e293b;">Cartierul Berceni / Sector 4</h3>
    <p style="margin-bottom:0; font-size:0.95rem; color: #475569;">Pentru apartamente, restaurante, grădinițe și spații de joacă din Piața Sudului, Constantin Brâncoveanu, Apărătorii Patriei, Metalurgiei și Grand Arena, folosim activități compacte, jocuri de echipă și momente creative adaptate spațiului interior.</p>
  </div>
  <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; border-left: 4px solid #10b981;">
    <h3 style="margin-top:0; font-size: 1.1rem; color: #1e293b;">Comuna Berceni / Ilfov</h3>
    <p style="margin-bottom:0; font-size:0.95rem; color: #475569;">Pentru case, curți, vile și ansambluri rezidențiale, programul poate include mai multe jocuri de mișcare, mini-disco, ștafete și activități în aer liber. Pentru comuna Berceni, confirmăm detaliile logistice după ce primim adresa evenimentului.</p>
  </div>
</div>
  `;
  await supabase.from('kassia_page_sections').insert({
    page_id: pageId,
    heading: 'Berceni urban sau comuna Berceni: alegem programul după locație',
    content: { body: cardBody },
    created_at: new Date().toISOString()
  });

  // NEW SECTION: Detalii logistice
  const detaliiBody = `<p>Pentru a pregăti programul potrivit, ne ajută să știm adresa evenimentului, tipul locației, vârsta copiilor, numărul aproximativ de participanți, dacă activitățile se desfășoară în interior sau exterior și dacă există o temă sau un personaj preferat.</p>`;
  await supabase.from('kassia_page_sections').insert({
    page_id: pageId,
    heading: 'Ce detalii ne ajută înainte de eveniment',
    content: { body: detaliiBody },
    created_at: new Date().toISOString()
  });

  // NEW FAQs
  await supabase.from('kassia_faqs').insert([
    {
      page_id: pageId,
      question: 'Care este diferența dintre Berceni cartier și comuna Berceni pentru organizarea petrecerii?',
      answer: 'În cartierul Berceni, programul este gândit de obicei pentru apartamente, restaurante, grădinițe sau spații de joacă. În comuna Berceni, unde apar mai des curți și spații exterioare, putem adapta activitățile pentru mișcare, mini-disco și jocuri de grup în aer liber.'
    },
    {
      page_id: pageId,
      question: 'Acoperiți și zona Metalurgiei, Grand Arena și Apărătorii Patriei?',
      answer: 'Da. Pentru cartierul Berceni și zona de sud, primim solicitări din Piața Sudului, Constantin Brâncoveanu, Apărătorii Patriei, Metalurgiei și zona Grand Arena. Programul se adaptează după tipul locației și spațiul disponibil.'
    }
  ]);

  console.log("DB Content micro-upgrade applied.");
})();
