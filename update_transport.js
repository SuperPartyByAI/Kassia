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
  const sectionId = "fd79da6e-697c-4b41-a796-6fcc57f06dba";
  const newSectionData = {
    heading: "Transport pentru București și Ilfov",
    content: {
      body: "<p>Pentru programele cu 1 personaj animator sau 2 personaje animatoare, transportul este inclus în București. Pentru evenimentele din Ilfov, transportul se calculează separat, în funcție de distanță: 2 lei/km, dus-întors, de la Piața Unirii / km 0 până la locația evenimentului și înapoi. Pentru locațiile din Ilfov aflate la distanță mică, transportul minim este 50 lei.</p><p>Pentru animatorii pe picioroange, transportul este inclus în București și Ilfov.</p>"
    }
  };

  const res1 = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?id=eq.${sectionId}`, {
    method: 'PATCH',
    headers,
    body: JSON.stringify(newSectionData)
  });
  console.log("Section update:", res1.status, await res1.text());

  const faqId = "9ddcacc5-f24b-4b6c-a443-37bb68c4aa2c";
  const newFaqData = {
    question: "Cum se calculează transportul pentru București și Ilfov?",
    answer: "Pentru programele cu 1 personaj animator sau 2 personaje animatoare, transportul este inclus în București. Pentru Ilfov, transportul se calculează separat: 2 lei/km, dus-întors, de la Piața Unirii / km 0 până la locația evenimentului și înapoi, cu un minim de 50 lei pentru locațiile apropiate. Pentru animatorii pe picioroange, transportul este inclus în București și Ilfov."
  };

  const res2 = await fetch(`${supabaseUrl}/rest/v1/kassia_faqs?id=eq.${faqId}`, {
    method: 'PATCH',
    headers,
    body: JSON.stringify(newFaqData)
  });
  console.log("FAQ update:", res2.status, await res2.text());
}
run();
