import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import fs from 'fs';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const pageId = '6b8b02e6-951f-4587-9144-de76ae0fa606';
    const patch1Id = '4329ea71-cb50-4b54-b624-55bf19594b70';
    const patch2Id = '4497cbf5-7439-4eb9-85bb-c3fa6acbbb7d';
    const insertAfterId = 'b7b38c9b-41fa-461d-99c7-bb73915307d0';
    const insertAfterOrder = 5;

    // Fetch current state for patch 1 and 2 to preserve other keys
    const { data: s6Sections, error: secErr } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId).order('order_index', { ascending: true });
    if (secErr) return console.error('Error fetching sections', secErr);

    const patch1Row = s6Sections.find(s => s.id === patch1Id);
    const patch2Row = s6Sections.find(s => s.id === patch2Id);

    // PATCH 1
    const patch1Content = { ...patch1Row.content };
    patch1Content.body = "<p>Înainte de rezervare, poți consulta variantele de program disponibile pentru <a href=\"/animatori-petreceri-copii/\">animatori copii în București și Ilfov</a>, în funcție de durata evenimentului și tipul de animație dorit.</p>";
    
    const { error: err1 } = await supabase.from('kassia_page_sections').update({ content: patch1Content }).eq('id', patch1Id);
    if (err1) console.error('Error on Patch 1', err1);
    else console.log('PATCH 1: SUCCESS');

    // PATCH 2
    const patch2Content = patch2Row.content || {};
    patch2Content.body = "<p>Pentru fiecare petrecere organizată în Sectorul 6, echipa noastră alege o succesiune de jocuri interactive, dansuri și activități statice. Dacă locația permite, se poate include și modelajul de baloane ca parte integrantă din activitatea animatorilor, menținând energia pe tot parcursul programului.</p>";
    
    const { error: err2 } = await supabase.from('kassia_page_sections').update({ content: patch2Content }).eq('id', patch2Id);
    if (err2) console.error('Error on Patch 2', err2);
    else console.log('PATCH 2: SUCCESS');

    // PATCH 3 (Insert)
    // First, shift all order_index > 5 up by 1
    const toShift = s6Sections.filter(s => s.order_index > 5).sort((a, b) => b.order_index - a.order_index); // sort descending to avoid unique constraint collisions if any
    for (const row of toShift) {
        await supabase.from('kassia_page_sections').update({ order_index: row.order_index + 1 }).eq('id', row.id);
    }
    
    const newSection = {
        page_id: pageId,
        section_type: 'content',
        heading: 'Variante de program pentru petreceri în Sector 6',
        content: {
            body: "<ul><li><strong>1 personaj animator / 1 oră / 280 lei</strong></li><li><strong>1 personaj animator / 2 ore / 490 lei</strong></li><li><strong>2 personaje animatoare / 1 oră / 490 lei</strong></li><li><strong>2 personaje animatoare / 2 ore / 830 lei</strong></li></ul>"
        },
        order_index: 6
    };
    
    const { error: err3 } = await supabase.from('kassia_page_sections').insert(newSection);
    if (err3) console.error('Error on Patch 3', err3);
    else console.log('PATCH 3: SUCCESS');
    
    console.log('ALL PATCHES EXECUTED.');
}

run().catch(console.error);
