import { createClient } from '@supabase/supabase-js';

// Service role key is only for server-side use and must NEVER be exposed publicly.
const supabaseUrl = import.meta.env.SUPABASE_URL || import.meta.env.PUBLIC_SUPABASE_URL;
const supabaseServiceKey = import.meta.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  throw new Error('Missing Supabase environment variables: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are required for admin operations.');
}

export const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey);
