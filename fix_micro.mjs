import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  // Fix the 3 hour variant for 1 character
  await supabase.from('kassia_pricing_programs')
    .update({ short_description: 'Pentru evenimente lungi, susține un program extins de activități.' })
    .eq('title', '1 personaj animator')
    .eq('duration_label', '3 ore');
  
  console.log("Micro-fix applied.");
})();
