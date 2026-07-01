require('dotenv').config({path: '.env.local'});
const { execSync } = require('child_process');

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = {
    'apikey': key,
    'Authorization': 'Bearer ' + key,
    'Content-Type': 'application/json',
    'Prefer': 'return=representation'
  };

  const batch = [
    {
      page_id: '5db0f1e1-9216-405a-bea7-763351bdc547',
      slug: 'animatori-tematica-dinozauri-bucuresti',
      pages: {
        title: 'Animatori tematică dinozauri București | Petreceri copii | Kassia',
        meta_title: 'Animatori tematică dinozauri București | Petreceri copii | Kassia',
        meta_description: 'Animatori pentru petreceri copii cu tematică dinozauri în București și Ilfov, cu jocuri interactive, personaje, activități creative și atmosferă de aventură.',
        h1: 'Animatori cu tematică dinozauri pentru copii în București'
      },
      sections: [
        { id: '9bf53308-c5f5-44ac-b47b-78afa62635c8', heading: 'De ce să alegi animatori cu tematică dinozauri pentru petrecerea copilului?' },
        { id: 'ff201d2d-9fe5-45c7-a4c3-7d2d7b196051', heading: 'Rezervă animatori cu tematică dinozauri pentru evenimentul tău în București' }
      ],
      faq: { id: 'ff6c6aa4-eb4d-42f4-85fa-e97f8db55700', question: 'Cât timp stă un animator cu tematică dinozauri la o petrecere?' }
    },
    {
      page_id: '5cba33fc-2418-445e-9da0-9e1ce0de6162',
      slug: 'animatori-tematica-unicorn-bucuresti',
      pages: {
        title: 'Animatori tematică unicorn București | Petreceri copii | Kassia',
        meta_title: 'Animatori tematică unicorn București | Petreceri copii | Kassia',
        meta_description: 'Animatori pentru petreceri copii cu tematică unicorn în București și Ilfov, cu personaje, jocuri interactive, pictură pe față și modelaj de baloane.',
        h1: 'Animatori cu tematică unicorn pentru copii în București'
      },
      sections: [
        { id: '4845e3d4-cf30-4cdd-86a7-a9f975fd128f', heading: 'De ce să alegi animatori cu tematică unicorn pentru petrecerea copilului?' },
        { id: 'f52b9087-5442-4774-b3b3-c2eba8d0d8dc', heading: 'Rezervă animatori cu tematică unicorn pentru evenimentul tău în București' }
      ],
      faq: { id: '71cd5703-695b-47e2-bc77-c1af4c6d35ba', question: 'Cât timp stă un animator cu tematică unicorn la o petrecere?' }
    },
    {
      page_id: '28d7ab75-8feb-4261-954b-ae2e06051f22',
      slug: 'animatori-tematica-jungla-bucuresti',
      pages: {
        title: 'Animatori tematică junglă București | Petreceri copii | Kassia',
        meta_title: 'Animatori tematică junglă București | Petreceri copii | Kassia',
        meta_description: 'Animatori pentru petreceri copii cu tematică de junglă în București și Ilfov, cu jocuri de explorare, activități creative, personaje și atmosferă de aventură.',
        h1: 'Animatori cu tematică junglă pentru copii în București'
      },
      sections: [
        { id: '0557aeba-828c-470f-86f5-b6de472e0ee8', heading: 'De ce să alegi animatori cu tematică de junglă pentru petrecerea celor mici?' },
        { id: '90d127a1-4a9f-45e2-a8ab-2e0d3f4de93d', heading: 'Rezervă animatori cu tematică de junglă pentru evenimentul tău în București' }
      ],
      faq: { id: '0b3551eb-c484-4fa5-97b3-9b53c58b8310', question: 'Cât timp stă un animator cu tematică de junglă la o petrecere?' }
    },
    {
      page_id: '4f0fd25f-647c-4013-a504-4dc71658529d',
      slug: 'animatori-tematica-spatiu-bucuresti',
      pages: {
        title: 'Animatori tematică spațiu București | Petreceri copii | Kassia',
        meta_title: 'Animatori tematică spațiu București | Petreceri copii | Kassia',
        meta_description: 'Animatori pentru petreceri copii cu tematică de spațiu în București și Ilfov, cu personaje, jocuri tematice, activități creative și modelaj de baloane.',
        h1: 'Animatori cu tematică spațiu pentru copii în București'
      },
      sections: [
        { id: 'e4b2c428-01e5-4de1-9465-92e48fcd35a6', heading: 'De ce să alegi animatori cu tematică de spațiu pentru petrecerea copilului?' },
        { id: 'c6e91644-8b30-4af1-af30-465964df943c', heading: 'Rezervă animatori cu tematică de spațiu pentru evenimentul tău în București' }
      ],
      faq: { id: '425450ea-bf5f-4306-9e7d-d898c36436b4', question: 'Cât timp stă un animator cu tematică de spațiu la o petrecere?' }
    }
  ];

  const results = [];

  for (const item of batch) {
    const pageBefore = await (await fetch(`${url}/rest/v1/kassia_pages?id=eq.${item.page_id}`, { headers })).json();
    
    // Update pages
    const pageAfter = await (await fetch(`${url}/rest/v1/kassia_pages?id=eq.${item.page_id}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify(item.pages)
    })).json();

    const sectionsLog = [];
    for (const sec of item.sections) {
      const secBefore = await (await fetch(`${url}/rest/v1/kassia_page_sections?id=eq.${sec.id}`, { headers })).json();
      let contentObj = secBefore[0].content;
      if (contentObj && contentObj.heading) {
        contentObj.heading = sec.heading; // Update content.heading as requested
      }
      const secAfter = await (await fetch(`${url}/rest/v1/kassia_page_sections?id=eq.${sec.id}`, {
        method: 'PATCH',
        headers,
        body: JSON.stringify({ heading: sec.heading, content: contentObj })
      })).json();
      sectionsLog.push({ before: secBefore[0], after: secAfter[0] });
    }

    const faqBefore = await (await fetch(`${url}/rest/v1/kassia_faqs?id=eq.${item.faq.id}`, { headers })).json();
    const faqAfter = await (await fetch(`${url}/rest/v1/kassia_faqs?id=eq.${item.faq.id}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({ question: item.faq.question })
    })).json();

    results.push({
      slug: item.slug,
      page: { before: pageBefore[0], after: pageAfter[0] },
      sections: sectionsLog,
      faq: { before: faqBefore[0], after: faqAfter[0] }
    });
  }

  require('fs').writeFileSync('/tmp/batch2_exec_log.json', JSON.stringify(results, null, 2));
  console.log("DB Update completed. Logs saved to /tmp/batch2_exec_log.json");
}

run();
