import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null }
});

const SECTION_ID = 'a1d82f34-1234-4567-89ab-cdef01234567';

async function fixTypo() {
  console.log("=== CORECTARE TYPO ALT TEXT IN DATABASE ===");
  
  // 1. Fetch current content of the section
  const { data: section, error: fetchErr } = await supabase
    .from('kassia_page_sections')
    .select('content')
    .eq('id', SECTION_ID)
    .single();

  if (fetchErr || !section) {
    console.error("Eroare la aducerea secțiunii:", fetchErr?.message);
    process.exit(1);
  }

  let content = typeof section.content === 'string' ? JSON.parse(section.content) : section.content;
  
  // 2. Locate and modify the card
  if (!content.cards || !Array.isArray(content.cards)) {
    console.error("Secțiunea nu conține un array valid de carduri.");
    process.exit(1);
  }

  let found = false;
  content.cards = content.cards.map(card => {
    if (card.title === 'Mini-disco și dansuri' && card.image_alt === 'Copii dancing la mini disco') {
      card.image_alt = 'Copii dansând la mini-disco';
      found = true;
    }
    return card;
  });

  if (!found) {
    console.log("Nu s-a găsit cardul cu textul specificat sau typo-ul a fost deja corectat.");
    process.exit(0);
  }

  // 3. Update in database
  const { error: updateErr } = await supabase
    .from('kassia_page_sections')
    .update({ content: content, updated_at: new Date().toISOString() })
    .eq('id', SECTION_ID);

  if (updateErr) {
    console.error("Eroare la actualizarea secțiunii:", updateErr.message);
    process.exit(1);
  }

  console.log("✅ Typo-ul 'Copii dancing la mini disco' a fost corectat cu succes în 'Copii dansând la mini-disco'!");
}

fixTypo().catch(console.error);
