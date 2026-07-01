import fs from 'fs';

const envFile = fs.readFileSync('.env.local', 'utf8');
const envVars = {};
envFile.split('\n').forEach(line => {
  const match = line.match(/^([^=]+)=(.*)$/);
  if (match) envVars[match[1]] = match[2].trim().replace(/^"|"$/g, '');
});

const supabaseUrl = envVars['PUBLIC_SUPABASE_URL'];
const supabaseKey = envVars['SUPABASE_SERVICE_ROLE_KEY'];
const headers = { 
  'apikey': supabaseKey, 
  'Authorization': `Bearer ${supabaseKey}`,
  'Content-Type': 'application/json',
  'Prefer': 'return=representation'
};

async function run() {
  const pageId = "49cf0ab3-2299-4d4f-8230-9f2ef0903813";
  
  // 1. Add new section
  const newSectionData = {
    page_id: pageId,
    section_type: "text",
    heading: "Cum alegi varianta potrivită pentru petrecere",
    content: {
      body: "<p>Pentru o aniversare restrânsă, programul cu 1 personaj animator poate fi suficient atunci când copiii au vârste apropiate și activitățile se desfășoară într-un spațiu compact. Pentru evenimente mai mari, cu invitați de vârste diferite sau cu mai multe momente în desfășurare, varianta cu 2 personaje animatoare oferă mai multă susținere în coordonarea jocurilor, dansurilor și momentelor tematice. Animatorii pe picioroange sunt potriviți pentru apariții vizuale, primirea invitaților, fotografii și momente speciale în cadrul evenimentului.</p>"
    },
    order_index: 70 // After 'Ce poate include programul de animație' (60)
  };

  const resSection = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections`, {
    method: 'POST',
    headers,
    body: JSON.stringify(newSectionData)
  });
  console.log("Section Added:", resSection.status, await resSection.text());

  // 2. Add new FAQs
  const newFaqs = [
    {
      page_id: pageId,
      question: "Cum aleg între 1 personaj animator și 2 personaje animatoare?",
      answer: "Alegerea depinde de numărul copiilor, vârstele invitaților și spațiul disponibil. Pentru un grup restrâns, 1 personaj animator poate susține programul într-un format clar. Pentru grupuri mai mari sau evenimente cu activități paralele, 2 personaje animatoare pot menține mai ușor ritmul și atenția copiilor.",
      order_index: 60
    },
    {
      page_id: pageId,
      question: "Prețurile se schimbă în funcție de locația evenimentului?",
      answer: "Prețurile programelor rămân cele afișate pe pagină. Pentru București, transportul este inclus la programele cu 1 personaj animator sau 2 personaje animatoare. Pentru Ilfov, transportul se calculează separat: 2 lei/km, dus-întors, de la Piața Unirii / km 0 până la locația evenimentului și înapoi, cu minim 50 lei pentru locațiile apropiate. Pentru animatorii pe picioroange, transportul este inclus în București și Ilfov.",
      order_index: 70
    },
    {
      page_id: pageId,
      question: "Ce detalii trebuie trimise pentru stabilirea programului?",
      answer: "Pentru stabilirea programului sunt utile data evenimentului, zona sau locația, vârsta copiilor, numărul aproximativ de invitați, spațiul disponibil și varianta dorită: 1 personaj animator, 2 personaje animatoare sau animatori pe picioroange.",
      order_index: 80
    }
  ];

  for (const faq of newFaqs) {
    const resFaq = await fetch(`${supabaseUrl}/rest/v1/kassia_faqs`, {
      method: 'POST',
      headers,
      body: JSON.stringify(faq)
    });
    console.log("FAQ Added:", resFaq.status);
  }
}

run();
