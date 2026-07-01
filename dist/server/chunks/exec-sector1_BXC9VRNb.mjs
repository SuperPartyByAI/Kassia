import { s as supabase } from './supabase_m9V3dadf.mjs';
import fs from 'fs';
import path from 'path';

const GET = async ({ request }) => {
  try {
    const uuid = "33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4";
    const oldUuid = "19c6b65d-d903-4a10-998e-a28113c763e3";
    const { data: existCheck } = await supabase.from("kassia_pages").select("id").eq("id", uuid);
    if (existCheck && existCheck.length > 0) {
      return new Response(JSON.stringify({ error: "UUID already exists in kassia_pages!" }), { status: 400 });
    }
    const { data: oldPage } = await supabase.from("kassia_pages").select("*").eq("id", oldUuid).single();
    if (oldPage) {
      const backupDir = path.join(process.cwd(), "backups");
      if (!fs.existsSync(backupDir)) fs.mkdirSync(backupDir);
      fs.writeFileSync(path.join(backupDir, "db_page_sector1_old.json"), JSON.stringify(oldPage, null, 2));
    }
    const { error: pErr } = await supabase.from("kassia_pages").insert({
      id: uuid,
      path: "/animatori-petreceri-copii-sector-1/",
      slug: "animatori-petreceri-copii-sector-1",
      title: "Animatori petreceri copii Sector 1 | Programe Interactive | Kassia",
      h1: "Animatori pentru petreceri de copii în Sector 1",
      meta_title: "Animatori petreceri copii Sector 1 | Programe Interactive | Kassia",
      meta_description: "Organizezi o petrecere în Sector 1? Echipa Kassia oferă programe cu animatori pentru copii, jocuri interactive, mascote și activități adaptate evenimentului.",
      canonical_url: "https://www.kassia.ro/animatori-petreceri-copii-sector-1/",
      page_type: "pagină oraș + serviciu",
      status: "published"
    });
    if (pErr) throw new Error("Insert page failed: " + pErr.message);
    const { error: sErr } = await supabase.from("kassia_page_sections").insert([
      {
        page_id: uuid,
        section_type: "hero",
        order_index: 1,
        heading: "Hero Section",
        content: { body: "Bucurie, jocuri interactive și personaje iubite pentru un eveniment reușit aproape de tine.", cta_text: "Trimite detaliile petrecerii", cta_url: "/contact/", image_url: "/images/aniversare-copii-baloane-hero.webp" }
      },
      {
        page_id: uuid,
        section_type: "Detalii Organizare",
        order_index: 2,
        heading: "Cum adaptăm programul pentru petrecerile din Sector 1",
        content: { heading: "Cum adaptăm programul pentru petrecerile din Sector 1", body: "Programul se stabilește în funcție de vârsta copiilor, spațiul disponibil, tematică și activitățile dorite. Echipa poate adapta jocurile, momentele de mișcare și activitățile creative în funcție de dinamica evenimentului." }
      },
      {
        page_id: uuid,
        section_type: "Beneficii Serviciu",
        order_index: 3,
        heading: "Ce includ activitățile de animație la Kassia Events?",
        content: { heading: "Ce includ activitățile de animație la Kassia Events?", body: "<ul><li>Activități potrivite vârstei copiilor, adaptate locației și ritmului evenimentului.</li><li>Jocuri interactive și concursuri de grup.</li><li>Modelaj din baloane colorate.</li><li>Pictură pe față cu materiale sigure.</li></ul>", cta_text: "Trimite detaliile petrecerii", cta_url: "/contact/" }
      }
    ]);
    if (sErr) throw new Error("Insert sections failed: " + sErr.message);
    const { error: fErr } = await supabase.from("kassia_faqs").insert([
      {
        page_id: uuid,
        order_index: 1,
        question: "Ce activități pot fi incluse la petrecere?",
        answer: "Programul poate include jocuri interactive adaptate vârstei copiilor, dansuri, concursuri antrenante, precum și sesiuni de pictură pe față sau modelaj din baloane colorate."
      },
      {
        page_id: uuid,
        order_index: 2,
        question: "Când este bine să ne contactați pentru eveniment?",
        answer: "Recomandăm să ne scrii din timp, pentru a verifica disponibilitatea echipei și pentru a stabili detaliile legate de animație."
      },
      {
        page_id: uuid,
        order_index: 3,
        question: "Lucrați cu animatori pentru petreceri în toate zonele din Sectorul 1?",
        answer: "Da, echipa Kassia se deplasează la locația evenimentului, fie că acesta are loc acasă, la un restaurant, o grădiniță sau un spațiu de joacă."
      },
      {
        page_id: uuid,
        order_index: 4,
        question: "Cum alegem tematica și activitățile potrivite?",
        answer: "Putem discuta împreună despre preferințele copilului, tematica petrecerii și activitățile dorite. Pe baza acestor detalii, echipa propune o structură de program adaptată evenimentului."
      }
    ]);
    if (fErr) throw new Error("Insert faqs failed: " + fErr.message);
    return new Response(JSON.stringify({ success: true }), { status: 200 });
  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  }
};

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  GET
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
