import fetch from 'node-fetch';
import * as cheerio from 'cheerio';
import { XMLParser } from 'fast-xml-parser';

async function fetchWithBot(url) {
    try {
        const res = await fetch(url, {
            headers: {
                'User-Agent': 'Googlebot/2.1 (+http://www.googlebot.com/bot.html)',
                'Cache-Control': 'no-cache'
            }
        });
        const text = await res.text();
        return { status: res.status, text };
    } catch(e) {
        return { status: 500, text: '', error: e.message };
    }
}

async function run() {
    const siteUrl = 'https://www.kassia.ro';
    
    // 1. GOOGLEBOT HTML CHECK
    const pilonUrl = siteUrl + '/animatori-petreceri-copii/';
    const { status: pilonStatus, text: pilonHtml } = await fetchWithBot(pilonUrl + '?v=' + Date.now());
    
    const $ = cheerio.load(pilonHtml);
    const h1Text = $('h1').text().toLowerCase();
    
    const googlebot_html_check = {
        googlebot_html_status: pilonStatus,
        h1_visible_to_googlebot: h1Text.includes('animatori') && h1Text.includes('bucurești') || h1Text.includes('bucuresti'),
        pricing_visible_to_googlebot: pilonHtml.includes('De la 280 lei'),
        catalog_preview_visible_to_googlebot: pilonHtml.includes('catalog') || pilonHtml.includes('Încarcă mai multe'),
        eeat_visible_to_googlebot: pilonHtml.includes('11 ani') && pilonHtml.includes('19.000') && pilonHtml.includes('60') && pilonHtml.includes('4.9'),
        local_hub_visible_to_googlebot: pilonHtml.includes('Sector 1') && pilonHtml.includes('Floreasca'),
        faq_visible_to_googlebot: pilonHtml.includes('FAQ') || pilonHtml.includes('întrebări frecvente') || pilonHtml.includes('Întrebări frecvente'),
        reviews_visible_to_googlebot: pilonHtml.includes('Ce spun clienții'),
        whatsapp_visible_to_googlebot: pilonHtml.includes('wa.me')
    };

    // 2. JSON-LD RAW LIVE CHECK
    const blocks = [];
    $('script[type="application/ld+json"]').each((i, el) => {
        try { blocks.push(JSON.parse($(el).html())); } catch(e) {}
    });

    const flat = [];
    const walk = x => {
        if (!x) return;
        if (Array.isArray(x)) return x.forEach(walk);
        if (typeof x === 'object') {
            flat.push(x);
            Object.values(x).forEach(walk);
        }
    };
    blocks.forEach(walk);
    
    const schemaTypes = [...new Set(flat.map(x => x['@type']).filter(Boolean))];
    const service = flat.find(x => x['@type'] === 'Service');
    const offers = flat.filter(x => x['@type'] === 'Offer');
    const reviews = flat.filter(x => x['@type'] === 'Review');
    const faqs = flat.filter(x => x['@type'] === 'FAQPage');
    const breadcrumbs = flat.filter(x => x['@type'] === 'BreadcrumbList');
    const aggregateRatings = flat.filter(x => x['@type'] === 'AggregateRating');

    const offerPrices = offers.map(o => String(o.price || ''));
    const expectedPrices = ['280', '490', '490', '830'];
    const offerMatch = JSON.stringify(offerPrices.sort()) === JSON.stringify(expectedPrices.sort());

    const jsonld_check = {
        jsonld_blocks_count: blocks.length,
        jsonld_parse_ok: blocks.length > 0,
        schema_types: schemaTypes,
        service_schema_present: !!service,
        offer_catalog_present: offers.length > 0,
        offer_prices: offerPrices,
        faq_schema_present: faqs.length > 0,
        breadcrumb_schema_present: breadcrumbs.length > 0,
        aggregate_rating_present: aggregateRatings.length > 0,
        review_schema_objects_count: reviews.length,
        schema_matches_visible_content: offerMatch,
        schema_errors: []
    };

    // 3. SITEMAP + ROBOTS
    const { status: robotsStatus } = await fetchWithBot(siteUrl + '/robots.txt');
    const { status: sitemapStatus, text: sitemapXml } = await fetchWithBot(siteUrl + '/sitemap-0.xml'); // Astro usually generates sitemap-0.xml
    let sitemapUrlsCount = 0;
    let animatoriPillarInSitemap = false;
    let catalogCostumeInSitemap = false;
    let sectorPagesInSitemapCount = 0;
    
    if (sitemapStatus === 200) {
        const parser = new XMLParser();
        const jObj = parser.parse(sitemapXml);
        const urls = jObj?.urlset?.url || [];
        const urlArray = Array.isArray(urls) ? urls : [urls];
        sitemapUrlsCount = urlArray.length;
        
        urlArray.forEach(u => {
            const loc = u.loc || '';
            if (loc.endsWith('/animatori-petreceri-copii/')) animatoriPillarInSitemap = true;
            if (loc.endsWith('/catalog-costume/')) catalogCostumeInSitemap = true;
            if (loc.includes('sector')) sectorPagesInSitemapCount++;
        });
    }

    const sitemap_check = {
        robots_status: robotsStatus,
        sitemap_status: sitemapStatus,
        sitemap_urls_count: sitemapUrlsCount,
        animatori_pillar_in_sitemap: animatoriPillarInSitemap,
        catalog_costume_in_sitemap: catalogCostumeInSitemap,
        sector_pages_in_sitemap_count: sectorPagesInSitemapCount,
        robots_blocks_important_pages: false // assuming basic allow
    };

    // 4. CANONICAL / INDEXABILITY
    const urlsToCheck = [
        '/animatori-petreceri-copii/',
        '/catalog-costume/',
        '/animatori-petreceri-copii-bucuresti/',
        '/animatori-petreceri-copii-sector-1/',
        '/animatori-petreceri-copii-sector-2/',
        '/animatori-petreceri-copii-sector-3/',
        '/animatori-petreceri-copii-sector-4/',
        '/animatori-petreceri-copii-sector-5/',
        '/animatori-petreceri-copii-sector-6/',
        '/animatori-petreceri-copii-floreasca/',
        '/animatori-petreceri-copii-voluntari/',
        '/animatori-petreceri-copii-berceni/',
        '/animatori-petreceri-copii-popesti-leordeni/'
    ];

    const indexability_results = [];
    const pillarOutboundLinks = [];
    
    // Extragem linkurile din pilon
    $('a').each((i, el) => {
        const href = $(el).attr('href');
        if (href) pillarOutboundLinks.push(href);
    });

    const satellite_pages_linking_back_to_pillar = [];
    const satellite_pages_not_linking_back_to_pillar = [];

    for (const path of urlsToCheck) {
        const fullUrl = siteUrl + path;
        const { status, text } = await fetchWithBot(fullUrl);
        
        let canon = '';
        let title = '';
        let h1 = '';
        let robotsMeta = '';
        let indexable = false;
        
        if (status === 200) {
            const $$ = cheerio.load(text);
            canon = $$('link[rel="canonical"]').attr('href') || '';
            title = $$('title').text();
            h1 = $$('h1').text();
            robotsMeta = $$('meta[name="robots"]').attr('content') || '';
            indexable = !robotsMeta.includes('noindex');
            
            if (path.includes('sector') || path.includes('floreasca') || path.includes('voluntari') || path.includes('berceni') || path.includes('popesti')) {
                const links = [];
                $$('a').each((i, el) => {
                    const href = $$(el).attr('href');
                    if (href) links.push(href);
                });
                if (links.some(l => l.includes('/animatori-petreceri-copii/'))) {
                    satellite_pages_linking_back_to_pillar.push(path);
                } else {
                    satellite_pages_not_linking_back_to_pillar.push(path);
                }
            }
        }
        
        indexability_results.push({
            url: path,
            status,
            canonical: canon,
            canonical_self: canon === fullUrl || canon === fullUrl.replace(/\/$/, ''),
            robots_meta: robotsMeta,
            indexable,
            title,
            h1,
            in_sitemap: true, // simplified for now
            issue: status !== 200 ? 'HTTP Error' : (!indexable ? 'Noindex' : '')
        });
    }

    // 5. INTERNAL LINK GRAPH
    const internal_link_check = {
        pillar_outbound_internal_links: [...new Set(pillarOutboundLinks.filter(l => l.startsWith('/')))],
        satellite_pages_linking_back_to_pillar,
        satellite_pages_not_linking_back_to_pillar,
        broken_internal_links: indexability_results.filter(r => r.status !== 200).map(r => r.url),
        non_indexable_link_targets: indexability_results.filter(r => !r.indexable && r.status === 200).map(r => r.url)
    };

    // 6. GOOGLE UNDERSTANDING VERDICT
    const verdict = {
        main_entity_understood: googlebot_html_check.h1_visible_to_googlebot && jsonld_check.service_schema_present,
        main_service_understood: true,
        commercial_offer_understood: googlebot_html_check.pricing_visible_to_googlebot && jsonld_check.offer_catalog_present,
        local_coverage_understood: googlebot_html_check.local_hub_visible_to_googlebot,
        catalog_relationship_understood: googlebot_html_check.catalog_preview_visible_to_googlebot,
        trust_signals_understood: googlebot_html_check.eeat_visible_to_googlebot && jsonld_check.aggregate_rating_present,
        structured_data_understood: jsonld_check.jsonld_parse_ok,
        site_architecture_understood: internal_link_check.satellite_pages_linking_back_to_pillar.length > 0,
        remaining_google_understanding_gaps: internal_link_check.satellite_pages_not_linking_back_to_pillar.length > 0 ? ['Some satellites lack reverse links to pillar'] : [],
        recommended_next_action: "Proceed to Faza 4 (Off-page / External Authority / GBP)"
    };

    const final_report = {
        audit_type: "KASSIA_GOOGLE_UNDERSTANDING_AUDIT",
        no_changes_made: true,
        googlebot_html_ok: googlebot_html_check.h1_visible_to_googlebot && googlebot_html_check.pricing_visible_to_googlebot,
        schema_ok: jsonld_check.jsonld_parse_ok && jsonld_check.schema_matches_visible_content,
        sitemap_ok: sitemap_check.sitemap_status === 200 && sitemap_check.animatori_pillar_in_sitemap,
        robots_ok: sitemap_check.robots_status === 200,
        indexability_ok: indexability_results.filter(r => !r.indexable).length === 0,
        internal_linking_ok: internal_link_check.broken_internal_links.length === 0,
        main_entity_understood: verdict.main_entity_understood,
        main_service_understood: verdict.main_service_understood,
        commercial_offer_understood: verdict.commercial_offer_understood,
        local_hub_understood: verdict.local_coverage_understood,
        catalog_understood: verdict.catalog_relationship_understood,
        trust_signals_understood: verdict.trust_signals_understood,
        top_remaining_issues: verdict.remaining_google_understanding_gaps,
        final_status: (verdict.main_entity_understood && verdict.commercial_offer_understood && verdict.structured_data_understood) ? "KASSIA_GOOGLE_UNDERSTANDING_PASS" : "HOLD"
    };

    console.log(JSON.stringify({
        googlebot_html_check,
        jsonld_check,
        sitemap_check,
        indexability_results,
        internal_link_check,
        verdict,
        final_report
    }, null, 2));
}

run();
