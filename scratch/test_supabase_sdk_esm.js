import fs from 'fs';
import ws from 'ws';
import { createClient } from '@supabase/supabase-js';

const envPath = '/Users/universparty/wa-web-launcher/kassia-site/.env.local';
const envContent = fs.readFileSync(envPath, 'utf8');
const env = {};
envContent.split('\n').forEach(line => {
  const parts = line.split('=');
  if (parts.length >= 2) {
    const key = parts[0].trim();
    const val = parts.slice(1).join('=').trim();
    env[key] = val;
  }
});

const supabase = createClient(env.PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: {
    persistSession: false
  },
  realtime: {
    transport: ws
  }
});

async function main() {
  const pageId = '796ef23c-48fb-4cdc-9d44-2d36b7cccf2f';
  const { data, error } = await supabase
    .from('kassia_page_sections')
    .select('id,section_type,content')
    .eq('page_id', pageId);
    
  if (error) {
    console.error(error);
    return;
  }
  
  data.forEach(s => {
    console.log(`Section ID: ${s.id}, Type: ${s.section_type}`);
    console.log(`- typeof content: ${typeof s.content}`);
    try {
      const parsed = typeof s.content === 'string' ? JSON.parse(s.content) : s.content;
      console.log(`- Parse success! Keys/Type:`, typeof parsed, Object.keys(parsed || {}));
    } catch (e) {
      console.error(`- Parse failed: ${e.message}`);
    }
    console.log('---');
  });
}
main();
