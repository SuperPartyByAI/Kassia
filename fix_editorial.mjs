import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
    const id = 'd4b15f67-4567-789a-bcde-f0123456789a';
    
    // Fetch the current section
    const { data: section } = await supabase.from('kassia_page_sections').select('content').eq('id', id).single();
    let body = section.content.body;
    
    // The exact old phrases that are bad
    const badText1 = "Un singur animator la un grup foarte mare riscă să piardă atenția celor mici, iar momentele de momentele creative individuale ar dura mult prea mult, tăind din timpul jocurilor. Un spațiu bine delimitat și numărul corect de animatori ajută la o o desfășurare mai clară a activităților.";
    
    // The user's exact replacement
    const newText1 = "Pentru un grup foarte mare, un singur personaj animator poate pierde atenția celor mici, iar activitățile creative individuale ar dura mult prea mult, reducând timpul pentru jocuri. Un spațiu bine delimitat și numărul corect de personaje animatoare ajută la o desfășurare mai clară a activităților.";
    
    body = body.replace(badText1, newText1);
    
    const { error } = await supabase.from('kassia_page_sections').update({
        content: { ...section.content, body: body }
    }).eq('id', id);
    
    if (error) {
        console.error("DB update error:", error);
    } else {
        console.log("DB updated successfully!");
        console.log("New body:", body);
    }
})();
