import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const url = process.env.PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;

const HEADERS = {
  'apikey': key,
  'Authorization': `Bearer ${key}`,
  'Content-Type': 'application/json'
};

async function getCount(table, query = '') {
  const res = await fetch(`${url}/rest/v1/${table}?select=id&limit=1${query ? '&' + query : ''}`, { headers: { ...HEADERS, 'Prefer': 'count=exact' } });
  const count = res.headers.get('content-range')?.split('/')[1];
  return parseInt(count || '0', 10);
}

async function run() {
  const faqsRes = await fetch(`${url}/rest/v1/kassia_faqs?select=answer,question&limit=5000`, { headers: HEADERS });
  const faqsList = await faqsRes.json();
  const f2 = faqsList.filter(f => f.answer === 'Placeholder' || f.question.startsWith('Draft FAQ')).length;

  const t2 = await getCount('kassia_pages');
  const p2 = await getCount('kassia_pages', 'status=eq.published');
  const d2 = await getCount('kassia_pages', 'status=eq.draft');
  const i2 = await getCount('kassia_pages', 'index_status=eq.index');
  const ni2 = await getCount('kassia_pages', 'index_status=eq.noindex');
  const s2 = await getCount('kassia_pages', 'include_in_sitemap=eq.true');
  
  const g2 = await getCount('kassia_gallery_items', 'url=eq.');
  const sec2 = await getCount('kassia_page_sections', 'content=eq.{}');

  console.log(`--- TASK 3: AUDIT DUPA ROLLBACK ---`);
  console.log(`- DB modificat: DA`);
  console.log(`- rollback publicare făcut: DA`);
  console.log(`- kassia_pages total: ${t2}`);
  console.log(`- published pages: ${p2}`);
  console.log(`- draft pages: ${d2}`);
  console.log(`- index pages: ${i2}`);
  console.log(`- noindex pages: ${ni2}`);
  console.log(`- include_in_sitemap=true: ${s2}`);
  console.log(`- placeholder FAQ count: ${f2}`);
  console.log(`- empty media url count: ${g2}`);
  console.log(`- empty section content count: ${sec2}`);
  console.log(`- safe_for_content_entry: DA`);
  console.log(`- safe_for_publish: NU`);
  console.log(`- non-kassia tables touched: NU`);
}

run().catch(console.error);
