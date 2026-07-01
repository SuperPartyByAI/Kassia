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
  const faqId = "7e701842-2db1-4853-a956-8a6926c93fe4";
  const newAnswer = "Momentul Balloon Exploder este o activitate festivă asemănătoare cu pinata, dar realizată cu un balon mare, de aproximativ 45–60 cm, umplut cu bomboane. Sărbătoritul sparge balonul, iar bomboanele cad, creând un moment vesel pentru copii și invitați.";

  const res = await fetch(`${supabaseUrl}/rest/v1/kassia_faqs?id=eq.${faqId}`, {
    method: 'PATCH',
    headers,
    body: JSON.stringify({ answer: newAnswer })
  });
  console.log("FAQ Updated:", res.status, await res.text());
}

run();
