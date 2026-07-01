import fs from 'fs';
import path from 'path';

const ENV_PATH = path.join(process.cwd(), '.env.local');
let SUPABASE_URL = '';
let SUPABASE_KEY = '';

if (fs.existsSync(ENV_PATH)) {
  const envContent = fs.readFileSync(ENV_PATH, 'utf-8');
  envContent.split('\n').forEach(line => {
    if (line.startsWith('PUBLIC_SUPABASE_URL=')) SUPABASE_URL = line.split('=')[1].trim();
    if (line.startsWith('VITE_SUPABASE_URL=')) SUPABASE_URL = line.split('=')[1].trim();
    if (line.startsWith('SUPABASE_SERVICE_ROLE_KEY=')) SUPABASE_KEY = line.split('=')[1].trim();
    if (line.startsWith('VITE_SUPABASE_ANON_KEY=')) SUPABASE_KEY = line.split('=')[1].trim();
  });
}

async function patch(table, query, data) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${table}?${query}`, {
    method: 'PATCH',
    headers: {
      'apikey': SUPABASE_KEY,
      'Authorization': `Bearer ${SUPABASE_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  });
  if (!res.ok) throw new Error(`Supabase PATCH error: ${res.status} ${res.statusText}`);
}

async function runCleanup() {
  const docsDir = path.join(process.cwd(), 'docs');
  const backupPath = path.join(docsDir, 'kassia_batch1_dry_run_backup.json');
  
  if (!fs.existsSync(backupPath)) {
    console.error('Backup file not found! Cannot rollback.');
    return;
  }

  console.log('Reading backup data...');
  const backupData = JSON.parse(fs.readFileSync(backupPath, 'utf-8'));

  console.log('Restoring kassia_pages...');
  for (const p of backupData.pages) {
    await patch('kassia_pages', `id=eq.${p.id}`, {
      title: p.title,
      h1: p.h1,
      meta_description: p.meta_description,
      status: 'draft',
      index_status: 'noindex',
      include_in_sitemap: false
    });
  }

  console.log('Restoring kassia_page_sections...');
  for (const s of backupData.sections) {
    await patch('kassia_page_sections', `id=eq.${s.id}`, {
      heading: s.heading,
      content: typeof s.content === 'string' ? JSON.parse(s.content) : s.content
    });
  }

  console.log('Restoring kassia_faqs...');
  for (const f of backupData.faqs) {
    await patch('kassia_faqs', `id=eq.${f.id}`, {
      question: f.question,
      answer: f.answer
    });
  }

  console.log('Restoring kassia_gallery_items...');
  for (const g of backupData.gallery) {
    await patch('kassia_gallery_items', `id=eq.${g.id}`, {
      url: g.url,
      alt_text: g.alt_text
    });
  }

  console.log('Cleanup and rollback completed successfully!');
}

runCleanup().catch(console.error);
