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
  // Fetch current section 1
  const res1 = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?id=eq.d0496e2b-1b9f-4bbf-8149-8f0af45e34d3`, { headers });
  const sec1 = (await res1.json())[0];
  let content1 = sec1.content;
  if (typeof content1 === 'string') content1 = JSON.parse(content1);
  
  content1.body = `<p>Pentru petrecerile copiilor, programul de animație poate fi adaptat în funcție de vârsta invitaților, spațiul disponibil și momentele dorite în cadrul evenimentului. Dacă vrei să vezi toate variantele de <a href="/animatori-petreceri-copii/">animatori pentru petreceri de copii</a> disponibile pentru evenimente în București și Ilfov, poți consulta și pagina principală dedicată programelor de animație. Mai jos găsești variantele de program pentru animație, cu 1 personaj animator, 2 personaje animatoare și animatori pe picioroange.</p>`;
  
  const up1 = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?id=eq.d0496e2b-1b9f-4bbf-8149-8f0af45e34d3`, {
    method: 'PATCH',
    headers,
    body: JSON.stringify({ content: content1 })
  });
  console.log("UPDATE 1 STATUS:", up1.status);

  // Fetch current section 2
  const res2 = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?id=eq.fbdfcef7-451d-4790-aa67-651fb3cd526e`, { headers });
  const sec2 = (await res2.json())[0];
  let content2 = sec2.content;
  if (typeof content2 === 'string') content2 = JSON.parse(content2);
  
  content2.body = `<p>În funcție de varianta aleasă, programul poate include jocuri interactive, concursuri, dansuri, <a href="/pictura-pe-fata-copii-bucuresti/">pictură pe față</a>, <a href="/modelaj-baloane-copii-bucuresti/">modelaj de baloane</a>, pinata sau moment Balloon Exploder. Structura finală se stabilește în funcție de vârsta copiilor, locație și tematica petrecerii.<br><br>Spune-ne data evenimentului, zona, vârsta copiilor și varianta de program dorită, iar echipa Kassia te ajută să stabilești detaliile potrivite pentru petrecere.</p>`;
  
  const up2 = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?id=eq.fbdfcef7-451d-4790-aa67-651fb3cd526e`, {
    method: 'PATCH',
    headers,
    body: JSON.stringify({ content: content2 })
  });
  console.log("UPDATE 2 STATUS:", up2.status);
}
run();
