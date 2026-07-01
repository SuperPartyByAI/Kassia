import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = 'ab1e48b1-f898-4ddc-bd39-e479d5181674';

  // 1. Update the existing feature card
  const unPersonajBody = `
<p style="margin-bottom:1rem;">Alegerea corectă depinde strict de amploarea evenimentului:</p>
<ul style="list-style:none; padding:0; display:flex; flex-direction:column; gap:0.8rem;">
  <li style="background:rgba(168,85,247,0.05); padding:1rem; border-radius:8px; border-left:3px solid var(--primary);"><strong>Un personaj animator poate fi suficient când</strong> grupul este restrâns (sub 12-15 copii), iar spațiul de joc este bine delimitat și vizibil în totalitate.</li>
  <li style="background:rgba(236,72,153,0.05); padding:1rem; border-radius:8px; border-left:3px solid var(--accent);"><strong>Două personaje animatoare pot fi potrivite când</strong> numărul copiilor crește, curtea este foarte spațioasă, cu zone oarbe, sau când copiii au vârste foarte diferite.</li>
  <li style="background:rgba(16,185,129,0.05); padding:1rem; border-radius:8px; border-left:3px solid #10b981;"><strong>Recomandarea finală se face după</strong> o analiză rapidă a locației pe care ne-o descrieți.</li>
</ul>
  `;
  await supabase.from('kassia_page_sections').update({ content: { body: unPersonajBody, image_url: '/images/locatii/voluntari_un_personaj_sau_doua.png', image_alt: 'Alegerea între un personaj sau două' } }).eq('id', 'e2bb9b4c-5cb7-4a6c-8b5e-c85cef708a40');

  // 2. Insert new block: Scenarii frecvente
  const scenariiBody = `
<div style="display:grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap:1.5rem; margin-top:1rem;">
  <div style="background:#f8fafc; padding:1.5rem; border-radius:12px; border-left:4px solid var(--primary);">
    <h4 style="color:var(--primary-dark); margin-bottom:0.5rem; font-size:1.1rem; margin-top:0;">Curte Mare / Vilă în Voluntari</h4>
    <p style="font-size:0.95rem; margin:0; line-height:1.5;">Spațiul extins necesită jocuri de cursă, vânătoare de comori și puncte clare de regrupare pentru a menține toți copiii implicați în aceeași activitate, evitând dispersarea.</p>
  </div>
  <div style="background:#f8fafc; padding:1.5rem; border-radius:12px; border-left:4px solid var(--accent);">
    <h4 style="color:var(--accent); margin-bottom:0.5rem; font-size:1.1rem; margin-top:0;">Ansamblu Rezidențial în Pipera</h4>
    <p style="font-size:0.95rem; margin:0; line-height:1.5;">Activitățile sunt adaptate pentru zone comune, integrând jocuri de echipă sigure și evitând deranjarea vecinătăților, păstrând în același timp dinamica ridicată.</p>
  </div>
  <div style="background:#f8fafc; padding:1.5rem; border-radius:12px; border-left:4px solid #10b981;">
    <h4 style="color:#10b981; margin-bottom:0.5rem; font-size:1.1rem; margin-top:0;">Spațiu Mixt (Iancu Nicolae / Andronache)</h4>
    <p style="font-size:0.95rem; margin:0; line-height:1.5;">Când petrecerea are loc pe o terasă care se prelungește în curte, pregătim tranziții fluide între ateliere statice la umbră și jocuri dinamice pe gazon.</p>
  </div>
</div>
  `;
  await supabase.from('kassia_page_sections').insert({
    page_id: pageId,
    order_index: 7,
    section_type: 'split_image_left',
    heading: 'Scenarii frecvente pentru petreceri în Voluntari și Pipera',
    content: {
      body: scenariiBody,
      image_url: '/images/locatii/voluntari_scenarii_frecvente.png',
      image_alt: 'Scenarii frecvente pentru petreceri copii Voluntari'
    }
  });

  // 3. Insert new block: Ce evitam
  const evitamBody = `
<p>Experiența ne-a învățat că spațiile largi pot dispersa rapid atenția copiilor. Pentru a asigura o petrecere reușită în curți mari sau vile, evităm cu atenție următoarele situații:</p>
<ul style="list-style:none; padding:0; margin-top:1.5rem; display:flex; flex-direction:column; gap:1rem;">
  <li style="display:flex; align-items:flex-start; gap:1rem;">
    <span style="color:#ef4444; font-size:1.2rem; line-height:1;">✖</span>
    <span style="line-height:1.4;"><strong>Copii lăsați să se împrăștie în mai multe zone:</strong> Pierderea dinamicii de grup duce rapid la plictiseală.</span>
  </li>
  <li style="display:flex; align-items:flex-start; gap:1rem;">
    <span style="color:#ef4444; font-size:1.2rem; line-height:1;">✖</span>
    <span style="line-height:1.4;"><strong>Jocuri fără punct de regrupare:</strong> Fiecare activitate necesită un semnal clar de reunire a echipei.</span>
  </li>
  <li style="display:flex; align-items:flex-start; gap:1rem;">
    <span style="color:#ef4444; font-size:1.2rem; line-height:1;">✖</span>
    <span style="line-height:1.4;"><strong>Activități lângă zone sensibile:</strong> Evităm amplasarea jocurilor dinamice lângă grătar, piscină, scări sau obiecte fragile.</span>
  </li>
  <li style="display:flex; align-items:flex-start; gap:1rem;">
    <span style="color:#ef4444; font-size:1.2rem; line-height:1;">✖</span>
    <span style="line-height:1.4;"><strong>Lipsa unei variante de interior/terasă:</strong> Vremea capricioasă impune întotdeauna existența unui plan secundar.</span>
  </li>
  <li style="display:flex; align-items:flex-start; gap:1rem;">
    <span style="color:#ef4444; font-size:1.2rem; line-height:1;">✖</span>
    <span style="line-height:1.4;"><strong>Program fără tranziții între jocuri:</strong> Pauzele necontrolate sparg implicarea grupului; asigurăm un flux continuu.</span>
  </li>
</ul>
  `;
  await supabase.from('kassia_page_sections').insert({
    page_id: pageId,
    order_index: 8,
    section_type: 'split_image_right',
    heading: 'Ce evităm când organizăm activități în curți mari',
    content: {
      body: evitamBody,
      image_url: '/images/locatii/voluntari_ce_evitam.png',
      image_alt: 'Evităm haosul la petreceri copii Voluntari'
    }
  });

  // 4. Insert new block: Cum decurge programul pas cu pas
  const pasCuPasBody = `
<div style="display:flex; flex-direction:column; gap:1.5rem; margin-top:1.5rem;">
  <div style="display:flex; gap:1rem; align-items:flex-start;">
    <div style="background:var(--primary); color:white; width:32px; height:32px; display:flex; align-items:center; justify-content:center; border-radius:50%; font-weight:bold; flex-shrink:0;">1</div>
    <div style="line-height:1.4;"><strong>Stabilim zona de joc:</strong> Definim limitele clare ale spațiului de activitate împreună cu copiii, pentru siguranță și focus.</div>
  </div>
  <div style="display:flex; gap:1rem; align-items:flex-start;">
    <div style="background:var(--primary); color:white; width:32px; height:32px; display:flex; align-items:center; justify-content:center; border-radius:50%; font-weight:bold; flex-shrink:0;">2</div>
    <div style="line-height:1.4;"><strong>Pornim cu activități de conectare:</strong> Jocuri interactive de inițiere pentru a integra rapid toți invitații.</div>
  </div>
  <div style="display:flex; gap:1rem; align-items:flex-start;">
    <div style="background:var(--primary); color:white; width:32px; height:32px; display:flex; align-items:center; justify-content:center; border-radius:50%; font-weight:bold; flex-shrink:0;">3</div>
    <div style="line-height:1.4;"><strong>Trecem la jocuri de grup:</strong> Concursuri pe echipe, ștafete, vânătoare de comori și activități dinamice care consumă constructiv energia.</div>
  </div>
  <div style="display:flex; gap:1rem; align-items:flex-start;">
    <div style="background:var(--primary); color:white; width:32px; height:32px; display:flex; align-items:center; justify-content:center; border-radius:50%; font-weight:bold; flex-shrink:0;">4</div>
    <div style="line-height:1.4;"><strong>Introducem momente cu personajul animator:</strong> Coordonăm ateliere speciale de modelaj baloane, pictură pe față sau surprize tematice.</div>
  </div>
  <div style="display:flex; gap:1rem; align-items:flex-start;">
    <div style="background:var(--primary); color:white; width:32px; height:32px; display:flex; align-items:center; justify-content:center; border-radius:50%; font-weight:bold; flex-shrink:0;">5</div>
    <div style="line-height:1.4;"><strong>Păstrăm un final clar:</strong> Organizăm un moment festiv dedicat pentru tort, poze de grup sau momentul cheie dorit de familie.</div>
  </div>
</div>
  `;
  await supabase.from('kassia_page_sections').insert({
    page_id: pageId,
    order_index: 9,
    section_type: 'split_image_left',
    heading: 'Cum decurge programul pas cu pas',
    content: {
      body: pasCuPasBody,
      image_url: '/images/locatii/voluntari_pas_cu_pas.png',
      image_alt: 'Program pas cu pas petreceri copii'
    }
  });

  // 5. Insert new block: Zone in care adaptam
  const zoneBody = `
<p>Suntem activi și prezenți frecvent la evenimente private în toată <strong>zona de nord București / Ilfov</strong>. Dispunem de logistica necesară pentru a interveni rapid și pentru a adapta atelierele în funcție de specificul fiecărui cartier:</p>
<div style="display:flex; flex-wrap:wrap; gap:0.5rem; margin-top:1.5rem;">
  <span style="background:var(--bg-light); border:1px solid #e2e8f0; padding:0.5rem 1rem; border-radius:999px; font-weight:600; color:var(--primary-dark);">📍 Voluntari</span>
  <span style="background:var(--bg-light); border:1px solid #e2e8f0; padding:0.5rem 1rem; border-radius:999px; font-weight:600; color:var(--primary-dark);">📍 Pipera</span>
  <span style="background:var(--bg-light); border:1px solid #e2e8f0; padding:0.5rem 1rem; border-radius:999px; font-weight:600; color:var(--primary-dark);">📍 Iancu Nicolae</span>
  <span style="background:var(--bg-light); border:1px solid #e2e8f0; padding:0.5rem 1rem; border-radius:999px; font-weight:600; color:var(--primary-dark);">📍 Andronache</span>
</div>

<div style="margin-top: 3rem; background:linear-gradient(135deg, rgba(168,85,247,0.1) 0%, rgba(236,72,153,0.1) 100%); padding:2rem; border-radius:16px; text-align:center;">
  <h3 style="margin-bottom:1.5rem; font-size:1.35rem; color:var(--text-main); margin-top:0;">Scrie-ne pe WhatsApp și îți spunem rapid ce variantă se potrivește locației.</h3>
  <a href="https://wa.me/40722301980" target="_blank" class="btn-primary" style="display:inline-flex; align-items:center; gap:0.5rem;">
    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16"><path d="M13.601 2.326A7.854 7.854 0 0 0 7.994 0C3.627 0 .068 3.558.064 7.926c0 1.399.366 2.76 1.057 3.965L0 16l4.204-1.102a7.933 7.933 0 0 0 3.79.965h.004c4.368 0 7.926-3.558 7.93-7.93A7.898 7.898 0 0 0 13.6 2.326zM7.994 14.521a6.573 6.573 0 0 1-3.356-.92l-.24-.144-2.494.654.666-2.433-.156-.251a6.56 6.56 0 0 1-1.007-3.505c0-3.626 2.957-6.584 6.591-6.584a6.56 6.56 0 0 1 4.66 1.931 6.557 6.557 0 0 1 1.928 4.66c-.004 3.639-2.961 6.592-6.592 6.592zm3.615-4.934c-.197-.099-1.17-.578-1.353-.646-.182-.065-.315-.099-.445.099-.133.197-.513.646-.627.775-.114.133-.232.148-.43.05-.197-.1-.836-.308-1.592-.985-.59-.525-.985-1.175-1.103-1.372-.114-.198-.011-.304.088-.403.087-.088.197-.232.296-.346.1-.114.133-.198.198-.33.065-.134.034-.248-.015-.347-.05-.099-.445-1.076-.612-1.47-.16-.389-.323-.335-.445-.34-.114-.007-.247-.007-.38-.007a.729.729 0 0 0-.529.247c-.182.198-.691.677-.691 1.654 0 .977.71 1.916.81 2.049.098.133 1.394 2.132 3.383 2.992.47.205.84.326 1.129.418.475.152.904.129 1.246.08.38-.058 1.171-.48 1.338-.943.164-.464.164-.86.114-.943-.049-.084-.182-.133-.38-.232z"/></svg>
    Discută pe WhatsApp
  </a>
</div>
  `;
  await supabase.from('kassia_page_sections').insert({
    page_id: pageId,
    order_index: 45,
    section_type: 'split_image_right',
    heading: 'Zone în care adaptăm programul',
    content: {
      body: zoneBody,
      image_url: '/images/locatii/voluntari_zone_adaptare.png',
      image_alt: 'Petreceri copii Pipera Iancu Nicolae'
    }
  });

  console.log("Database update complete!");
})();
