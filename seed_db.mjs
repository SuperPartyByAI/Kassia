import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const programs = [
    {
      category: 'animatori',
      title: '1 personaj animator',
      duration_label: '2 ore',
      short_description: 'Potrivit pentru grupuri restrânse de până la 12 copii și spații bine delimitate.',
      price_amount: 490,
      currency: 'lei',
      price_prefix: 'de la',
      price_suffix: '/ 2 ore',
      includes_list: [
        "Jocuri interactive adaptate vârstei",
        "Ateliere de creație cu baloane",
        "Sistem audio profesional",
        "Asistență la tort",
        "Balloon Exploder inclus la pachetul de 2 ore"
      ],
      extra_options: [],
      details_url: '/preturi-animatori-copii-bucuresti/',
      order_index: 10,
      is_active: true,
      is_test: false,
      internal_note: 'Program de baza 1 animator',
      show_on_pricing_page: true,
      show_on_local_preview: true,
      show_price_on_pricing_page: true,
      show_price_on_local_preview: false
    },
    {
      category: 'animatori',
      title: '2 personaje animatoare',
      duration_label: '2-3 ore',
      short_description: 'Ideal pentru grupuri mai mari, spații deschise sau curți mari (peste 15 copii).',
      price_amount: 790,
      currency: 'lei',
      price_prefix: 'de la',
      price_suffix: '/ 2 ore',
      includes_list: [
        "Tot ce include pachetul cu 1 personaj",
        "Doi entertaineri coordonatori simultan",
        "Gestionare grupuri mixte (vârste diferite)",
        "Dinamism ridicat în spații mari"
      ],
      extra_options: [],
      details_url: '/preturi-animatori-copii-bucuresti/',
      order_index: 20,
      is_active: true,
      is_test: false,
      internal_note: 'Program 2 animatori',
      show_on_pricing_page: true,
      show_on_local_preview: true,
      show_price_on_pricing_page: true,
      show_price_on_local_preview: false
    },
    {
      category: 'animatori',
      title: 'Program TEST',
      duration_label: '0 ore',
      short_description: 'Test freshness.',
      price_amount: 9999,
      currency: 'lei',
      price_prefix: 'de la',
      price_suffix: '',
      includes_list: [],
      extra_options: [],
      details_url: '/preturi-animatori-copii-bucuresti/',
      order_index: 99,
      is_active: true,
      is_test: true,
      internal_note: 'TEST_FRESHNESS_v1',
      show_on_pricing_page: true,
      show_on_local_preview: true,
      show_price_on_pricing_page: true,
      show_price_on_local_preview: false
    }
  ];

  const { error } = await supabase.from('kassia_pricing_programs').insert(programs);
  if (error) console.error("Error seeding:", error.message);
  else console.log("Seeded successfully!");
  
  // Also enable preview on Voluntari
  const { error: pageErr } = await supabase.from('kassia_pages').update({ show_pricing_preview: true }).eq('slug', 'animatori-petreceri-copii-voluntari');
  if (pageErr) console.log("Error updating page:", pageErr);
  else console.log("Enabled show_pricing_preview on Voluntari!");

})();
