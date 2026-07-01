source /Users/universparty/wa-web-launcher/kassia-site/.env.local

URL=${PUBLIC_SUPABASE_URL:-$VITE_SUPABASE_URL}
KEY=${SUPABASE_SERVICE_ROLE_KEY:-$VITE_SUPABASE_ANON_KEY}

echo "URL: $URL"

# GET kassia_pages count
curl -s -o /dev/null -D - -H "apikey: $KEY" -H "Authorization: Bearer $KEY" "$URL/rest/v1/kassia_pages?select=*&limit=1" -H "Range-Unit: items" -H "Range: 0-0" -H "Prefer: count=exact" | grep "content-range"

# GET kassia_internal_links count
curl -s -o /dev/null -D - -H "apikey: $KEY" -H "Authorization: Bearer $KEY" "$URL/rest/v1/kassia_internal_links?select=*&limit=1" -H "Range-Unit: items" -H "Range: 0-0" -H "Prefer: count=exact" | grep "content-range"

# GET kassia_seo_map count
curl -s -o /dev/null -D - -H "apikey: $KEY" -H "Authorization: Bearer $KEY" "$URL/rest/v1/kassia_seo_map?select=*&limit=1" -H "Range-Unit: items" -H "Range: 0-0" -H "Prefer: count=exact" | grep "content-range"

# GET published pages count
curl -s -o /dev/null -D - -H "apikey: $KEY" -H "Authorization: Bearer $KEY" "$URL/rest/v1/kassia_pages?select=*&status=eq.published&limit=1" -H "Range-Unit: items" -H "Range: 0-0" -H "Prefer: count=exact" | grep "content-range"

# GET kassia_page_sections sample
curl -s -H "apikey: $KEY" -H "Authorization: Bearer $KEY" "$URL/rest/v1/kassia_page_sections?select=*&limit=1" | jq .

# GET kassia_pages sample
curl -s -H "apikey: $KEY" -H "Authorization: Bearer $KEY" "$URL/rest/v1/kassia_pages?select=*&limit=1" | jq .

# GET kassia_faqs sample
curl -s -H "apikey: $KEY" -H "Authorization: Bearer $KEY" "$URL/rest/v1/kassia_faqs?select=*&limit=1" | jq .

# GET kassia_gallery_items sample
curl -s -H "apikey: $KEY" -H "Authorization: Bearer $KEY" "$URL/rest/v1/kassia_gallery_items?select=*&limit=1" | jq .

