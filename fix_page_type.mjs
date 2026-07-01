import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const newPath = '/animatori-petreceri-copii-popesti-leordeni/';
  
  const { error } = await supabase.from('kassia_pages').update({ page_type: 'location' }).eq('path', newPath);
  
  if (error) {
      console.log('Error updating page_type:', error);
  } else {
      console.log('Successfully updated page_type to "location".');
  }
}

run();
