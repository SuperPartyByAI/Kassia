import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: prog } = await supabase.from('kassia_pricing_programs').select('id, includes_list').eq('title', '2 personaje animatoare').single();
  const updatedIncludes = prog.includes_list.map(item => {
    if (typeof item === 'string' && item === "Tot ce include pachetul cu 1 personaj") {
      return "Tot ce include programul cu 1 personaj";
    }
    return item;
  });

  const { error } = await supabase.from('kassia_pricing_programs').update({ includes_list: updatedIncludes }).eq('id', prog.id);
  if (error) console.error(error);
  else console.log("Framing updated!");
})();
