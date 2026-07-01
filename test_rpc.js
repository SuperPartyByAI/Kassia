const { createClient } = require('@supabase/supabase-js');

if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
  throw new Error('Missing SUPABASE_SERVICE_ROLE_KEY');
}
const supabase = createClient('https://jrfhprnuxxfwkwjwdsez.supabase.co', process.env.SUPABASE_SERVICE_ROLE_KEY);
async function test() {
  const { data, error } = await supabase.rpc('exec_sql', { sql: 'SELECT 1;' });
  console.log(data, error);
}
test();
