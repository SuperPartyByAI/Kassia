import fs from 'fs';
import path from 'path';
import { fetch } from 'undici';
import * as cheerio from 'cheerio';
import { createClient } from '@supabase/supabase-js';

// No logging of keys anywhere.
const envContent = fs.readFileSync('/Users/universparty/wa-web-launcher/kassia-site/.env.local', 'utf-8');
const envVars = {};
envContent.split('\n').forEach(line => {
    const parts = line.split('=');
    if (parts.length >= 2) {
        envVars[parts[0].trim()] = parts.slice(1).join('=').trim();
    }
});

const SUPA_URL = envVars['PUBLIC_SUPABASE_URL'];
const SUPA_KEY = envVars['SUPABASE_SERVICE_ROLE_KEY'] || envVars['PUBLIC_SUPABASE_ANON_KEY'];
const supabase = createClient(SUPA_URL, SUPA_KEY);

const V21_DIR = '/Users/universparty/wa-web-launcher/kassia-site/audit_kassia_full_v21';
const OUT_DIR = '/Users/universparty/wa-web-launcher/kassia-site/audit_kassia_orphan_activation_v23';

if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

function wordCount(text) {
    if (!text) return 0;
    return text.split(/\s+/).filter(w => w.length > 2).length;
}

function jaccardSimilarity(text1, text2) {
    const set1 = new Set(text1.toLowerCase().split(/\s+/).filter(w => w.length > 2));
    const set2 = new Set(text2.toLowerCase().split(/\s+/).filter(w => w.length > 2));
    const intersection = new Set([...set1].filter(x => set2.has(x)));
    const union = new Set([...set1, ...set2]);
    return Math.round((intersection.size / union.size) * 100);
}

async function fetchPageData(url, reconData, sitemapText) {
    let result = {
        url: url,
        db_id: "",
        live_status: null,
        in_sitemap: false,
        indexable: false,
        meta_robots_raw: "",
        canonical: "",
        canonical_self: false,
        internal_links_in: 0,
        title: "",
        meta_description: "",
        h1: "",
        word_count: 0,
        sections: [],
        schema_types: [],
        images: [],
        cta_detected: false,
        faq_detected: false,
        pricing_detected: false,
        content_overlap_percent_estimate: 0,
        unique_value: [],
        issues: [],
        rawText: ""
    };

    let slug = url.split('/').pop();
    const { data: pageData } = await supabase.from('kassia_pages').select('*').eq('path', slug).single();
    if (pageData) {
        result.db_id = pageData.id;
        const { data: sections } = await supabase.from('kassia_page_sections').select('section_type').eq('page_id', pageData.id);
        if (sections) {
            result.sections = sections.map(s => s.section_type);
        }
    } else {
        result.issues.push("NOT_IN_DB");
    }

    result.in_sitemap = sitemapText.includes(slug);

    let reconRow = reconData.find(r => r.db_url_candidate === url || r.db_url_candidate === url + '/');
    if (reconRow) {
        result.internal_links_in = reconRow.internal_links_in_count;
    }

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
        
        result.meta_robots_raw = $('meta[name="robots"]').attr('content') || '';
        result.indexable = !result.meta_robots_raw.includes('noindex') && result.live_status === 200;
        
        let mainText = $('main').text() || $('body').text();
        result.word_count = wordCount(mainText);
        result.rawText = mainText;

        $('img').each((_, el) => {
            let src = $(el).attr('src');
            if (src) result.images.push(src);
        });

        $('script[type="application/ld+json"]').each((_, el) => {
            try {
                let json = JSON.parse($(el).html());
                if (json['@type']) result.schema_types.push(json['@type']);
                else if (Array.isArray(json)) result.schema_types.push(...json.map(j => j['@type']).filter(Boolean));
            } catch(e){}
        });

        const lowerText = mainText.toLowerCase();
        result.cta_detected = lowerText.includes('rezervă') || lowerText.includes('contact') || lowerText.includes('whatsapp') || lowerText.includes('suna') || lowerText.includes('telefon');
        result.faq_detected = lowerText.includes('frecvente') || lowerText.includes('faq');
        result.pricing_detected = lowerText.includes('pret') || lowerText.includes('lei') || lowerText.includes('pachet');

    } catch(e) {
        result.live_status = 500;
        result.issues.push("FETCH_FAILED");
    }

    return result;
}

