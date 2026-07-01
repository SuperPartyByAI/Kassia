import fs from 'fs';
import { fetch } from 'undici';
import * as cheerio from 'cheerio';
import { createClient } from '@supabase/supabase-js';

// Load env
const envContent = fs.readFileSync('/Users/universparty/wa-web-launcher/kassia-site/.env.local', 'utf-8');
const envVars = {};
envContent.split('\n').forEach(line => {
    const parts = line.split('=');
    if (parts.length >= 2) envVars[parts[0].trim()] = parts.slice(1).join('=').trim();
});

const SUPA_URL = envVars['PUBLIC_SUPABASE_URL'];
const SUPA_KEY = envVars['SUPABASE_SERVICE_ROLE_KEY'] || envVars['PUBLIC_SUPABASE_ANON_KEY'];
const supabase = createClient(SUPA_URL, SUPA_KEY);

async function preflight() {
    const url = "https://www.kassia.ro/animatori-petreceri-copii-floreasca";
    const slug = "animatori-petreceri-copii-floreasca";

    let result = {
        url: url,
        db_id: "",
        live_status: null,
        canonical: "",
        canonical_self: false,
        indexable: false,
        in_sitemap: false,
        internal_links_in: 0,
        title: "",
        meta_description: "",
        h1: "",
        word_count: 0,
        current_sections: [],
        current_schema_types: [],
        current_images: [],
        current_cta_detected: false,
        current_faq_detected: false,
        current_pricing_detected: false,
        cannibalization_check: {
            similar_db_pages: [],
            similar_live_pages: [],
            risk: "low"
        }
    };

    // 1. Fetch DB Page
    const { data: pageData } = await supabase.from('kassia_pages').select('*').eq('path', slug).single();
    if (pageData) {
        result.db_id = pageData.id;
        
        // Fetch sections if any
        const { data: sections } = await supabase.from('kassia_page_sections').select('section_type').eq('page_id', pageData.id);
        if (sections) {
            result.current_sections = sections.map(s => s.section_type);
        }
    }

    // 2. Check Sitemap
    try {
        const smRes = await fetch('https://www.kassia.ro/sitemap.xml');
        const smText = await smRes.text();
        result.in_sitemap = smText.includes(slug);
    } catch(e) {}

    // 3. Check Live URL
    try {
        const res = await fetch(url);
        result.live_status = res.status;
        const html = await res.text();
        const $ = cheerio.load(html);

        result.title = $('title').text().trim();
        result.meta_description = $('meta[name="description"]').attr('content') || '';
        result.h1 = $('h1').first().text().trim();
        result.canonical = $('link[rel="canonical"]').attr('href') || '';
        result.canonical_self = result.canonical === url || result.canonical === url + '/';
        
        const metaRobots = $('meta[name="robots"]').attr('content') || '';
        result.indexable = !metaRobots.includes('noindex') && result.live_status === 200;
        
        let mainText = $('main').text() || $('body').text();
        result.word_count = mainText.split(/\s+/).filter(w => w.length > 2).length;

        $('img').each((_, el) => {
            let src = $(el).attr('src');
            if (src) result.current_images.push(src);
        });

        $('script[type="application/ld+json"]').each((_, el) => {
            try {
                let json = JSON.parse($(el).html());
                if (json['@type']) result.current_schema_types.push(json['@type']);
                else if (Array.isArray(json)) result.current_schema_types.push(...json.map(j => j['@type']).filter(Boolean));
            } catch(e){}
        });

        const lowerText = mainText.toLowerCase();
        result.current_cta_detected = lowerText.includes('rezervă') || lowerText.includes('contact') || lowerText.includes('whatsapp') || lowerText.includes('suna') || lowerText.includes('telefon');
        result.current_faq_detected = lowerText.includes('frecvente') || lowerText.includes('faq');
        result.current_pricing_detected = lowerText.includes('pret') || lowerText.includes('lei') || lowerText.includes('pachet');

    } catch(e) {
        result.live_status = 500;
    }

    // 4. Check Internal Links
    try {
        const reconData = JSON.parse(fs.readFileSync('/Users/universparty/wa-web-launcher/kassia-site/audit_kassia_full_v21/db_sitemap_live_reconciliation.json', 'utf8'));
        const reconRow = reconData.find(r => r.db_url_candidate === url || r.db_url_candidate === url + '/');
        if (reconRow) {
            result.internal_links_in = reconRow.internal_links_in_count;
        }

        // 5. Cannibalization Check
        const similar = reconData.filter(r => r.db_slug && r.db_slug.includes('floreasca') && r.db_url_candidate !== url && r.db_url_candidate !== url+'/');
        result.cannibalization_check.similar_db_pages = similar.map(s => s.db_url_candidate);
        result.cannibalization_check.similar_live_pages = similar.filter(s => s.exists_live).map(s => s.db_url_candidate);
        if (similar.length > 0) result.cannibalization_check.risk = "medium";
        if (result.cannibalization_check.similar_live_pages.length > 0) result.cannibalization_check.risk = "high";
    } catch(e) {}

    console.log(JSON.stringify(result, null, 2));
}

preflight();
