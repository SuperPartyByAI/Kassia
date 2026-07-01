require('dotenv').config({path: '.env.local'});
const fs = require('fs');

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 
    'apikey': key, 
    'Authorization': 'Bearer ' + key,
    'Content-Type': 'application/json',
    'Prefer': 'return=representation'
  };

  const pagesUpdate = [
    {
      id: '091dee7c-ec3a-4c47-b5db-4af24700c08b',
      title: 'Animatori botez București | Activități copii la botez | Kassia',
      meta_title: 'Animatori botez București | Activități copii la botez | Kassia',
      meta_description: 'Programe cu animatori pentru botezuri în București și Ilfov, cu jocuri, personaje, pictură pe față și activități pentru copiii invitați.',
      h1: 'Animatori pentru botezuri în București'
    },
    {
      id: '46a20540-c418-4e3a-a33b-a4dd793c8ec1',
      title: 'Animatori grădiniță București | Activități copii | Kassia',
      meta_title: 'Animatori grădiniță București | Activități copii | Kassia',
      meta_description: 'Animatori pentru grădinițe, serbări și activități pentru copii în București. Jocuri interactive, mini-disco, personaje și activități adaptate vârstei preșcolare.',
      h1: 'Animatori pentru grădinițe în București'
    },
    {
      id: 'f0b39e18-af00-404b-ba33-e433aef8b982',
      title: 'Animatori școală București | Banchete și serbări | Kassia',
      meta_title: 'Animatori școală București | Banchete și serbări | Kassia',
      meta_description: 'Programe interactive și animatori pentru școli, afterschool-uri, banchete și petreceri de final de an în București. Jocuri de echipă și activități captivante.',
      h1: 'Animatori pentru petreceri și serbări școlare în București'
    }
  ];

  const sectionsUpdate = [
    { id: 'd946f8da-4f24-4403-806a-e68cadec9585', heading: 'De ce să chemi animatori la un botez în București?' },
    { id: '623dd615-a9c8-40d6-aae4-4e5c6a0d1458', heading: 'Rezervă animatori pentru botezul copilului tău' },
    { id: 'be09fddc-c47d-4b78-80d1-49e9d2107ea4', heading: 'De ce să aduci animatori la evenimentele de la grădiniță?' },
    { id: '4f44a64b-ba63-49b6-87ea-e08ef84d8c58', heading: 'Rezervă un program special pentru serbarea de la grădiniță' },
    { id: '5d21f28a-890d-4769-bc24-0c14e7f65cfa', heading: 'De ce să alegi animatori pentru petrecerile școlare?' },
    { id: 'f052030e-3c1d-4ad7-ac8b-3c8d3a55553e', heading: 'Programează un eveniment memorabil pentru clasa ta' }
  ];

  const faqsUpdate = [
    { id: 'd7ba0df6-4dcf-427d-b5c1-fa017ff4e4fb', question: 'Cât timp stă un animator la un botez în București?' },
    { id: 'f1ea5d73-13fc-4e00-bdb9-36ded8a9f212', question: 'Cât timp stă un animator la o activitate de grădiniță în București?' },
    { id: '86ee6772-8b6f-4f3d-9297-a0b7c1bc39f8', question: 'Cât timp stă un animator la o petrecere școlară în București?' }
  ];

  // Load BEFORE states
  const beforeStates = JSON.parse(fs.readFileSync('/tmp/batch1_full_data.json', 'utf8'));

  // Update Pages
  for (const p of pagesUpdate) {
    const res = await fetch(`${url}/rest/v1/kassia_pages?id=eq.${p.id}`, {
      method: 'PATCH', headers, body: JSON.stringify({
        title: p.title,
        meta_title: p.meta_title,
        meta_description: p.meta_description,
        h1: p.h1,
        updated_at: new Date().toISOString()
      })
    });
    if (!res.ok) console.error('Failed page update', await res.text());
  }

  // Update Sections
  for (const s of sectionsUpdate) {
    // First get current section to check content.heading
    const getRes = await fetch(`${url}/rest/v1/kassia_page_sections?id=eq.${s.id}`, { headers: { ...headers, Prefer: '' } });
    const sec = (await getRes.json())[0];
    
    let content = sec.content;
    if (content && content.heading === sec.heading) {
        content.heading = s.heading;
    }

    const res = await fetch(`${url}/rest/v1/kassia_page_sections?id=eq.${s.id}`, {
      method: 'PATCH', headers, body: JSON.stringify({
        heading: s.heading,
        content: content,
        updated_at: new Date().toISOString()
      })
    });
    if (!res.ok) console.error('Failed section update', await res.text());
  }

  // Update FAQs
  for (const f of faqsUpdate) {
    const res = await fetch(`${url}/rest/v1/kassia_faqs?id=eq.${f.id}`, {
      method: 'PATCH', headers, body: JSON.stringify({
        question: f.question,
        updated_at: new Date().toISOString()
      })
    });
    if (!res.ok) console.error('Failed faq update', await res.text());
  }

  // Fetch AFTER states
  let afterStates = {};
  for (const pid of pagesUpdate.map(p => p.id)) {
    const pRes = await fetch(`${url}/rest/v1/kassia_pages?id=eq.${pid}`, { headers: { ...headers, Prefer: '' } });
    const pData = (await pRes.json())[0];
    
    const sRes = await fetch(`${url}/rest/v1/kassia_page_sections?page_id=eq.${pid}`, { headers: { ...headers, Prefer: '' } });
    const sData = await sRes.json();
    
    const fRes = await fetch(`${url}/rest/v1/kassia_faqs?page_id=eq.${pid}`, { headers: { ...headers, Prefer: '' } });
    const fData = await fRes.json();
    
    afterStates[pData.slug] = {
      page: pData,
      sections: sData.filter(s => sectionsUpdate.map(su => su.id).includes(s.id)),
      faqs: fData.filter(fa => faqsUpdate.map(fu => fu.id).includes(fa.id))
    };
  }
  
  fs.writeFileSync('/tmp/batch1_after_data.json', JSON.stringify(afterStates, null, 2));
  console.log("EXECUTION COMPLETE");
}
run();