async function compare() {
    console.log("Starting Cannibalization Check V2.3...");
    const url1 = "https://www.kassia.ro/animatori-petreceri-copii-floreasca";
    const url2 = "https://www.kassia.ro/animatori-copii-floreasca";

    const reconData = JSON.parse(fs.readFileSync(path.join(V21_DIR, 'db_sitemap_live_reconciliation.json'), 'utf8'));
    let smText = "";
    try {
        const smRes = await fetch('https://www.kassia.ro/sitemap.xml');
        smText = await smRes.text();
    } catch(e) {}

    const page1 = await fetchPageData(url1, reconData, smText);
    const page2 = await fetchPageData(url2, reconData, smText);

    page1.content_overlap_percent_estimate = jaccardSimilarity(page1.rawText, page2.rawText);
    page2.content_overlap_percent_estimate = page1.content_overlap_percent_estimate;

    if (page1.word_count > page2.word_count + 100) page1.unique_value.push("Higher Word Count");
    if (page2.word_count > page1.word_count + 100) page2.unique_value.push("Higher Word Count");

    if (page1.images.length > page2.images.length) page1.unique_value.push("More Images");
    if (page2.images.length > page1.images.length) page2.unique_value.push("More Images");

    if (page1.indexable) page1.unique_value.push("Indexable Setup");
    if (page2.indexable) page2.unique_value.push("Indexable Setup");

    if (page1.internal_links_in > page2.internal_links_in) page1.unique_value.push("More Internal Links");
    if (page2.internal_links_in > page1.internal_links_in) page2.unique_value.push("More Internal Links");

    delete page1.rawText;
    delete page2.rawText;

    const outputJson = [page1, page2];
    fs.writeFileSync(path.join(OUT_DIR, 'floreasca_cannibalization_compare.json'), JSON.stringify(outputJson, null, 2));

    // MAKE DECISION
    let decisionMd = `# Floreasca Cannibalization Decision\n\n`;
    
    // Evaluate choices
    let score1 = 0; let score2 = 0;
    if (page1.in_sitemap) score1++;
    if (page2.in_sitemap) score2++;
    
    if (page1.indexable) score1 += 2;
    if (page2.indexable) score2 += 2;

    if (page1.internal_links_in > page2.internal_links_in) score1++;
    if (page2.internal_links_in > page1.internal_links_in) score2++;

    if (page1.word_count > page2.word_count + 100) score1++;
    if (page2.word_count > page1.word_count + 100) score2++;

    let primary = null; let secondary = null;
    let chosenVariant = "";
    
    if (page1.content_overlap_percent_estimate < 30) {
        chosenVariant = "VARIANTA C - Păstrăm ambele (diferențiate)";
        decisionMd += `VARIANTA C - Păstrăm ambele. OVERLAP IS ONLY ${page1.content_overlap_percent_estimate}%\n`;
    } else {
        if (score2 >= score1) { // Favor animatori-copii-floreasca as default if equal or better
            chosenVariant = "VARIANTA A - păstrăm /animatori-copii-floreasca ca URL principal";
            primary = page2;
            secondary = page1;
        } else {
            chosenVariant = "VARIANTA B - păstrăm /animatori-petreceri-copii-floreasca ca URL principal";
            primary = page1;
            secondary = page2;
        }
    }

    decisionMd += `## Decizia Finală: ${chosenVariant}\n\n`;
    
    if (primary && secondary) {
        decisionMd += `- **URL principal recomandat**: ${primary.url}\n`;
        decisionMd += `- **URL secundar**: ${secondary.url}\n`;
        decisionMd += `- **Motivul alegerii**: URL-ul principal are un scor mai bun (Indexabil: ${primary.indexable}, In Sitemap: ${primary.in_sitemap}, Linkuri: ${primary.internal_links_in}, Word Count: ${primary.word_count} vs ${secondary.word_count}).\n`;
        decisionMd += `- **Ce conținut se păstrează**: Conținutul de bază al paginii principale.\n`;
        decisionMd += `- **Ce conținut se mută/îmbină**: Dacă pagina secundară are H2-uri sau texte utile/unice, vor fi mutate în cea principală.\n`;
        decisionMd += `- **Ce URL se pune în sitemap**: ${primary.url}\n`;
        decisionMd += `- **Ce URL primește internal links**: ${primary.url}\n`;
        decisionMd += `- **Ce URL se redirectează/canonicalizează**: ${secondary.url} va avea redirect 301 către ${primary.url} și va fi șters din sitemap/index.\n`;
        decisionMd += `- **Riscuri SEO**: Foarte mici. Vom consolida semnalele către o singură pagină cu autoritate.\n\n`;
        
        decisionMd += `## Plan exact de implementare (Fără execuție)\n`;
        decisionMd += `1. **Backup**: Salvăm conținutul vechi din ambele rute.\n`;
        decisionMd += `2. **Merge Content**: Adăugăm (dacă există) bucăți de text valoroase din \`${secondary.url.split('/').pop()}\` în \`${primary.url.split('/').pop()}\` (DB update).\n`;
        decisionMd += `3. **Set Inactive/301**: Marcăm \`${secondary.url.split('/').pop()}\` cu \`is_active = false\` și configurăm un Redirect 301 permanent către URL-ul principal.\n`;
        decisionMd += `4. **Optimize Primary**: Setăm \`is_active = true\` pentru \`${primary.url.split('/').pop()}\`, asigurăm că meta robots este index, follow și o adăugăm în sitemap.\n`;
        decisionMd += `5. **Internal Links**: Căutăm orice link intern existent către secundar și îl actualizăm către cel principal.\n`;
    }

    fs.writeFileSync(path.join(OUT_DIR, 'floreasca_cannibalization_decision.md'), decisionMd);
    console.log("FLOREASCA_CANONICALIZATION_PLAN_READY");
}

compare();
