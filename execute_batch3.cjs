require('dotenv').config({path: '.env.local'});
const fs = require('fs');

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key, 'Content-Type': 'application/json', 'Prefer': 'return=representation' };

  const updates = [
    {
      page: {
        id: 'c0879b60-7f8d-4be2-af4b-ef1fad77a1cd',
        title: 'Animatori clovni București | Petreceri copii | Kassia',
        meta_title: 'Animatori clovni București | Petreceri copii | Kassia',
        meta_description: 'Animatori clovni pentru petreceri copii în București și Ilfov, cu jocuri interactive, personaje, pictură pe față și modelaj de baloane.',
        h1: 'Animatori clovni pentru petreceri copii în București'
      },
      sections: [
        { id: '9e55e92b-efe9-4fbd-a775-7fae63d5acec', heading: 'De ce să inviți un clovn animator la petrecerea copilului?' },
        { id: '2c8fff37-6e10-4604-90be-e1f89b4c0bca', heading: 'Rezervă animatori clovni pentru evenimentul tău în București' }
      ],
      faqs: [
        { id: '3c3832e7-f157-44e2-949f-e03983af4a02', question: 'Cât timp stă un clovn animator la o petrecere?' }
      ]
    },
    {
      page: {
        id: 'b7038460-b34d-4b2d-ba76-d448a6e8fd84',
        title: 'Animatori copii la restaurant București | Petreceri | Kassia',
        meta_title: 'Animatori copii la restaurant București | Petreceri | Kassia',
        meta_description: 'Animatori pentru copii la petreceri organizate în restaurant în București și Ilfov, cu jocuri interactive și activități adaptate spațiului disponibil.',
        h1: 'Animatori pentru copii la restaurant în București'
      },
      sections: [
        { id: 'a761ca10-0a3a-49ab-8aa2-54865df57f0a', heading: 'De ce să chemi animatori pentru copii la o petrecere la restaurant?' },
        { id: 'c4c88e12-ba48-4999-855a-755b351b5ed4', heading: 'Rezervă animatori pentru petrecerea la restaurant în București' }
      ],
      faqs: [
        { id: 'd053616f-1f22-4595-9d57-063ebbf03054', question: 'Cât timp stă un animator la o petrecere organizată la restaurant?' }
      ]
    },
    {
      page: {
        id: '44ccceb6-1404-4438-84ea-f7e51debe94e',
        title: 'Animatori eveniment corporate copii București | Kassia',
        meta_title: 'Animatori eveniment corporate copii București | Kassia',
        meta_description: 'Animatori pentru copii la evenimente corporate și petreceri de companie în București și Ilfov, cu jocuri interactive și activități pentru copiii invitați.',
        h1: 'Animatori pentru copii la evenimente corporate în București'
      },
      sections: [
        { id: 'd82bfd88-3a36-4717-ad8a-d159f1a299ea', heading: 'De ce să inviți animatori pentru copiii prezenți la un eveniment corporate?' },
        { id: 'f676e5bf-accd-4d77-94ac-d94ec7b61770', heading: 'Rezervă animatori pentru evenimentul corporate în București' }
      ],
      faqs: [
        { id: 'f817e008-1d11-473c-985e-f85f8cf3f27d', question: 'Cât timp durează un program de animație la un eveniment corporate?' }
      ]
    },
    {
      page: {
        id: 'b43ba441-ec9a-45c2-b059-3d73f977eb77',
        title: 'Animatori evenimente copii București | Petreceri | Kassia',
        meta_title: 'Animatori evenimente copii București | Petreceri | Kassia',
        meta_description: 'Animatori pentru evenimente cu copii în București și Ilfov, potriviți pentru serbări, petreceri private, inaugurări și evenimente speciale.',
        h1: 'Animatori pentru evenimente cu copii în București'
      },
      sections: [
        { id: '015d69d7-b6d0-47e6-bbda-d05ab49c84c4', heading: 'De ce să chemi animatori la un eveniment cu copii?' },
        { id: 'da527fc4-da5e-451d-a6c2-21c25df43cb4', heading: 'Rezervă animatori pentru evenimentul tău din București' }
      ],
      faqs: [
        { id: 'd2200001-ca16-4a38-b25c-2b1bc5f1db88', question: 'Cât timp stă un animator la un eveniment cu copii?' }
      ]
    },
    {
      page: {
        id: 'bfbd95fb-2166-456f-83f3-0b97a7ce1885',
        title: 'Animatori moț și turtă București | Petreceri copii | Kassia',
        meta_title: 'Animatori moț și turtă București | Petreceri copii | Kassia',
        meta_description: 'Animatori pentru petreceri de moț și turtă în București și Ilfov, cu jocuri, personaje, pictură pe față și activități pentru copiii invitați.',
        h1: 'Animatori pentru petreceri de moț și turtă în București'
      },
      sections: [
        { id: 'eda557c8-8c74-47a1-8196-193881927365', heading: 'De ce să alegi animatori pentru petrecerea de moț sau turtă?' },
        { id: '4bf62233-e0e6-462d-b75e-81e72d47967b', heading: 'Rezervă animatori pentru petrecerea de moț sau turtă în București' }
      ],
      faqs: [
        { id: '65e325ed-5514-4704-ac6d-5daf5acaae0e', question: 'Cât timp stă un animator la o petrecere de moț sau turtă?' }
      ]
    }
  ];

  const log = [];

  for (const u of updates) {
    // Update Page
    const pageRes = await fetch(`${url}/rest/v1/kassia_pages?id=eq.${u.page.id}`, {
      method: 'PATCH',
      headers,
      body: JSON.stringify({
        title: u.page.title,
        meta_title: u.page.meta_title,
        meta_description: u.page.meta_description,
        h1: u.page.h1,
        updated_at: new Date().toISOString()
      })
    });
    log.push({ type: 'page', id: u.page.id, status: pageRes.status });

    // Update Sections
    for (const sec of u.sections) {
      // First get the section to update content.heading if it exists
      const getSec = await fetch(`${url}/rest/v1/kassia_page_sections?id=eq.${sec.id}&select=content`, { headers });
      const secBefore = await getSec.json();
      let contentObj = secBefore[0].content || {};
      if (contentObj.heading) {
        contentObj.heading = sec.heading;
      }
      
      const secRes = await fetch(`${url}/rest/v1/kassia_page_sections?id=eq.${sec.id}`, {
        method: 'PATCH',
        headers,
        body: JSON.stringify({
          heading: sec.heading,
          content: contentObj,
          updated_at: new Date().toISOString()
        })
      });
      log.push({ type: 'section', id: sec.id, status: secRes.status });
    }

    // Update FAQs
    for (const faq of u.faqs) {
      const faqRes = await fetch(`${url}/rest/v1/kassia_faqs?id=eq.${faq.id}`, {
        method: 'PATCH',
        headers,
        body: JSON.stringify({
          question: faq.question,
          updated_at: new Date().toISOString()
        })
      });
      log.push({ type: 'faq', id: faq.id, status: faqRes.status });
    }
  }

  fs.writeFileSync('/tmp/batch3_exec_log.json', JSON.stringify(log, null, 2));
  console.log("Batch 3 update executed.");
}

run();
