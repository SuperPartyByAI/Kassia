import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.PUBLIC_SUPABASE_URL;

// On the server, we use the Service Role key to bypass RLS and read pages/config correctly.
// On the client, we fall back to the public anon key.
const supabaseKey = 
  (typeof process !== 'undefined' && process.env.SUPABASE_SERVICE_ROLE_KEY) || 
  import.meta.env.PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  throw new Error('Missing Supabase environment variables: PUBLIC_SUPABASE_URL and PUBLIC_SUPABASE_ANON_KEY are required.');
}

export const supabase = createClient(supabaseUrl, supabaseKey);
