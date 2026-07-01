import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  // 1. Remove "de la" from existing cards since they are now exact durations
  await supabase.from('kassia_pricing_programs').update({ price_prefix: '' }).in('title', ['1 personaj animator', '2 personaje animatoare', 'Animatori pe picioroange']);

  // 2. Base lists
  const base1 = ['Jocuri interactive adaptate vârstei', 'Ateliere de creație cu baloane', 'Sistem audio profesional', 'Asistență la tort'];
  const base2 = ['Tot ce include programul cu 1 personaj', 'Doi entertaineri coordonatori simultan', 'Gestionare grupuri mixte (vârste diferite)', 'Dinamism ridicat în spații mari'];

  // 3. Insert missing cards
  const newCards = [
    {
      category: 'animatori', title: '1 personaj animator', duration_label: '2 ore', short_description: 'Varianta standard recomandată pentru petreceri complete.', price_amount: 490, currency: 'lei', price_prefix: '', price_suffix: '/ 2 ore', includes_list: [...base1, 'Moment special Balloon Exploder'], details_url: '/preturi-animatori-copii-bucuresti/', order_index: 12, is_active: true, show_on_pricing_page: true, show_on_local_preview: true, show_price_on_pricing_page: true, show_price_on_local_preview: true
    },
    {
      category: 'animatori', title: '1 personaj animator', duration_label: '3 ore', short_description: 'Pentru evenimente lungi, asigură distracția continuă.', price_amount: 640, currency: 'lei', price_prefix: '', price_suffix: '/ 3 ore', includes_list: [...base1, 'Moment special Balloon Exploder', 'Pariul distracției cu Pinata'], details_url: '/preturi-animatori-copii-bucuresti/', order_index: 13, is_active: true, show_on_pricing_page: true, show_on_local_preview: false, show_price_on_pricing_page: true, show_price_on_local_preview: false
    },
    {
      category: 'animatori', title: '2 personaje animatoare', duration_label: '2 ore', short_description: 'Recomandat pentru grupuri mari și diversitate în animație.', price_amount: 830, currency: 'lei', price_prefix: '', price_suffix: '/ 2 ore', includes_list: [...base2, 'Pariul distracției cu Pinata'], details_url: '/preturi-animatori-copii-bucuresti/', order_index: 22, is_active: true, show_on_pricing_page: true, show_on_local_preview: true, show_price_on_pricing_page: true, show_price_on_local_preview: true
    },
    {
      category: 'animatori', title: '2 personaje animatoare', duration_label: '3 ore', short_description: 'Experiență premium cu durată extinsă și momente speciale.', price_amount: 1120, currency: 'lei', price_prefix: '', price_suffix: '/ 3 ore', includes_list: [...base2, 'Pariul distracției cu Pinata', 'Moment special Balloon Exploder'], details_url: '/preturi-animatori-copii-bucuresti/', order_index: 23, is_active: true, show_on_pricing_page: true, show_on_local_preview: false, show_price_on_pricing_page: true, show_price_on_local_preview: false
    },
    {
      category: 'animatori', title: '2 Animatori pe picioroange', duration_label: '1 oră', short_description: 'Impact vizual dublu pentru evenimente de scară largă.', price_amount: 2750, currency: 'lei', price_prefix: '', price_suffix: '/ 1 oră', includes_list: ['Welcome guests la locație', 'Costume tematice spectaculoase', 'Interacțiune și photo-corner mobil', 'Potrivit pentru spații mari și evenimente open-air'], details_url: '/preturi-animatori-copii-bucuresti/', order_index: 32, is_active: true, show_on_pricing_page: true, show_on_local_preview: false, show_price_on_pricing_page: true, show_price_on_local_preview: false
    }
  ];

  const { error } = await supabase.from('kassia_pricing_programs').insert(newCards);
  if (error) console.error(error);
  else console.log("Missing cards successfully inserted.");
})();
