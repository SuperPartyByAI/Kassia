import fs from 'fs';
import path from 'path';
import { fetch } from 'undici';
import { XMLParser } from 'fast-xml-parser';
import * as cheerio from 'cheerio';
import { createClient } from '@supabase/supabase-js';

// Load environment variables manually
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

const AUDIT_DIR = '/Users/universparty/wa-web-launcher/kassia-site/audit_kassia_full_v21';
if (!fs.existsSync(AUDIT_DIR)) fs.mkdirSync(AUDIT_DIR, { recursive: true });

function removeDiacritics(str) {
    if (!str) return '';
    return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/ș/g, 's').replace(/ț/g, 't').replace(/ă/g, 'a').replace(/â/g, 'a').replace(/î/g, 'i');
}

async function runAudit() {
    console.log("Starting V2.1 audit...");

    // PAS 1 - DB STRUCTURE
    let dbPages = [];
    let dbStructureMd = "# DB Structure (kassia_pages)\n\n";
    try {
        const { data, error } = await supabase.from('kassia_pages').select('*');
        if (error) throw error;
        dbPages = data;
        
        if (dbPages.length > 0) {
            const columns = Object.keys(dbPages[0]);
            dbStructureMd += `## Columns\n- ${columns.join('\n- ')}\n\n`;
            
            dbStructureMd += `## Sample Data (first 5 rows)\n` + JSON.stringify(dbPages.slice(0, 5), null, 2) + "\n\n";
            
            dbStructureMd += `## Fields Analysis\n`;
            dbStructureMd += `- URL/Path: ${columns.find(c => c.includes('url') || c.includes('slug') || c.includes('path')) || 'Missing'}\n`;
            dbStructureMd += `- Status/Published: ${columns.find(c => c.includes('status') || c.includes('publish') || c.includes('active')) || 'Missing'}\n`;
            dbStructureMd += `- Indexable: ${columns.find(c => c.includes('index')) || 'Missing'}\n`;
            dbStructureMd += `- Title/Meta: ${columns.find(c => c.includes('title') || c.includes('meta')) || 'Missing'}\n`;
        }
    } catch(e) {
        console.log("DB NOT AVAILABLE", e.message);
        dbStructureMd += "DB NOT AVAILABLE: " + e.message;
    }
    fs.writeFileSync(path.join(AUDIT_DIR, 'db_structure.md'), dbStructureMd);

    // FETCH SITEMAP
    let sitemapUrls = [];
    try {
        const sitemapRes = await fetch('https://www.kassia.ro/sitemap.xml');
        const sitemapText = await sitemapRes.text();
        const parser = new XMLParser();
        const sitemapObj = parser.parse(sitemapText);
        
        let rawUrls = [];
        if (sitemapObj.urlset && sitemapObj.urlset.url) {
            rawUrls = Array.isArray(sitemapObj.urlset.url) ? sitemapObj.urlset.url : [sitemapObj.urlset.url];
        } else if (sitemapObj.sitemapindex && sitemapObj.sitemapindex.sitemap) {
            let sitemaps = Array.isArray(sitemapObj.sitemapindex.sitemap) ? sitemapObj.sitemapindex.sitemap : [sitemapObj.sitemapindex.sitemap];
            for (let sm of sitemaps) {
                const subRes = await fetch(sm.loc);
                const subObj = parser.parse(await subRes.text());
                if (subObj.urlset && subObj.urlset.url) {
                    let subUrls = Array.isArray(subObj.urlset.url) ? subObj.urlset.url : [subObj.urlset.url];
                    rawUrls.push(...subUrls);
                }
            }
        }
        sitemapUrls = rawUrls.map(u => u.loc.endsWith('/') ? u.loc.slice(0, -1) : u.loc);
    } catch (e) {
        console.error("Error fetching sitemap:", e.message);
    }

    // INTERNAL LINKS GRAPH - Fetch all from sitemap + db
    let allLiveUrls = new Set(sitemapUrls);
    for (let p of dbPages) {
        let u = p.url || p.slug;
        if (u) {
            let fullUrl = u.startsWith('http') ? u : 'https://www.kassia.ro' + (u.startsWith('/') ? u : '/' + u);
            allLiveUrls.add(fullUrl.endsWith('/') ? fullUrl.slice(0, -1) : fullUrl);
        }
    }

    const liveUrlsArr = Array.from(allLiveUrls);
    let crawlData = {};
    let internalLinksMap = {}; // target -> count
    for (let u of liveUrlsArr) internalLinksMap[u] = 0;

    const chunkSize = 10;
    for (let i = 0; i < liveUrlsArr.length; i += chunkSize) {
        const chunk = liveUrlsArr.slice(i, i + chunkSize);
        await Promise.all(chunk.map(async (url) => {
            try {
                const res = await fetch(url);
                const status = res.status;
                const text = await res.text();
                const $ = cheerio.load(text);
                
                const canonical = $('link[rel="canonical"]').attr('href') || '';
                const metaRobots = $('meta[name="robots"]').attr('content') || '';
                let indexable = !(metaRobots.includes('noindex') || status !== 200);

                $('a[href]').each((_, el) => {
                    let href = $(el).attr('href');
                    if (href && (href.startsWith('/') || href.startsWith('https://www.kassia.ro'))) {
                        let absHref = href.startsWith('/') ? 'https://www.kassia.ro' + href : href;
                        let cleanHref = absHref.split('#')[0].split('?')[0];
                        if (cleanHref.endsWith('/')) cleanHref = cleanHref.slice(0, -1);
                        
                        if (internalLinksMap[cleanHref] !== undefined) {
                            internalLinksMap[cleanHref]++;
                        } else {
                            internalLinksMap[cleanHref] = 1;
                        }
                    }
                });
                
                crawlData[url] = { status, indexable, canonical };
            } catch(e) {
                crawlData[url] = { status: 500, indexable: false, canonical: '' };
            }
        }));
        console.log(`Crawled ${Math.min(i + chunkSize, liveUrlsArr.length)} / ${liveUrlsArr.length}`);
    }

    // PAS 2 - DB vs Sitemap vs Live Reconciliation
    let reconData = [];
    let dbWithUrlCount = 0;
    let live200Count = 0;
    let dbNotLiveCount = 0;
    let liveNotDbCount = 0; // Not explicitly tracked via this loop, but we can check sitemap vs DB

    for (let p of dbPages) {
        let dbUrlRaw = p.url || p.slug || '';
        let fullUrl = dbUrlRaw.startsWith('http') ? dbUrlRaw : 'https://www.kassia.ro' + (dbUrlRaw.startsWith('/') ? dbUrlRaw : '/' + dbUrlRaw);
        if (fullUrl.endsWith('/')) fullUrl = fullUrl.slice(0, -1);

        if (dbUrlRaw) dbWithUrlCount++;

        let inSitemap = sitemapUrls.includes(fullUrl);
        let liveData = crawlData[fullUrl] || { status: null, indexable: null, canonical: '' };
        let isLive = liveData.status === 200;
        
        if (isLive) live200Count++;
        if (!isLive) dbNotLiveCount++;

        let linksIn = internalLinksMap[fullUrl] || 0;

        let rec = "INVESTIGATE";
        if (isLive && inSitemap && linksIn > 0) rec = "KEEP_LIVE";
        else if (isLive && !inSitemap) rec = "ADD_TO_SITEMAP";
        else if (!isLive && p.is_active === true) rec = "PUBLISH_FROM_DB";
        else if (isLive && linksIn === 0) rec = "IMPROVE_LIVE"; // Orphan
        else if (!isLive && !p.is_active) rec = "DO_NOT_TOUCH";

        reconData.push({
            db_id: p.id,
            db_slug: dbUrlRaw,
            db_url_candidate: fullUrl,
            db_title: p.title || p.meta_title || '',
            db_status: p.is_active ? 'active' : 'inactive',
            db_published: p.is_active,
            exists_in_sitemap: inSitemap,
            exists_live: isLive,
            live_status_code: liveData.status,
            canonical: liveData.canonical,
            indexable: liveData.indexable,
            has_internal_links_in: linksIn > 0,
            internal_links_in_count: linksIn,
            service_detected: p.service_id || '',
            location_detected: p.location_id || '',
            recommendation: rec
        });
    }
    
    // Check live pages not in DB
    for (let sUrl of sitemapUrls) {
        if (!reconData.find(r => r.db_url_candidate === sUrl)) {
            liveNotDbCount++;
        }
    }

    fs.writeFileSync(path.join(AUDIT_DIR, 'db_sitemap_live_reconciliation.json'), JSON.stringify(reconData, null, 2));
    let reconCsvHeader = Object.keys(reconData[0] || {}).join(',') + '\n';
    let reconCsvRows = reconData.map(row => Object.values(row).map(v => typeof v === 'string' ? '"' + v.replace(/"/g, '""') + '"' : v).join(',')).join('\n');
    fs.writeFileSync(path.join(AUDIT_DIR, 'db_sitemap_live_reconciliation.csv'), reconCsvHeader + reconCsvRows);

    // PAS 3 - PROPOSED CLUSTERS COLLISION
    const proposed = [
        "animatori petreceri copii bucurești", "animatori petreceri copii popești-leordeni",
        "animatori petreceri copii otopeni", "animatori petreceri copii chiajna",
        "animatori petreceri copii bragadiru", "animatori petreceri copii măgurele",
        "animatori petreceri copii pantelimon", "animatori petreceri copii domnești",
        "animatori petreceri copii tunari", "animatori petreceri copii corbeanca",
        "mascote petreceri copii bucurești", "mascote petreceri copii sector 1",
        "mascote petreceri copii voluntari", "mascote petreceri copii popești-leordeni",
        "pictură pe față bucurești", "pictură pe față ilfov", "pictură pe față sector 1",
        "pictură pe față voluntari", "pictură pe față popești-leordeni", "modelaj baloane bucurești"
    ];

    let collisionData = [];
    for (let kw of proposed) {
        let cleanSlug = removeDiacritics(kw).replace(/\s+/g, '-').toLowerCase();
        
        let exactMatch = reconData.filter(r => r.db_slug && r.db_slug.includes(cleanSlug) || r.db_url_candidate.includes(cleanSlug));
        let kwNorm = removeDiacritics(kw).toLowerCase();
        let partialMatch = reconData.filter(r => {
            let tNorm = removeDiacritics(r.db_title).toLowerCase();
            let kwParts = kwNorm.split(' ');
            return kwParts.every(part => tNorm.includes(part));
        });

        let matches = [...new Set([...exactMatch, ...partialMatch])];
        let isLive = matches.some(m => m.exists_live);

        let shouldCreate = matches.length === 0;
        let shouldPublish = matches.some(m => !m.exists_live && m.db_published);
        let shouldImprove = matches.some(m => m.exists_live);

        collisionData.push({
            proposed_keyword: kw,
            proposed_slug: cleanSlug,
            exists_exact_in_db: exactMatch.length > 0,
            exists_partial_in_db: partialMatch.length > 0,
            matching_db_pages: matches.map(m => m.db_url_candidate),
            exists_live: isLive,
            should_create_new: shouldCreate,
            should_publish_existing_db_page: shouldPublish,
            should_improve_existing_live_page: shouldImprove,
            reason: shouldCreate ? "Missing in DB" : (shouldImprove ? "Already Live, Needs Growth" : "In DB but not Live")
        });
    }

    fs.writeFileSync(path.join(AUDIT_DIR, 'proposed_pages_collision_check.json'), JSON.stringify(collisionData, null, 2));
    let colCsvHeader = Object.keys(collisionData[0] || {}).join(',') + '\n';
    let colCsvRows = collisionData.map(row => Object.values(row).map(v => typeof v === 'string' ? '"' + v.replace(/"/g, '""') + '"' : (Array.isArray(v) ? '"'+v.join(';')+'"' : v)).join(',')).join('\n');
    fs.writeFileSync(path.join(AUDIT_DIR, 'proposed_pages_collision_check.csv'), colCsvHeader + colCsvRows);

    // PAS 4 - INTERNAL LINK GRAPH
    let orphanPages = reconData.filter(r => r.exists_live && r.internal_links_in_count === 0).length;
    let linkGraphMd = "# Internal Link Graph\n\n";
    linkGraphMd += `- Total Orphans: ${orphanPages}\n`;
    linkGraphMd += `## Top 10 Most Linked Pages\n`;
    let sortedLinks = Object.entries(internalLinksMap).sort((a,b) => b[1]-a[1]);
    sortedLinks.slice(0,10).forEach(entry => linkGraphMd += `- ${entry[0]}: ${entry[1]} links\n`);
    
    fs.writeFileSync(path.join(AUDIT_DIR, 'internal_link_graph.md'), linkGraphMd);
    let linkCsv = "url,links_in\n" + sortedLinks.map(e => `"${e[0]}",${e[1]}`).join('\n');
    fs.writeFileSync(path.join(AUDIT_DIR, 'internal_link_graph.csv'), linkCsv);

    // PAS 5 - DECISION PLAN V2.1
    let decMd = "# Final Decision Plan V2.1 (Reconciliation)\n\n";
    
    let toPublish = reconData.filter(r => r.recommendation === 'PUBLISH_FROM_DB' || r.recommendation === 'ADD_TO_SITEMAP');
    decMd += "## A. Pagini DB care există, dar nu sunt în sitemap/live și trebuie publicate sau reparate\n";
    toPublish.slice(0, 10).forEach((r, idx) => decMd += `${idx+1}. ${r.db_url_candidate} (${r.db_title}) - ${r.recommendation}\n`);

    let toImprove = reconData.filter(r => r.recommendation === 'IMPROVE_LIVE');
    decMd += "\n## B. Pagini live care trebuie crescute (ex: orphans)\n";
    toImprove.slice(0, 10).forEach((r, idx) => decMd += `${idx+1}. ${r.db_url_candidate} (Links in: ${r.internal_links_in_count})\n`);

    let trulyNew = collisionData.filter(c => c.should_create_new);
    decMd += "\n## C. Pagini noi care chiar lipsesc complet și pot fi create\n";
    trulyNew.slice(0, 10).forEach((c, idx) => decMd += `${idx+1}. /${c.proposed_slug} (${c.proposed_keyword})\n`);

    let cannibalizing = collisionData.filter(c => c.exists_partial_in_db && !c.exists_exact_in_db);
    decMd += "\n## D. Pagini care ar crea canibalizare dacă le facem (Avem ceva similar parțial)\n";
    cannibalizing.slice(0, 10).forEach((c, idx) => decMd += `${idx+1}. /${c.proposed_slug} (Matches: ${c.matching_db_pages.join(', ')})\n`);

    decMd += "\n## E. Prima acțiune recomandată\n";
    if (toPublish.length > 0) {
        decMd += "Să activăm / publicăm paginile din DB care stau degeaba (nu sunt live sau în sitemap).\n";
    } else if (toImprove.length > 0) {
        decMd += "Să adăugăm internal links și structură paginilor orfane / slabe existente live.\n";
    } else {
        decMd += "Să creăm clusterul nou: /" + (trulyNew[0] ? trulyNew[0].proposed_slug : "animatori-petreceri-copii-popesti-leordeni") + "\n";
    }

    fs.writeFileSync(path.join(AUDIT_DIR, 'final_decision_plan_v21.md'), decMd);

    // FINISH REPORT
    console.log(JSON.stringify({
        dbPagesTotal: dbPages.length,
        dbWithUrl: dbWithUrlCount,
        inSitemap: sitemapUrls.length,
        live200: live200Count,
        dbNotLive: dbNotLiveCount,
        liveNotDb: liveNotDbCount,
        orphanPages,
        trulyNewNeeded: trulyNew.length,
        pagesToImprove: toImprove.length,
        firstAction: toPublish.length > 0 ? "Publish existing DB pages" : (toImprove.length > 0 ? "Improve existing orphans" : "Create new pages")
    }));
}

runAudit();
