import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
    auth: {
        persistSession: false,
    },
    global: {
        fetch: fetch,
    },
    realtime: {
        transport: WebSocket,
    },
});

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii-voluntari/').single();
  
  if (!page) {
    console.error("Page not found");
    return;
  }

  const newSection = {
    page_id: page.id,
    section_type: 'content',
    heading: 'Logistică și Organizare pentru Curți Mari și Ansambluri Rezidențiale',
    content: JSON.stringify({
      is_active: true,
      body: `
        <p>Pentru a asigura o petrecere dinamică într-un spațiu deschis, precum o curte generoasă din Pipera sau Voluntari, echipa noastră aplică reguli clare de organizare. Delimităm o <strong>zonă de joc</strong> umbrită, unde copiii se concentrează pe activități, prevenind împrăștierea grupului. Părinții nu trebuie să pregătească nimic special — este suficient să eliberați un spațiu de siguranță, fără obstacole periculoase. În cazul ansamblurilor rezidențiale cu regim strict de acces, vă rugăm să ne facilitați accesul auto temporar pentru descărcarea rapidă a echipamentelor audio și a accesoriilor pentru jocuri.</p>
      `
    }),
    order_index: 3 
  };

  const { data, error } = await supabase.from('kassia_page_sections').insert(newSection);
  if (error) {
    console.error("Error inserting section:", error);
  } else {
    console.log("Logistics section inserted successfully.");
  }
}
run();
