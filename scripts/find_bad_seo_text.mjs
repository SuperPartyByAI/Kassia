import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';
import fs from 'fs';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  const terms = [
    'fără a menționa branduri',
    '70 de personaje',
    'între 30 și 50',
    'teatru de păpuși',
    'tun de confetti',
    'mascote Disney',
    'ajung întotdeauna',
    'testate dermatologic',
    'non-toxice',
    'autentice'
  ];

  const results = {
    sections: [],
    faqs: []
  };

  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content');
  for (const s of sections) {
    if (!s.content) continue;
    const str = JSON.stringify(s.content).toLowerCase();
    const found = terms.filter(t => str.includes(t.toLowerCase()));
    if (found.length > 0) {
      results.sections.push({ id: s.id, matches: found });
    }
  }

  const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, answer');
  for (const f of faqs) {
    const str = (f.question + ' ' + f.answer).toLowerCase();
    const found = terms.filter(t => str.includes(t.toLowerCase()));
    if (found.length > 0) {
      results.faqs.push({ id: f.id, matches: found });
    }
  }

  fs.writeFileSync('bad_text_findings.json', JSON.stringify(results, null, 2));
  console.log('Search completed. Results saved to bad_text_findings.json.');
}
run();
