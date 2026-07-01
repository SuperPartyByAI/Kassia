import { createClient } from '@supabase/supabase-js';

const supabaseUrl = "https://jrfhprnuxxfwkwjwdsez.supabase.co";
const supabaseKey = typeof process !== "undefined" && process.env.SUPABASE_SERVICE_ROLE_KEY || "sb_publishable_6fhUh9kSv0mR8tIu1X-tJA_58ux68Me";
const supabase = createClient(supabaseUrl, supabaseKey);

export { supabase as s };
