import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null }
});

const SECTION_ID = '7c36af14-c261-4809-adec-a23642ef83ee';

async function fixTypo() {
  console.log("Fetching section details...");
  const { data, error: fetchErr } = await supabase
    .from('kassia_page_sections')
    .select('*')
    .eq('id', SECTION_ID)
    .single();

  if (fetchErr || !data) {
    console.error("Error fetching section:", fetchErr);
    process.exit(1);
  }

  console.log("Current content:", JSON.stringify(data.content, null, 2));

  // Update content to correct the typo
  const newContent = { ...data.content };
  newContent.image_alt = 'De ce să alegi Kassia';

  console.log("Updating section content to:", JSON.stringify(newContent, null, 2));
  const { error: updateErr } = await supabase
    .from('kassia_page_sections')
    .update({
      content: newContent,
      updated_at: new Date().toISOString()
    })
    .eq('id', SECTION_ID);

  if (updateErr) {
    console.error("Error updating section:", updateErr);
    process.exit(1);
  }

  console.log("Typo fixed successfully in Supabase!");
}

fixTypo().catch(console.error);
