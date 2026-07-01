import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const NEW_SLUG = 'animatori-petreceri-copii-sector-2';

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', NEW_SLUG).single();
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
    
    console.log("\n--- 4. CONTENT / CONVERSION STANDARD ---");
    const fullText = JSON.stringify(sections).toLowerCase();
    const zones = ['colentina', 'obor', 'pantelimon', 'tei', 'floreasca', 'iancului', 'moșilor', 'mosilor', 'fundeni', 'baicului', 'doamna ghica', 'vatra luminoasa'];
    const foundZones = zones.filter(z => fullText.includes(z));
    console.log(`text localizat real pentru Sector 2: ${foundZones.length > 0 ? 'YES' : 'NO'}`);
    console.log(`zone locale menționate: ${foundZones.join(', ') || 'NICIUNA'}`);
    console.log(`explică alegerea programului după spațiu și număr copii: ${fullText.includes('spațiu') || fullText.includes('copii') ? 'YES' : 'NO'}`);
    console.log(`include apartament / restaurant / curte / loc de joacă: ${['apartament', 'restaurant', 'curte', 'loc de joacă'].some(w => fullText.includes(w)) ? 'YES' : 'NO'}`);
    console.log(`are CTA clar: ${fullText.includes('rezerv') || fullText.includes('contact') ? 'YES' : 'NO'}`);
    console.log(`are internal links utile: NO (din secțiuni lipsește micro-blocul)`);
}
run().catch(console.error);
