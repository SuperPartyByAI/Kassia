import fs from 'fs';
import dotenv from 'dotenv';

if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
  throw new Error('Missing SUPABASE_SERVICE_ROLE_KEY');
}
dotenv.config({ path: '.env.local' });

const SUPABASE_URL = process.env.PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL || !SUPABASE_KEY) {
    console.error("Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY");
    process.exit(1);
}

const seed = JSON.parse(fs.readFileSync('db/seed.json', 'utf8'));

function formatTitleFromPrimaryKeyword(pk) {
  if (!pk) return '';
  const capitalized = pk.charAt(0).toUpperCase() + pk.slice(1);
  const isQuestion = /^(cat |cât |ce |cum |unde |care |cand |când |se pot |cate |câte |cu cat |cu cât |cu ce )/i.test(pk);
  return (capitalized + (isQuestion ? '?' : '')).trim();
}

function toTitleCase(str) {
  return str.split('-').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ').trim();
}

async function fetchSupabase(table, method, body) {
    const res = await fetch(`${SUPABASE_URL}/rest/v1/${table}`, {
        method,
        headers: {
            'apikey': SUPABASE_KEY,
            'Authorization': `Bearer ${SUPABASE_KEY}`,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation'
        },
        body: JSON.stringify(body)
    });
    if (!res.ok) {
        const text = await res.text();
        console.error(`Error on ${method} ${table}:`, text);
        return null;
    }
    return await res.json();
}

async function run() {
    console.log("Starting API Deployment of 169 Pages...");

    const pathMap = {};

    for (const p of seed.pages) {
        let slug = p.path === '/' ? 'home' : p.path.replace(/^\/|\/$/g, '');
        if (slug.includes('/')) {
            const parts = slug.split('/');
            slug = parts[parts.length - 1];
        }
        slug = slug.replace(/-+$/, '');
        
        let title = p.path === '/' ? 'Homepage' : toTitleCase(slug);
        if (p.page_type === 'guide' || p.page_type === 'blog_post') {
            title = formatTitleFromPrimaryKeyword(p.main_keyword);
        }
        title = title.trim();

        const pageData = {
            slug,
            path: p.path,
            page_type: p.page_type,
            title,
            h1: title,
            meta_title: `${title} - Kassia`,
            meta_description: '',
            priority: 0.5,
            status: 'draft',
            index_status: 'noindex',
            include_in_sitemap: false
        };

        // UPSERT PAGE
        let pageId;
        const exist = await fetchSupabase(`kassia_pages?path=eq.${encodeURIComponent(p.path)}`, 'GET');
        if (exist && exist.length > 0) {
            pageId = exist[0].id;
            await fetchSupabase(`kassia_pages?id=eq.${pageId}`, 'PATCH', pageData);
        } else {
            const created = await fetchSupabase('kassia_pages', 'POST', pageData);
            if (created && created.length > 0) pageId = created[0].id;
        }

        if (!pageId) {
            console.error("Failed to upsert page", p.path);
            continue;
        }
        
        pathMap[p.path] = pageId;

        // SEO MAP
        const seoData = {
            page_id: pageId,
            main_keyword: p.main_keyword,
            search_intent: p.search_intent,
            parent_path: p.parent_path
        };
        const seoExist = await fetchSupabase(`kassia_seo_map?page_id=eq.${pageId}`, 'GET');
        if (seoExist && seoExist.length > 0) {
            await fetchSupabase(`kassia_seo_map?page_id=eq.${pageId}`, 'PATCH', { main_keyword: p.main_keyword, search_intent: p.search_intent, parent_path: p.parent_path });
        } else {
            await fetchSupabase('kassia_seo_map', 'POST', seoData);
        }

        // SECTIONS
        if (p.sections_to_create) {
            for (let i = 0; i < p.sections_to_create.length; i++) {
                const sec = p.sections_to_create[i];
                const secExist = await fetchSupabase(`kassia_page_sections?page_id=eq.${pageId}&section_type=eq.${sec}`, 'GET');
                if (!secExist || secExist.length === 0) {
                    await fetchSupabase('kassia_page_sections', 'POST', {
                        page_id: pageId,
                        section_type: sec,
                        content: {},
                        order_index: i + 1
                    });
                }
            }
        }

        // FAQS
        if (p.faq_slots_to_create) {
            for (let i = 1; i <= p.faq_slots_to_create; i++) {
                const faqExist = await fetchSupabase(`kassia_faqs?page_id=eq.${pageId}&order_index=eq.${i}`, 'GET');
                if (!faqExist || faqExist.length === 0) {
                    await fetchSupabase('kassia_faqs', 'POST', {
                        page_id: pageId,
                        question: `Draft FAQ ${i} for ${slug}`,
                        answer: 'Placeholder',
                        order_index: i
                    });
                }
            }
        }

        // MEDIA
        if (p.media_slots_to_create) {
            for (let i = 0; i < p.media_slots_to_create.length; i++) {
                const mediaExist = await fetchSupabase(`kassia_gallery_items?page_id=eq.${pageId}&order_index=eq.${i + 1}`, 'GET');
                if (!mediaExist || mediaExist.length === 0) {
                    await fetchSupabase('kassia_gallery_items', 'POST', {
                        page_id: pageId,
                        url: '',
                        alt_text: '',
                        order_index: i + 1
                    });
                }
            }
        }

        console.log("Processed", p.path);
    }

    // PARENT MAPPING
    for (const p of seed.pages) {
        if (p.parent_path && pathMap[p.path] && pathMap[p.parent_path]) {
            await fetchSupabase(`kassia_pages?id=eq.${pathMap[p.path]}`, 'PATCH', {
                parent_page_id: pathMap[p.parent_path]
            });
        }
    }

    // LINKS
    console.log(`Processing ${seed.links.length} internal links...`);
    for (const l of seed.links) {
        const srcId = pathMap[l.source];
        const tgtId = pathMap[l.target];
        if (srcId && tgtId) {
            const linkExist = await fetchSupabase(`kassia_internal_links?source_page_id=eq.${srcId}&target_page_id=eq.${tgtId}&anchor_text=eq.${encodeURIComponent(l.anchor)}`, 'GET');
            if (!linkExist || linkExist.length === 0) {
                await fetchSupabase('kassia_internal_links', 'POST', {
                    source_page_id: srcId,
                    target_page_id: tgtId,
                    anchor_text: l.anchor
                });
            }
        }
    }

    console.log("✅ API Deployment Finished Successfully!");
}

run().catch(console.error);
