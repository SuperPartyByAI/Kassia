import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
    const { data: page } = await supabase.from('kassia_pages').select('id, path, slug').eq('id', '3a754972-74d7-4632-9dfa-2aa9be7682db').single();
    console.log("Page ID belongs to:", page);
    
    // Also, find the page ID for '/animatori-petreceri-copii/'
    const { data: page2 } = await supabase.from('kassia_pages').select('id, path, slug').eq('path', '/animatori-petreceri-copii/').single();
    console.log("Path '/animatori-petreceri-copii/' belongs to:", page2);
})();
