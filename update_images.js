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

async function updateSection(sectionId, currentBody, imagePath, altText) {
  const imgHtml = `
<div style="margin: 2rem 0; border-radius: 12px; overflow: hidden; box-shadow: 0 8px 24px rgba(0,0,0,0.12);">
  <img src="${imagePath}" alt="${altText}" style="width: 100%; height: auto; display: block;" loading="lazy" />
</div>
`;
  const newBody = imgHtml + currentBody;
  
  const res = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?id=eq.${sectionId}`, {
    method: 'PATCH',
    headers,
    body: JSON.stringify({ content: { body: newBody } })
  });
  console.log(`Updated ${sectionId}:`, res.status);
}

async function run() {
  const pageId = "49cf0ab3-2299-4d4f-8230-9f2ef0903813";
  const res = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?page_id=eq.${pageId}&select=id,heading,content`, { headers });
  const sections = await res.json();
  
  for (const sec of sections) {
    if (sec.heading === "Program cu 1 personaj animator") {
      await updateSection(sec.id, sec.content.body, "/images/animatori/animator-petrecere-1.png", "1 personaj animator la petrecere copii București");
    } else if (sec.heading === "Program cu 2 personaje animatoare") {
      await updateSection(sec.id, sec.content.body, "/images/animatori/animatori-petrecere-2.png", "2 personaje animatoare la petrecere copii mari cu jocuri interactive");
    } else if (sec.heading === "Animatori pe picioroange") {
      await updateSection(sec.id, sec.content.body, "/images/animatori/animatori-picioroange.png", "Animatori pe picioroange primire invitati botez si petreceri copii");
    }
  }
}

run();
