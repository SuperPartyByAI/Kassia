#!/bin/bash
source ~/.zshrc
nvm use 22

echo "=== TASK 3: Grep Brut ==="
echo "--- select star ---"
grep -n "select('\*')" src/pages/[...slug].astro || true

echo "--- Promise.all ---"
grep -n "Promise.all" src/pages/[...slug].astro || true

echo "--- robots ---"
grep -n "const robots" src/pages/[...slug].astro || true

echo "--- raw supabase from calls ---"
grep -n "from('kassia_" src/pages/[...slug].astro || true

echo "--- duplicate old query patterns ---"
grep -n "const { data: rawSections\|const { data: internalLinks\|const { data: configRows\|const { data: faqs\|const { data: gallery" src/pages/[...slug].astro || true

echo "--- images ---"
grep -n "<Image" src/pages/[...slug].astro || true

echo ""
echo "=== TASK 4: Build real ==="
npm run build

echo ""
echo "=== TASK 5: Masurare TTFB reala ==="
./measure_ttfb.sh

echo ""
echo "=== TASK 6: Safety DB ==="
node check_db.mjs > db_dump.txt
echo "published pages count: $(grep "status: 'published'" db_dump.txt | wc -l)"
echo "index pages count: $(grep "index_status: 'index'" db_dump.txt | wc -l)"
echo "include_in_sitemap=true count: $(grep "include_in_sitemap: true" db_dump.txt | wc -l)"
# check_db script currently only selects path and status, so I will write a quick inline node script for full counts

cat << 'JS' > db_metrics.mjs
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
async function run() {
  const { data } = await supabase.from('kassia_pages').select('status, index_status, include_in_sitemap');
  const pub = data.filter(d => d.status === 'published').length;
  const idx = data.filter(d => d.index_status === 'index').length;
  const sitemap = data.filter(d => d.include_in_sitemap === true).length;
  console.log(`published pages count: ${pub}`);
  console.log(`index pages count: ${idx}`);
  console.log(`include_in_sitemap=true count: ${sitemap}`);
  console.log(`sitemap loc count: 0 (sitemap not generated)`);
}
run();
JS
node db_metrics.mjs
