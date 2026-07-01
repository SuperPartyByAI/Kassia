-- SEED SKELETON PREVIEW PENTRU KASSIA V5.4 (169 PAGES)
-- GENERATED VIA SCRIPT.

BEGIN;

DO $$
DECLARE
    v_page_id UUID;
BEGIN

    -- PAGE: /
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('home', '/', 'homepage', 'Homepage', 'Homepage', 'Homepage - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for home', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for home', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for home', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /despre-noi/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('despre-noi', '/despre-noi/', 'support', 'Despre Noi', 'Despre Noi', 'Despre Noi - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /contact/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('contact', '/contact/', 'support', 'Contact', 'Contact', 'Contact - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /galerie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('galerie', '/galerie/', 'support', 'Galerie', 'Galerie', 'Galerie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /preturi-decoratiuni-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('preturi-decoratiuni-baloane', '/preturi-decoratiuni-baloane/', 'support', 'Preturi Decoratiuni Baloane', 'Preturi Decoratiuni Baloane', 'Preturi Decoratiuni Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /intrebari-frecvente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('intrebari-frecvente', '/intrebari-frecvente/', 'support', 'Intrebari Frecvente', 'Intrebari Frecvente', 'Intrebari Frecvente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /recenzii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('recenzii', '/recenzii/', 'support', 'Recenzii', 'Recenzii', 'Recenzii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /portofoliu-evenimente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('portofoliu-evenimente', '/portofoliu-evenimente/', 'support', 'Portofoliu Evenimente', 'Portofoliu Evenimente', 'Portofoliu Evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /termeni-si-conditii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('termeni-si-conditii', '/termeni-si-conditii/', 'support', 'Termeni Si Conditii', 'Termeni Si Conditii', 'Termeni Si Conditii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /politica-de-confidentialitate/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('politica-de-confidentialitate', '/politica-de-confidentialitate/', 'support', 'Politica De Confidentialitate', 'Politica De Confidentialitate', 'Politica De Confidentialitate - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blog', '/blog/', 'support', 'Blog', 'Blog', 'Blog - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /politica-cookies/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('politica-cookies', '/politica-cookies/', 'support', 'Politica Cookies', 'Politica Cookies', 'Politica Cookies - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'content', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-bucuresti', '/decoratiuni-baloane-bucuresti/', 'service_pillar', 'Decoratiuni Baloane Bucuresti', 'Decoratiuni Baloane Bucuresti', 'Decoratiuni Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /aranjamente-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('aranjamente-baloane-bucuresti', '/aranjamente-baloane-bucuresti/', 'service', 'Aranjamente Baloane Bucuresti', 'Aranjamente Baloane Bucuresti', 'Aranjamente Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for aranjamente-baloane-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for aranjamente-baloane-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for aranjamente-baloane-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /arcada-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-bucuresti', '/arcada-baloane-bucuresti/', 'service', 'Arcada Baloane Bucuresti', 'Arcada Baloane Bucuresti', 'Arcada Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for arcada-baloane-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for arcada-baloane-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for arcada-baloane-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /baloane-heliu-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-bucuresti', '/baloane-heliu-bucuresti/', 'service', 'Baloane Heliu Bucuresti', 'Baloane Heliu Bucuresti', 'Baloane Heliu Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for baloane-heliu-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for baloane-heliu-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for baloane-heliu-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /panou-foto-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('panou-foto-baloane-bucuresti', '/panou-foto-baloane-bucuresti/', 'service', 'Panou Foto Baloane Bucuresti', 'Panou Foto Baloane Bucuresti', 'Panou Foto Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for panou-foto-baloane-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for panou-foto-baloane-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for panou-foto-baloane-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /buchete-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('buchete-baloane-bucuresti', '/buchete-baloane-bucuresti/', 'service', 'Buchete Baloane Bucuresti', 'Buchete Baloane Bucuresti', 'Buchete Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for buchete-baloane-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for buchete-baloane-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for buchete-baloane-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /baloane-personalizate-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-personalizate-bucuresti', '/baloane-personalizate-bucuresti/', 'service', 'Baloane Personalizate Bucuresti', 'Baloane Personalizate Bucuresti', 'Baloane Personalizate Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for baloane-personalizate-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for baloane-personalizate-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for baloane-personalizate-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /baloane-cifre-litere-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-cifre-litere-bucuresti', '/baloane-cifre-litere-bucuresti/', 'service', 'Baloane Cifre Litere Bucuresti', 'Baloane Cifre Litere Bucuresti', 'Baloane Cifre Litere Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for baloane-cifre-litere-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for baloane-cifre-litere-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for baloane-cifre-litere-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /ghirlande-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('ghirlande-baloane-bucuresti', '/ghirlande-baloane-bucuresti/', 'service', 'Ghirlande Baloane Bucuresti', 'Ghirlande Baloane Bucuresti', 'Ghirlande Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for ghirlande-baloane-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for ghirlande-baloane-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for ghirlande-baloane-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /stalpi-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('stalpi-baloane-bucuresti', '/stalpi-baloane-bucuresti/', 'service', 'Stalpi Baloane Bucuresti', 'Stalpi Baloane Bucuresti', 'Stalpi Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for stalpi-baloane-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for stalpi-baloane-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for stalpi-baloane-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /perete-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('perete-baloane-bucuresti', '/perete-baloane-bucuresti/', 'service', 'Perete Baloane Bucuresti', 'Perete Baloane Bucuresti', 'Perete Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for perete-baloane-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for perete-baloane-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for perete-baloane-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decor-baloane-candy-bar-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decor-baloane-candy-bar-bucuresti', '/decor-baloane-candy-bar-bucuresti/', 'service', 'Decor Baloane Candy Bar Bucuresti', 'Decor Baloane Candy Bar Bucuresti', 'Decor Baloane Candy Bar Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-candy-bar-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-candy-bar-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-candy-bar-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /livrare-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('livrare-baloane-bucuresti', '/livrare-baloane-bucuresti/', 'service', 'Livrare Baloane Bucuresti', 'Livrare Baloane Bucuresti', 'Livrare Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'service_features', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for livrare-baloane-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for livrare-baloane-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for livrare-baloane-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-botez-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-botez-bucuresti', '/decoratiuni-baloane-botez-bucuresti/', 'event', 'Decoratiuni Baloane Botez Bucuresti', 'Decoratiuni Baloane Botez Bucuresti', 'Decoratiuni Baloane Botez Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-botez-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-botez-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-botez-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-mot-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-mot-bucuresti', '/decoratiuni-baloane-mot-bucuresti/', 'event', 'Decoratiuni Baloane Mot Bucuresti', 'Decoratiuni Baloane Mot Bucuresti', 'Decoratiuni Baloane Mot Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-mot-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-mot-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-mot-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-turta-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-turta-bucuresti', '/decoratiuni-baloane-turta-bucuresti/', 'event', 'Decoratiuni Baloane Turta Bucuresti', 'Decoratiuni Baloane Turta Bucuresti', 'Decoratiuni Baloane Turta Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-turta-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-turta-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-turta-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-nunta-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-nunta-bucuresti', '/decoratiuni-baloane-nunta-bucuresti/', 'event', 'Decoratiuni Baloane Nunta Bucuresti', 'Decoratiuni Baloane Nunta Bucuresti', 'Decoratiuni Baloane Nunta Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-nunta-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-nunta-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-nunta-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-8-martie-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-8-martie-bucuresti', '/decoratiuni-baloane-8-martie-bucuresti/', 'event', 'Decoratiuni Baloane 8 Martie Bucuresti', 'Decoratiuni Baloane 8 Martie Bucuresti', 'Decoratiuni Baloane 8 Martie Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-8-martie-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-8-martie-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-8-martie-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-cununie-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-cununie-bucuresti', '/decoratiuni-baloane-cununie-bucuresti/', 'event', 'Decoratiuni Baloane Cununie Bucuresti', 'Decoratiuni Baloane Cununie Bucuresti', 'Decoratiuni Baloane Cununie Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-cununie-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-cununie-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-cununie-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-majorat-bucuresti', '/decoratiuni-baloane-majorat-bucuresti/', 'event', 'Decoratiuni Baloane Majorat Bucuresti', 'Decoratiuni Baloane Majorat Bucuresti', 'Decoratiuni Baloane Majorat Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-majorat-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-majorat-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-majorat-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-aniversare-copii-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aniversare-copii-bucuresti', '/decoratiuni-baloane-aniversare-copii-bucuresti/', 'event', 'Decoratiuni Baloane Aniversare Copii Bucuresti', 'Decoratiuni Baloane Aniversare Copii Bucuresti', 'Decoratiuni Baloane Aniversare Copii Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-aniversare-copii-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-aniversare-copii-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-aniversare-copii-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-aniversare-adulti-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aniversare-adulti-bucuresti', '/decoratiuni-baloane-aniversare-adulti-bucuresti/', 'event', 'Decoratiuni Baloane Aniversare Adulti Bucuresti', 'Decoratiuni Baloane Aniversare Adulti Bucuresti', 'Decoratiuni Baloane Aniversare Adulti Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-aniversare-adulti-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-aniversare-adulti-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-aniversare-adulti-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-petrecere-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-petrecere-bucuresti', '/decoratiuni-baloane-petrecere-bucuresti/', 'event', 'Decoratiuni Baloane Petrecere Bucuresti', 'Decoratiuni Baloane Petrecere Bucuresti', 'Decoratiuni Baloane Petrecere Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-petrecere-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-petrecere-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-petrecere-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-corporate-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-corporate-bucuresti', '/decoratiuni-baloane-corporate-bucuresti/', 'event', 'Decoratiuni Baloane Corporate Bucuresti', 'Decoratiuni Baloane Corporate Bucuresti', 'Decoratiuni Baloane Corporate Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-corporate-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-corporate-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-corporate-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-deschidere-magazin-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-deschidere-magazin-bucuresti', '/decoratiuni-baloane-deschidere-magazin-bucuresti/', 'event', 'Decoratiuni Baloane Deschidere Magazin Bucuresti', 'Decoratiuni Baloane Deschidere Magazin Bucuresti', 'Decoratiuni Baloane Deschidere Magazin Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-deschidere-magazin-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-deschidere-magazin-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-deschidere-magazin-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-deschidere-restaurant-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-deschidere-restaurant-bucuresti', '/decoratiuni-baloane-deschidere-restaurant-bucuresti/', 'event', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-deschidere-restaurant-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-deschidere-restaurant-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-deschidere-restaurant-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-lansare-produs-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-lansare-produs-bucuresti', '/decoratiuni-baloane-lansare-produs-bucuresti/', 'event', 'Decoratiuni Baloane Lansare Produs Bucuresti', 'Decoratiuni Baloane Lansare Produs Bucuresti', 'Decoratiuni Baloane Lansare Produs Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-lansare-produs-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-lansare-produs-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-lansare-produs-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-showroom-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-showroom-bucuresti', '/decoratiuni-baloane-showroom-bucuresti/', 'event', 'Decoratiuni Baloane Showroom Bucuresti', 'Decoratiuni Baloane Showroom Bucuresti', 'Decoratiuni Baloane Showroom Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-showroom-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-showroom-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-showroom-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-gradinita-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-gradinita-bucuresti', '/decoratiuni-baloane-gradinita-bucuresti/', 'event', 'Decoratiuni Baloane Gradinita Bucuresti', 'Decoratiuni Baloane Gradinita Bucuresti', 'Decoratiuni Baloane Gradinita Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-gradinita-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-gradinita-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-gradinita-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-scoala-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-scoala-bucuresti', '/decoratiuni-baloane-scoala-bucuresti/', 'event', 'Decoratiuni Baloane Scoala Bucuresti', 'Decoratiuni Baloane Scoala Bucuresti', 'Decoratiuni Baloane Scoala Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-scoala-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-scoala-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-scoala-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-baby-shower-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-baby-shower-bucuresti', '/decoratiuni-baloane-baby-shower-bucuresti/', 'event', 'Decoratiuni Baloane Baby Shower Bucuresti', 'Decoratiuni Baloane Baby Shower Bucuresti', 'Decoratiuni Baloane Baby Shower Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-baby-shower-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-baby-shower-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-baby-shower-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-gender-reveal-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-gender-reveal-bucuresti', '/decoratiuni-baloane-gender-reveal-bucuresti/', 'event', 'Decoratiuni Baloane Gender Reveal Bucuresti', 'Decoratiuni Baloane Gender Reveal Bucuresti', 'Decoratiuni Baloane Gender Reveal Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-gender-reveal-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-gender-reveal-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-gender-reveal-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-craciun-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-craciun-bucuresti', '/decoratiuni-baloane-craciun-bucuresti/', 'event', 'Decoratiuni Baloane Craciun Bucuresti', 'Decoratiuni Baloane Craciun Bucuresti', 'Decoratiuni Baloane Craciun Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-craciun-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-craciun-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-craciun-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-revelion-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-revelion-bucuresti', '/decoratiuni-baloane-revelion-bucuresti/', 'event', 'Decoratiuni Baloane Revelion Bucuresti', 'Decoratiuni Baloane Revelion Bucuresti', 'Decoratiuni Baloane Revelion Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-revelion-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-revelion-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-revelion-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-paste-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-paste-bucuresti', '/decoratiuni-baloane-paste-bucuresti/', 'event', 'Decoratiuni Baloane Paste Bucuresti', 'Decoratiuni Baloane Paste Bucuresti', 'Decoratiuni Baloane Paste Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-paste-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-paste-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-paste-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-halloween-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-halloween-bucuresti', '/decoratiuni-baloane-halloween-bucuresti/', 'event', 'Decoratiuni Baloane Halloween Bucuresti', 'Decoratiuni Baloane Halloween Bucuresti', 'Decoratiuni Baloane Halloween Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-halloween-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-halloween-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-halloween-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-1-iunie-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-1-iunie-bucuresti', '/decoratiuni-baloane-1-iunie-bucuresti/', 'event', 'Decoratiuni Baloane 1 Iunie Bucuresti', 'Decoratiuni Baloane 1 Iunie Bucuresti', 'Decoratiuni Baloane 1 Iunie Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-1-iunie-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-1-iunie-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-1-iunie-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-absolvire-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-absolvire-bucuresti', '/decoratiuni-baloane-absolvire-bucuresti/', 'event', 'Decoratiuni Baloane Absolvire Bucuresti', 'Decoratiuni Baloane Absolvire Bucuresti', 'Decoratiuni Baloane Absolvire Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'event_use_cases', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-absolvire-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-absolvire-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-absolvire-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-sector-1/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-1', '/decoratiuni-baloane-sector-1/', 'location', 'Decoratiuni Baloane Sector 1', 'Decoratiuni Baloane Sector 1', 'Decoratiuni Baloane Sector 1 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-1', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-1', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-1', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-sector-2/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-2', '/decoratiuni-baloane-sector-2/', 'location', 'Decoratiuni Baloane Sector 2', 'Decoratiuni Baloane Sector 2', 'Decoratiuni Baloane Sector 2 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-2', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-2', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-2', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-sector-3/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-3', '/decoratiuni-baloane-sector-3/', 'location', 'Decoratiuni Baloane Sector 3', 'Decoratiuni Baloane Sector 3', 'Decoratiuni Baloane Sector 3 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-3', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-3', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-3', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-sector-4/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-4', '/decoratiuni-baloane-sector-4/', 'location', 'Decoratiuni Baloane Sector 4', 'Decoratiuni Baloane Sector 4', 'Decoratiuni Baloane Sector 4 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-4', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-4', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-4', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-sector-5/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-5', '/decoratiuni-baloane-sector-5/', 'location', 'Decoratiuni Baloane Sector 5', 'Decoratiuni Baloane Sector 5', 'Decoratiuni Baloane Sector 5 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-5', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-5', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-5', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-sector-6/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-6', '/decoratiuni-baloane-sector-6/', 'location', 'Decoratiuni Baloane Sector 6', 'Decoratiuni Baloane Sector 6', 'Decoratiuni Baloane Sector 6 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-6', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-6', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-6', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-aviatiei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aviatiei', '/decoratiuni-baloane-aviatiei/', 'location', 'Decoratiuni Baloane Aviatiei', 'Decoratiuni Baloane Aviatiei', 'Decoratiuni Baloane Aviatiei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-aviatiei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-aviatiei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-aviatiei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-baneasa/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-baneasa', '/decoratiuni-baloane-baneasa/', 'location', 'Decoratiuni Baloane Baneasa', 'Decoratiuni Baloane Baneasa', 'Decoratiuni Baloane Baneasa - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-baneasa', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-baneasa', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-baneasa', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-domenii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-domenii', '/decoratiuni-baloane-domenii/', 'location', 'Decoratiuni Baloane Domenii', 'Decoratiuni Baloane Domenii', 'Decoratiuni Baloane Domenii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-domenii', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-domenii', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-domenii', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-herastrau/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-herastrau', '/decoratiuni-baloane-herastrau/', 'location', 'Decoratiuni Baloane Herastrau', 'Decoratiuni Baloane Herastrau', 'Decoratiuni Baloane Herastrau - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-herastrau', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-herastrau', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-herastrau', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-victoriei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-victoriei', '/decoratiuni-baloane-victoriei/', 'location', 'Decoratiuni Baloane Victoriei', 'Decoratiuni Baloane Victoriei', 'Decoratiuni Baloane Victoriei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-victoriei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-victoriei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-victoriei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-colentina/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-colentina', '/decoratiuni-baloane-colentina/', 'location', 'Decoratiuni Baloane Colentina', 'Decoratiuni Baloane Colentina', 'Decoratiuni Baloane Colentina - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-colentina', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-colentina', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-colentina', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-obor/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-obor', '/decoratiuni-baloane-obor/', 'location', 'Decoratiuni Baloane Obor', 'Decoratiuni Baloane Obor', 'Decoratiuni Baloane Obor - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-obor', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-obor', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-obor', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-pantelimon/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-pantelimon', '/decoratiuni-baloane-pantelimon/', 'location', 'Decoratiuni Baloane Pantelimon', 'Decoratiuni Baloane Pantelimon', 'Decoratiuni Baloane Pantelimon - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-pantelimon', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-pantelimon', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-pantelimon', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-tei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-tei', '/decoratiuni-baloane-tei/', 'location', 'Decoratiuni Baloane Tei', 'Decoratiuni Baloane Tei', 'Decoratiuni Baloane Tei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-tei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-tei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-tei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-stefan-cel-mare/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-stefan-cel-mare', '/decoratiuni-baloane-stefan-cel-mare/', 'location', 'Decoratiuni Baloane Stefan Cel Mare', 'Decoratiuni Baloane Stefan Cel Mare', 'Decoratiuni Baloane Stefan Cel Mare - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-stefan-cel-mare', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-stefan-cel-mare', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-stefan-cel-mare', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-dristor/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dristor', '/decoratiuni-baloane-dristor/', 'location', 'Decoratiuni Baloane Dristor', 'Decoratiuni Baloane Dristor', 'Decoratiuni Baloane Dristor - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-dristor', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-dristor', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-dristor', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-titan/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-titan', '/decoratiuni-baloane-titan/', 'location', 'Decoratiuni Baloane Titan', 'Decoratiuni Baloane Titan', 'Decoratiuni Baloane Titan - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-titan', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-titan', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-titan', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-vitan/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-vitan', '/decoratiuni-baloane-vitan/', 'location', 'Decoratiuni Baloane Vitan', 'Decoratiuni Baloane Vitan', 'Decoratiuni Baloane Vitan - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-vitan', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-vitan', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-vitan', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-unirii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-unirii', '/decoratiuni-baloane-unirii/', 'location', 'Decoratiuni Baloane Unirii', 'Decoratiuni Baloane Unirii', 'Decoratiuni Baloane Unirii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-unirii', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-unirii', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-unirii', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-dudesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dudesti', '/decoratiuni-baloane-dudesti/', 'location', 'Decoratiuni Baloane Dudesti', 'Decoratiuni Baloane Dudesti', 'Decoratiuni Baloane Dudesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-dudesti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-dudesti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-dudesti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-berceni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-berceni', '/decoratiuni-baloane-berceni/', 'location', 'Decoratiuni Baloane Berceni', 'Decoratiuni Baloane Berceni', 'Decoratiuni Baloane Berceni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-berceni', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-berceni', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-berceni', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-tineretului/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-tineretului', '/decoratiuni-baloane-tineretului/', 'location', 'Decoratiuni Baloane Tineretului', 'Decoratiuni Baloane Tineretului', 'Decoratiuni Baloane Tineretului - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-tineretului', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-tineretului', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-tineretului', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-piata-sudului/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-piata-sudului', '/decoratiuni-baloane-piata-sudului/', 'location', 'Decoratiuni Baloane Piata Sudului', 'Decoratiuni Baloane Piata Sudului', 'Decoratiuni Baloane Piata Sudului - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-piata-sudului', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-piata-sudului', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-piata-sudului', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-aparatorii-patriei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aparatorii-patriei', '/decoratiuni-baloane-aparatorii-patriei/', 'location', 'Decoratiuni Baloane Aparatorii Patriei', 'Decoratiuni Baloane Aparatorii Patriei', 'Decoratiuni Baloane Aparatorii Patriei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-aparatorii-patriei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-aparatorii-patriei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-aparatorii-patriei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-oltenitei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-oltenitei', '/decoratiuni-baloane-oltenitei/', 'location', 'Decoratiuni Baloane Oltenitei', 'Decoratiuni Baloane Oltenitei', 'Decoratiuni Baloane Oltenitei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-oltenitei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-oltenitei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-oltenitei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-rahova/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-rahova', '/decoratiuni-baloane-rahova/', 'location', 'Decoratiuni Baloane Rahova', 'Decoratiuni Baloane Rahova', 'Decoratiuni Baloane Rahova - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-rahova', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-rahova', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-rahova', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-cotroceni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-cotroceni', '/decoratiuni-baloane-cotroceni/', 'location', 'Decoratiuni Baloane Cotroceni', 'Decoratiuni Baloane Cotroceni', 'Decoratiuni Baloane Cotroceni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-cotroceni', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-cotroceni', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-cotroceni', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-13-septembrie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-13-septembrie', '/decoratiuni-baloane-13-septembrie/', 'location', 'Decoratiuni Baloane 13 Septembrie', 'Decoratiuni Baloane 13 Septembrie', 'Decoratiuni Baloane 13 Septembrie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-13-septembrie', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-13-septembrie', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-13-septembrie', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-ferentari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-ferentari', '/decoratiuni-baloane-ferentari/', 'location', 'Decoratiuni Baloane Ferentari', 'Decoratiuni Baloane Ferentari', 'Decoratiuni Baloane Ferentari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-ferentari', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-ferentari', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-ferentari', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-sebastian/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sebastian', '/decoratiuni-baloane-sebastian/', 'location', 'Decoratiuni Baloane Sebastian', 'Decoratiuni Baloane Sebastian', 'Decoratiuni Baloane Sebastian - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sebastian', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sebastian', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sebastian', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-drumul-taberei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-drumul-taberei', '/decoratiuni-baloane-drumul-taberei/', 'location', 'Decoratiuni Baloane Drumul Taberei', 'Decoratiuni Baloane Drumul Taberei', 'Decoratiuni Baloane Drumul Taberei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-drumul-taberei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-drumul-taberei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-drumul-taberei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-militari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-militari', '/decoratiuni-baloane-militari/', 'location', 'Decoratiuni Baloane Militari', 'Decoratiuni Baloane Militari', 'Decoratiuni Baloane Militari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-militari', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-militari', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-militari', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-crangasi/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-crangasi', '/decoratiuni-baloane-crangasi/', 'location', 'Decoratiuni Baloane Crangasi', 'Decoratiuni Baloane Crangasi', 'Decoratiuni Baloane Crangasi - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-crangasi', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-crangasi', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-crangasi', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-giulesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-giulesti', '/decoratiuni-baloane-giulesti/', 'location', 'Decoratiuni Baloane Giulesti', 'Decoratiuni Baloane Giulesti', 'Decoratiuni Baloane Giulesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-giulesti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-giulesti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-giulesti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-grozavesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-grozavesti', '/decoratiuni-baloane-grozavesti/', 'location', 'Decoratiuni Baloane Grozavesti', 'Decoratiuni Baloane Grozavesti', 'Decoratiuni Baloane Grozavesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-grozavesti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-grozavesti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-grozavesti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-ilfov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-ilfov', '/decoratiuni-baloane-ilfov/', 'location', 'Decoratiuni Baloane Ilfov', 'Decoratiuni Baloane Ilfov', 'Decoratiuni Baloane Ilfov - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-ilfov', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-ilfov', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-ilfov', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-voluntari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-voluntari', '/decoratiuni-baloane-voluntari/', 'location', 'Decoratiuni Baloane Voluntari', 'Decoratiuni Baloane Voluntari', 'Decoratiuni Baloane Voluntari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-voluntari', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-voluntari', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-voluntari', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-pipera/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-pipera', '/decoratiuni-baloane-pipera/', 'location', 'Decoratiuni Baloane Pipera', 'Decoratiuni Baloane Pipera', 'Decoratiuni Baloane Pipera - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-pipera', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-pipera', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-pipera', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-otopeni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-otopeni', '/decoratiuni-baloane-otopeni/', 'location', 'Decoratiuni Baloane Otopeni', 'Decoratiuni Baloane Otopeni', 'Decoratiuni Baloane Otopeni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-otopeni', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-otopeni', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-otopeni', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-tunari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-tunari', '/decoratiuni-baloane-tunari/', 'location', 'Decoratiuni Baloane Tunari', 'Decoratiuni Baloane Tunari', 'Decoratiuni Baloane Tunari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-tunari', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-tunari', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-tunari', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-corbeanca/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-corbeanca', '/decoratiuni-baloane-corbeanca/', 'location', 'Decoratiuni Baloane Corbeanca', 'Decoratiuni Baloane Corbeanca', 'Decoratiuni Baloane Corbeanca - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-corbeanca', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-corbeanca', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-corbeanca', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-balotesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-balotesti', '/decoratiuni-baloane-balotesti/', 'location', 'Decoratiuni Baloane Balotesti', 'Decoratiuni Baloane Balotesti', 'Decoratiuni Baloane Balotesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-balotesti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-balotesti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-balotesti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-mogosoaia/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-mogosoaia', '/decoratiuni-baloane-mogosoaia/', 'location', 'Decoratiuni Baloane Mogosoaia', 'Decoratiuni Baloane Mogosoaia', 'Decoratiuni Baloane Mogosoaia - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-mogosoaia', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-mogosoaia', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-mogosoaia', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-chitila/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-chitila', '/decoratiuni-baloane-chitila/', 'location', 'Decoratiuni Baloane Chitila', 'Decoratiuni Baloane Chitila', 'Decoratiuni Baloane Chitila - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-chitila', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-chitila', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-chitila', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-chiajna/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-chiajna', '/decoratiuni-baloane-chiajna/', 'location', 'Decoratiuni Baloane Chiajna', 'Decoratiuni Baloane Chiajna', 'Decoratiuni Baloane Chiajna - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-chiajna', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-chiajna', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-chiajna', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-domnesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-domnesti', '/decoratiuni-baloane-domnesti/', 'location', 'Decoratiuni Baloane Domnesti', 'Decoratiuni Baloane Domnesti', 'Decoratiuni Baloane Domnesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-domnesti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-domnesti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-domnesti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-bragadiru/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-bragadiru', '/decoratiuni-baloane-bragadiru/', 'location', 'Decoratiuni Baloane Bragadiru', 'Decoratiuni Baloane Bragadiru', 'Decoratiuni Baloane Bragadiru - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-bragadiru', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-bragadiru', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-bragadiru', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-magurele/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-magurele', '/decoratiuni-baloane-magurele/', 'location', 'Decoratiuni Baloane Magurele', 'Decoratiuni Baloane Magurele', 'Decoratiuni Baloane Magurele - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-magurele', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-magurele', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-magurele', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-popesti-leordeni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-popesti-leordeni', '/decoratiuni-baloane-popesti-leordeni/', 'location', 'Decoratiuni Baloane Popesti Leordeni', 'Decoratiuni Baloane Popesti Leordeni', 'Decoratiuni Baloane Popesti Leordeni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-popesti-leordeni', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-popesti-leordeni', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-popesti-leordeni', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-berceni-ilfov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-berceni-ilfov', '/decoratiuni-baloane-berceni-ilfov/', 'location', 'Decoratiuni Baloane Berceni Ilfov', 'Decoratiuni Baloane Berceni Ilfov', 'Decoratiuni Baloane Berceni Ilfov - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-berceni-ilfov', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-berceni-ilfov', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-berceni-ilfov', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-pantelimon-ilfov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-pantelimon-ilfov', '/decoratiuni-baloane-pantelimon-ilfov/', 'location', 'Decoratiuni Baloane Pantelimon Ilfov', 'Decoratiuni Baloane Pantelimon Ilfov', 'Decoratiuni Baloane Pantelimon Ilfov - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-pantelimon-ilfov', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-pantelimon-ilfov', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-pantelimon-ilfov', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-cernica/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-cernica', '/decoratiuni-baloane-cernica/', 'location', 'Decoratiuni Baloane Cernica', 'Decoratiuni Baloane Cernica', 'Decoratiuni Baloane Cernica - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-cernica', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-cernica', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-cernica', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-afumati/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-afumati', '/decoratiuni-baloane-afumati/', 'location', 'Decoratiuni Baloane Afumati', 'Decoratiuni Baloane Afumati', 'Decoratiuni Baloane Afumati - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-afumati', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-afumati', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-afumati', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-stefanestii-de-jos/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-stefanestii-de-jos', '/decoratiuni-baloane-stefanestii-de-jos/', 'location', 'Decoratiuni Baloane Stefanestii De Jos', 'Decoratiuni Baloane Stefanestii De Jos', 'Decoratiuni Baloane Stefanestii De Jos - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-stefanestii-de-jos', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-stefanestii-de-jos', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-stefanestii-de-jos', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-dascalu/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dascalu', '/decoratiuni-baloane-dascalu/', 'location', 'Decoratiuni Baloane Dascalu', 'Decoratiuni Baloane Dascalu', 'Decoratiuni Baloane Dascalu - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-dascalu', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-dascalu', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-dascalu', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-snagov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-snagov', '/decoratiuni-baloane-snagov/', 'location', 'Decoratiuni Baloane Snagov', 'Decoratiuni Baloane Snagov', 'Decoratiuni Baloane Snagov - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-snagov', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-snagov', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-snagov', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-clinceni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-clinceni', '/decoratiuni-baloane-clinceni/', 'location', 'Decoratiuni Baloane Clinceni', 'Decoratiuni Baloane Clinceni', 'Decoratiuni Baloane Clinceni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-clinceni', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-clinceni', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-clinceni', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-dragomiresti-vale/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dragomiresti-vale', '/decoratiuni-baloane-dragomiresti-vale/', 'location', 'Decoratiuni Baloane Dragomiresti Vale', 'Decoratiuni Baloane Dragomiresti Vale', 'Decoratiuni Baloane Dragomiresti Vale - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-dragomiresti-vale', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-dragomiresti-vale', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-dragomiresti-vale', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-jilava/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-jilava', '/decoratiuni-baloane-jilava/', 'location', 'Decoratiuni Baloane Jilava', 'Decoratiuni Baloane Jilava', 'Decoratiuni Baloane Jilava - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-jilava', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-jilava', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-jilava', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-1-decembrie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-1-decembrie', '/decoratiuni-baloane-1-decembrie/', 'location', 'Decoratiuni Baloane 1 Decembrie', 'Decoratiuni Baloane 1 Decembrie', 'Decoratiuni Baloane 1 Decembrie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'available_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'nearby_areas', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-1-decembrie', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-1-decembrie', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-1-decembrie', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /arcada-baloane-botez-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-botez-bucuresti', '/arcada-baloane-botez-bucuresti/', 'satellite', 'Arcada Baloane Botez Bucuresti', 'Arcada Baloane Botez Bucuresti', 'Arcada Baloane Botez Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for arcada-baloane-botez-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for arcada-baloane-botez-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for arcada-baloane-botez-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /arcada-baloane-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-majorat-bucuresti', '/arcada-baloane-majorat-bucuresti/', 'satellite', 'Arcada Baloane Majorat Bucuresti', 'Arcada Baloane Majorat Bucuresti', 'Arcada Baloane Majorat Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for arcada-baloane-majorat-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for arcada-baloane-majorat-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for arcada-baloane-majorat-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /arcada-baloane-nunta-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-nunta-bucuresti', '/arcada-baloane-nunta-bucuresti/', 'satellite', 'Arcada Baloane Nunta Bucuresti', 'Arcada Baloane Nunta Bucuresti', 'Arcada Baloane Nunta Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for arcada-baloane-nunta-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for arcada-baloane-nunta-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for arcada-baloane-nunta-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /panou-foto-baloane-botez-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('panou-foto-baloane-botez-bucuresti', '/panou-foto-baloane-botez-bucuresti/', 'satellite', 'Panou Foto Baloane Botez Bucuresti', 'Panou Foto Baloane Botez Bucuresti', 'Panou Foto Baloane Botez Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for panou-foto-baloane-botez-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for panou-foto-baloane-botez-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for panou-foto-baloane-botez-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /panou-foto-baloane-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('panou-foto-baloane-majorat-bucuresti', '/panou-foto-baloane-majorat-bucuresti/', 'satellite', 'Panou Foto Baloane Majorat Bucuresti', 'Panou Foto Baloane Majorat Bucuresti', 'Panou Foto Baloane Majorat Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for panou-foto-baloane-majorat-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for panou-foto-baloane-majorat-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for panou-foto-baloane-majorat-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /baloane-heliu-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-majorat-bucuresti', '/baloane-heliu-majorat-bucuresti/', 'satellite', 'Baloane Heliu Majorat Bucuresti', 'Baloane Heliu Majorat Bucuresti', 'Baloane Heliu Majorat Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for baloane-heliu-majorat-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for baloane-heliu-majorat-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for baloane-heliu-majorat-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /baloane-heliu-aniversare-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-aniversare-bucuresti', '/baloane-heliu-aniversare-bucuresti/', 'satellite', 'Baloane Heliu Aniversare Bucuresti', 'Baloane Heliu Aniversare Bucuresti', 'Baloane Heliu Aniversare Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for baloane-heliu-aniversare-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for baloane-heliu-aniversare-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for baloane-heliu-aniversare-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /buchete-baloane-aniversare-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('buchete-baloane-aniversare-bucuresti', '/buchete-baloane-aniversare-bucuresti/', 'satellite', 'Buchete Baloane Aniversare Bucuresti', 'Buchete Baloane Aniversare Bucuresti', 'Buchete Baloane Aniversare Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for buchete-baloane-aniversare-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for buchete-baloane-aniversare-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for buchete-baloane-aniversare-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-roz-auriu-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-roz-auriu-bucuresti', '/decoratiuni-baloane-roz-auriu-bucuresti/', 'satellite', 'Decoratiuni Baloane Roz Auriu Bucuresti', 'Decoratiuni Baloane Roz Auriu Bucuresti', 'Decoratiuni Baloane Roz Auriu Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-roz-auriu-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-roz-auriu-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-roz-auriu-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /decoratiuni-baloane-alb-auriu-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-alb-auriu-bucuresti', '/decoratiuni-baloane-alb-auriu-bucuresti/', 'satellite', 'Decoratiuni Baloane Alb Auriu Bucuresti', 'Decoratiuni Baloane Alb Auriu Bucuresti', 'Decoratiuni Baloane Alb Auriu Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'gallery', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'pricing', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-alb-auriu-bucuresti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-alb-auriu-bucuresti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-alb-auriu-bucuresti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cat-costa-decoratiunile-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cat-costa-decoratiunile-cu-baloane', '/blog/cat-costa-decoratiunile-cu-baloane/', 'guide', 'Cât costă decorațiunile cu baloane?', 'Cât costă decorațiunile cu baloane?', 'Cât costă decorațiunile cu baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-decoratiunile-cu-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-decoratiunile-cu-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-decoratiunile-cu-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cat-costa-o-arcada-de-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cat-costa-o-arcada-de-baloane', '/blog/cat-costa-o-arcada-de-baloane/', 'guide', 'Cât costă o arcadă de baloane?', 'Cât costă o arcadă de baloane?', 'Cât costă o arcadă de baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-o-arcada-de-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-o-arcada-de-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-o-arcada-de-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cat-costa-baloanele-cu-heliu/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cat-costa-baloanele-cu-heliu', '/blog/cat-costa-baloanele-cu-heliu/', 'guide', 'Cât costă baloanele cu heliu?', 'Cât costă baloanele cu heliu?', 'Cât costă baloanele cu heliu? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-baloanele-cu-heliu', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-baloanele-cu-heliu', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-baloanele-cu-heliu', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cat-costa-un-panou-foto-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cat-costa-un-panou-foto-cu-baloane', '/blog/cat-costa-un-panou-foto-cu-baloane/', 'guide', 'Cât costă un panou foto cu baloane?', 'Cât costă un panou foto cu baloane?', 'Cât costă un panou foto cu baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-un-panou-foto-cu-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-un-panou-foto-cu-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-un-panou-foto-cu-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cat-costa-un-decor-de-baloane-pentru-botez/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cat-costa-un-decor-de-baloane-pentru-botez', '/blog/cat-costa-un-decor-de-baloane-pentru-botez/', 'guide', 'Cât costă decor baloane botez?', 'Cât costă decor baloane botez?', 'Cât costă decor baloane botez? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-un-decor-de-baloane-pentru-botez', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-un-decor-de-baloane-pentru-botez', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-un-decor-de-baloane-pentru-botez', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cat-costa-un-decor-de-baloane-pentru-nunta/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cat-costa-un-decor-de-baloane-pentru-nunta', '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/', 'guide', 'Cât costă decor baloane nuntă?', 'Cât costă decor baloane nuntă?', 'Cât costă decor baloane nuntă? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-un-decor-de-baloane-pentru-nunta', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-un-decor-de-baloane-pentru-nunta', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-un-decor-de-baloane-pentru-nunta', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/ce-include-un-pachet-decor-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('ce-include-un-pachet-decor-baloane', '/blog/ce-include-un-pachet-decor-baloane/', 'guide', 'Ce include un pachet decor baloane?', 'Ce include un pachet decor baloane?', 'Ce include un pachet decor baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for ce-include-un-pachet-decor-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for ce-include-un-pachet-decor-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for ce-include-un-pachet-decor-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cum-alegi-pachetul-de-decoratiuni-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cum-alegi-pachetul-de-decoratiuni-baloane', '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/', 'guide', 'Cum alegi pachetul de decorațiuni baloane?', 'Cum alegi pachetul de decorațiuni baloane?', 'Cum alegi pachetul de decorațiuni baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cum-alegi-pachetul-de-decoratiuni-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cum-alegi-pachetul-de-decoratiuni-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cum-alegi-pachetul-de-decoratiuni-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cum-alegi-arcada-de-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cum-alegi-arcada-de-baloane', '/blog/cum-alegi-arcada-de-baloane/', 'guide', 'Cum alegi arcada de baloane?', 'Cum alegi arcada de baloane?', 'Cum alegi arcada de baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cum-alegi-arcada-de-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cum-alegi-arcada-de-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cum-alegi-arcada-de-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/arcada-baloane-organica-sau-clasica/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-organica-sau-clasica', '/blog/arcada-baloane-organica-sau-clasica/', 'guide', 'Arcadă baloane organică sau clasică', 'Arcadă baloane organică sau clasică', 'Arcadă baloane organică sau clasică - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for arcada-baloane-organica-sau-clasica', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for arcada-baloane-organica-sau-clasica', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for arcada-baloane-organica-sau-clasica', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane', '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/', 'guide', 'Dimensiune arcadă baloane', 'Dimensiune arcadă baloane', 'Dimensiune arcadă baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/unde-se-poate-monta-o-arcada-de-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('unde-se-poate-monta-o-arcada-de-baloane', '/blog/unde-se-poate-monta-o-arcada-de-baloane/', 'guide', 'Unde se poate monta o arcadă de baloane?', 'Unde se poate monta o arcadă de baloane?', 'Unde se poate monta o arcadă de baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for unde-se-poate-monta-o-arcada-de-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for unde-se-poate-monta-o-arcada-de-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for unde-se-poate-monta-o-arcada-de-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cat-rezista-o-arcada-de-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cat-rezista-o-arcada-de-baloane', '/blog/cat-rezista-o-arcada-de-baloane/', 'guide', 'Cât rezistă o arcadă de baloane?', 'Cât rezistă o arcadă de baloane?', 'Cât rezistă o arcadă de baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cat-rezista-o-arcada-de-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cat-rezista-o-arcada-de-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cat-rezista-o-arcada-de-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-arcada-baloane-pentru-evenimente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-arcada-baloane-pentru-evenimente', '/blog/idei-arcada-baloane-pentru-evenimente/', 'guide', 'Idei arcadă baloane evenimente', 'Idei arcadă baloane evenimente', 'Idei arcadă baloane evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-arcada-baloane-pentru-evenimente', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-arcada-baloane-pentru-evenimente', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-arcada-baloane-pentru-evenimente', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/baloane-heliu-cat-rezista/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-cat-rezista', '/blog/baloane-heliu-cat-rezista/', 'guide', 'Baloane heliu cât rezistă', 'Baloane heliu cât rezistă', 'Baloane heliu cât rezistă - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for baloane-heliu-cat-rezista', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for baloane-heliu-cat-rezista', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for baloane-heliu-cat-rezista', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/baloane-heliu-latex-sau-folie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-latex-sau-folie', '/blog/baloane-heliu-latex-sau-folie/', 'guide', 'Baloane heliu latex sau folie', 'Baloane heliu latex sau folie', 'Baloane heliu latex sau folie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for baloane-heliu-latex-sau-folie', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for baloane-heliu-latex-sau-folie', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for baloane-heliu-latex-sau-folie', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera', '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/', 'guide', 'Câte baloane cu heliu sunt necesare pentru o cameră?', 'Câte baloane cu heliu sunt necesare pentru o cameră?', 'Câte baloane cu heliu sunt necesare pentru o cameră? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cum-se-transporta-baloanele-cu-heliu/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cum-se-transporta-baloanele-cu-heliu', '/blog/cum-se-transporta-baloanele-cu-heliu/', 'guide', 'Cum se transportă baloanele cu heliu?', 'Cum se transportă baloanele cu heliu?', 'Cum se transportă baloanele cu heliu? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cum-se-transporta-baloanele-cu-heliu', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cum-se-transporta-baloanele-cu-heliu', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cum-se-transporta-baloanele-cu-heliu', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/baloane-cu-heliu-pentru-copii-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-cu-heliu-pentru-copii-idei', '/blog/baloane-cu-heliu-pentru-copii-idei/', 'guide', 'Baloane cu heliu pentru copii idei', 'Baloane cu heliu pentru copii idei', 'Baloane cu heliu pentru copii idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for baloane-cu-heliu-pentru-copii-idei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for baloane-cu-heliu-pentru-copii-idei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for baloane-cu-heliu-pentru-copii-idei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/baloane-cu-heliu-pentru-majorat-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-cu-heliu-pentru-majorat-idei', '/blog/baloane-cu-heliu-pentru-majorat-idei/', 'guide', 'Baloane cu heliu pentru majorat idei', 'Baloane cu heliu pentru majorat idei', 'Baloane cu heliu pentru majorat idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for baloane-cu-heliu-pentru-majorat-idei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for baloane-cu-heliu-pentru-majorat-idei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for baloane-cu-heliu-pentru-majorat-idei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-decor-baloane-botez/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-decor-baloane-botez', '/blog/idei-decor-baloane-botez/', 'guide', 'Idei decor baloane botez', 'Idei decor baloane botez', 'Idei decor baloane botez - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-botez', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-botez', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-botez', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-decor-baloane-mot-si-turta/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-decor-baloane-mot-si-turta', '/blog/idei-decor-baloane-mot-si-turta/', 'guide', 'Idei decor baloane moț și turtă', 'Idei decor baloane moț și turtă', 'Idei decor baloane moț și turtă - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-mot-si-turta', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-mot-si-turta', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-mot-si-turta', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-decor-baloane-nunta/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-decor-baloane-nunta', '/blog/idei-decor-baloane-nunta/', 'guide', 'Idei decor baloane nuntă', 'Idei decor baloane nuntă', 'Idei decor baloane nuntă - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-nunta', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-nunta', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-nunta', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-decor-baloane-cununie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-decor-baloane-cununie', '/blog/idei-decor-baloane-cununie/', 'guide', 'Idei decor baloane cununie', 'Idei decor baloane cununie', 'Idei decor baloane cununie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-cununie', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-cununie', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-cununie', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-decor-baloane-majorat/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-decor-baloane-majorat', '/blog/idei-decor-baloane-majorat/', 'guide', 'Idei decor baloane majorat', 'Idei decor baloane majorat', 'Idei decor baloane majorat - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-majorat', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-majorat', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-majorat', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-decor-baloane-aniversare-copii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-decor-baloane-aniversare-copii', '/blog/idei-decor-baloane-aniversare-copii/', 'guide', 'Idei decor baloane aniversare copii', 'Idei decor baloane aniversare copii', 'Idei decor baloane aniversare copii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-aniversare-copii', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-aniversare-copii', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-aniversare-copii', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-decor-baloane-aniversare-adulti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-decor-baloane-aniversare-adulti', '/blog/idei-decor-baloane-aniversare-adulti/', 'guide', 'Idei decor baloane aniversare adulți', 'Idei decor baloane aniversare adulți', 'Idei decor baloane aniversare adulți - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-aniversare-adulti', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-aniversare-adulti', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-aniversare-adulti', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-decor-baloane-baby-shower/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-decor-baloane-baby-shower', '/blog/idei-decor-baloane-baby-shower/', 'guide', 'Idei decor baloane baby shower', 'Idei decor baloane baby shower', 'Idei decor baloane baby shower - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-baby-shower', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-baby-shower', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-baby-shower', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-decor-baloane-gender-reveal/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-decor-baloane-gender-reveal', '/blog/idei-decor-baloane-gender-reveal/', 'guide', 'Idei decor baloane gender reveal', 'Idei decor baloane gender reveal', 'Idei decor baloane gender reveal - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-gender-reveal', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-gender-reveal', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-gender-reveal', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/idei-decor-baloane-corporate/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('idei-decor-baloane-corporate', '/blog/idei-decor-baloane-corporate/', 'guide', 'Idei decor baloane corporate', 'Idei decor baloane corporate', 'Idei decor baloane corporate - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-corporate', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-corporate', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-corporate', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cum-alegi-culorile-pentru-decorul-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cum-alegi-culorile-pentru-decorul-cu-baloane', '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/', 'guide', 'Cum alegi culorile pentru decorul cu baloane?', 'Cum alegi culorile pentru decorul cu baloane?', 'Cum alegi culorile pentru decorul cu baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cum-alegi-culorile-pentru-decorul-cu-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cum-alegi-culorile-pentru-decorul-cu-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cum-alegi-culorile-pentru-decorul-cu-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/decor-baloane-roz-auriu-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decor-baloane-roz-auriu-idei', '/blog/decor-baloane-roz-auriu-idei/', 'guide', 'Decor baloane roz auriu idei', 'Decor baloane roz auriu idei', 'Decor baloane roz auriu idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-roz-auriu-idei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-roz-auriu-idei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-roz-auriu-idei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/decor-baloane-alb-auriu-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decor-baloane-alb-auriu-idei', '/blog/decor-baloane-alb-auriu-idei/', 'guide', 'Decor baloane alb auriu idei', 'Decor baloane alb auriu idei', 'Decor baloane alb auriu idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-alb-auriu-idei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-alb-auriu-idei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-alb-auriu-idei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/decor-baloane-pastel-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decor-baloane-pastel-idei', '/blog/decor-baloane-pastel-idei/', 'guide', 'Decor baloane pastel idei', 'Decor baloane pastel idei', 'Decor baloane pastel idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-pastel-idei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-pastel-idei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-pastel-idei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/decor-baloane-luxury-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decor-baloane-luxury-idei', '/blog/decor-baloane-luxury-idei/', 'guide', 'Decor baloane luxury idei', 'Decor baloane luxury idei', 'Decor baloane luxury idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-luxury-idei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-luxury-idei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-luxury-idei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/decor-baloane-minimalist-sau-spectaculos/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decor-baloane-minimalist-sau-spectaculos', '/blog/decor-baloane-minimalist-sau-spectaculos/', 'guide', 'Decor baloane minimalist sau spectaculos', 'Decor baloane minimalist sau spectaculos', 'Decor baloane minimalist sau spectaculos - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-minimalist-sau-spectaculos', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-minimalist-sau-spectaculos', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-minimalist-sau-spectaculos', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cum-comanzi-decoratiuni-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cum-comanzi-decoratiuni-cu-baloane', '/blog/cum-comanzi-decoratiuni-cu-baloane/', 'guide', 'Cum comanzi decorațiuni cu baloane?', 'Cum comanzi decorațiuni cu baloane?', 'Cum comanzi decorațiuni cu baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cum-comanzi-decoratiuni-cu-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cum-comanzi-decoratiuni-cu-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cum-comanzi-decoratiuni-cu-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cu-cat-timp-inainte-se-comanda-decorul-cu-baloane', '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/', 'guide', 'Cu cât timp înainte se comandă decorul cu baloane?', 'Cu cât timp înainte se comandă decorul cu baloane?', 'Cu cât timp înainte se comandă decorul cu baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cu-cat-timp-inainte-se-comanda-decorul-cu-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cu-cat-timp-inainte-se-comanda-decorul-cu-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cu-cat-timp-inainte-se-comanda-decorul-cu-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('ce-informatii-trebuie-sa-trimiti-pentru-o-oferta', '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/', 'guide', 'Ce informații trebuie să trimiți pentru ofertă decor baloane?', 'Ce informații trebuie să trimiți pentru ofertă decor baloane?', 'Ce informații trebuie să trimiți pentru ofertă decor baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for ce-informatii-trebuie-sa-trimiti-pentru-o-oferta', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for ce-informatii-trebuie-sa-trimiti-pentru-o-oferta', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for ce-informatii-trebuie-sa-trimiti-pentru-o-oferta', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cum-se-face-montajul-decoratiunilor-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cum-se-face-montajul-decoratiunilor-cu-baloane', '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/', 'guide', 'Montaj decorațiuni baloane', 'Montaj decorațiuni baloane', 'Montaj decorațiuni baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cum-se-face-montajul-decoratiunilor-cu-baloane', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cum-se-face-montajul-decoratiunilor-cu-baloane', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cum-se-face-montajul-decoratiunilor-cu-baloane', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('se-pot-monta-decoratiuni-cu-baloane-in-exterior', '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/', 'guide', 'Decorațiuni baloane exterior', 'Decorațiuni baloane exterior', 'Decorațiuni baloane exterior - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for se-pot-monta-decoratiuni-cu-baloane-in-exterior', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for se-pot-monta-decoratiuni-cu-baloane-in-exterior', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for se-pot-monta-decoratiuni-cu-baloane-in-exterior', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/ce-se-intampla-cu-decorul-dupa-eveniment/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('ce-se-intampla-cu-decorul-dupa-eveniment', '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/', 'guide', 'Ce se întâmplă cu decorul după eveniment?', 'Ce se întâmplă cu decorul după eveniment?', 'Ce se întâmplă cu decorul după eveniment? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for ce-se-intampla-cu-decorul-dupa-eveniment', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for ce-se-intampla-cu-decorul-dupa-eveniment', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for ce-se-intampla-cu-decorul-dupa-eveniment', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/panou-foto-cu-baloane-idei-si-recomandari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('panou-foto-cu-baloane-idei-si-recomandari', '/blog/panou-foto-cu-baloane-idei-si-recomandari/', 'guide', 'Panou foto cu baloane idei', 'Panou foto cu baloane idei', 'Panou foto cu baloane idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for panou-foto-cu-baloane-idei-si-recomandari', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for panou-foto-cu-baloane-idei-si-recomandari', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for panou-foto-cu-baloane-idei-si-recomandari', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/candy-bar-cu-decor-de-baloane-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('candy-bar-cu-decor-de-baloane-idei', '/blog/candy-bar-cu-decor-de-baloane-idei/', 'guide', 'Candy bar cu decor de baloane idei', 'Candy bar cu decor de baloane idei', 'Candy bar cu decor de baloane idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for candy-bar-cu-decor-de-baloane-idei', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for candy-bar-cu-decor-de-baloane-idei', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for candy-bar-cu-decor-de-baloane-idei', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/foto-corner-cu-baloane-pentru-evenimente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('foto-corner-cu-baloane-pentru-evenimente', '/blog/foto-corner-cu-baloane-pentru-evenimente/', 'guide', 'Foto corner cu baloane pentru evenimente', 'Foto corner cu baloane pentru evenimente', 'Foto corner cu baloane pentru evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for foto-corner-cu-baloane-pentru-evenimente', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for foto-corner-cu-baloane-pentru-evenimente', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for foto-corner-cu-baloane-pentru-evenimente', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/cifre-si-litere-din-baloane-cand-se-folosesc/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('cifre-si-litere-din-baloane-cand-se-folosesc', '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/', 'guide', 'Cifre și litere din baloane', 'Cifre și litere din baloane', 'Cifre și litere din baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for cifre-si-litere-din-baloane-cand-se-folosesc', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for cifre-si-litere-din-baloane-cand-se-folosesc', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for cifre-si-litere-din-baloane-cand-se-folosesc', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/buchete-baloane-cand-se-potrivesc/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('buchete-baloane-cand-se-potrivesc', '/blog/buchete-baloane-cand-se-potrivesc/', 'guide', 'Buchete baloane când se potrivesc', 'Buchete baloane când se potrivesc', 'Buchete baloane când se potrivesc - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for buchete-baloane-cand-se-potrivesc', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for buchete-baloane-cand-se-potrivesc', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for buchete-baloane-cand-se-potrivesc', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

    -- PAGE: /blog/baloane-personalizate-pentru-evenimente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-personalizate-pentru-evenimente', '/blog/baloane-personalizate-pentru-evenimente/', 'guide', 'Baloane personalizate pentru evenimente', 'Baloane personalizate pentru evenimente', 'Baloane personalizate pentru evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    ON CONFLICT (path) DO UPDATE SET
        slug = EXCLUDED.slug,
        page_type = EXCLUDED.page_type,
        title = EXCLUDED.title,
        h1 = EXCLUDED.h1,
        meta_title = EXCLUDED.meta_title,
        canonical_url = EXCLUDED.canonical_url,
        priority = EXCLUDED.priority,
        status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.status ELSE EXCLUDED.status END,
        index_status = CASE WHEN kassia_pages.status = 'published' THEN kassia_pages.index_status ELSE EXCLUDED.index_status END
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'hero', '', 1)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'intro', '', 2)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'toc', '', 3)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'main_answer', '', 4)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'examples', '', 5)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'mistakes_to_avoid', '', 6)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'recommended_services', '', 7)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'faq', '', 8)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
    VALUES (v_page_id, 'final_cta', '', 9)
    ON CONFLICT (page_id, section_type) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 1 for baloane-personalizate-pentru-evenimente', 'Placeholder', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 2 for baloane-personalizate-pentru-evenimente', 'Placeholder', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_faqs (page_id, question, answer, order_index)
    VALUES (v_page_id, 'Draft FAQ 3 for baloane-personalizate-pentru-evenimente', 'Placeholder', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 1)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 2)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 3)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 4)
    ON CONFLICT (page_id, order_index) DO NOTHING;
    INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
    VALUES (v_page_id, '', '', 5)
    ON CONFLICT (page_id, order_index) DO NOTHING;

END $$;

DO $$
BEGIN

    -- Update parent_page_id mapping
    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/despre-noi/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/galerie/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/preturi-decoratiuni-baloane/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/intrebari-frecvente/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/recenzii/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/termeni-si-conditii/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/politica-de-confidentialitate/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/politica-cookies/' AND p2.path = '/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-roz-auriu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-alb-auriu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-decoratiunile-cu-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-o-arcada-de-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-baloanele-cu-heliu/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-panou-foto-cu-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/ce-include-un-pachet-decor-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-arcada-de-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/arcada-baloane-organica-sau-clasica/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cat-rezista-o-arcada-de-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-cat-rezista/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-latex-sau-folie/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cum-se-transporta-baloanele-cu-heliu/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-copii-idei/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-botez/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-mot-si-turta/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-nunta/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-cununie/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-majorat/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-copii/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-adulti/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-baby-shower/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-gender-reveal/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-corporate/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-roz-auriu-idei/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-alb-auriu-idei/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-pastel-idei/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-luxury-idei/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-minimalist-sau-spectaculos/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cum-comanzi-decoratiuni-cu-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/candy-bar-cu-decor-de-baloane-idei/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/foto-corner-cu-baloane-pentru-evenimente/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/buchete-baloane-cand-se-potrivesc/' AND p2.path = '/blog/';

    UPDATE kassia_pages p1
    SET parent_page_id = p2.id
    FROM kassia_pages p2
    WHERE p1.path = '/blog/baloane-personalizate-pentru-evenimente/' AND p2.path = '/blog/';

END $$;

DO $$
BEGIN

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'despre noi'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/despre-noi/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'intrebari frecvente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/intrebari-frecvente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'recenzii'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/recenzii/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'portofoliu evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/portofoliu-evenimente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'termeni si conditii'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/termeni-si-conditii/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'politica de confidentialitate'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/politica-de-confidentialitate/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'blog'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/blog/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'politica cookies'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/politica-cookies/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/despre-noi/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/despre-noi/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 1'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-1/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 2'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-2/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 3'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-3/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 4'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-4/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 5'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-5/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 6'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-6/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane aviatiei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-aviatiei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane baneasa'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-baneasa/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane domenii'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-domenii/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane herastrau'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-herastrau/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane victoriei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-victoriei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane colentina'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-colentina/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane obor'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-obor/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane pantelimon'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-pantelimon/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane tei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-tei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane stefan cel mare'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-stefan-cel-mare/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane dristor'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-dristor/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane titan'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-titan/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane vitan'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-vitan/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane unirii'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-unirii/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane dudesti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-dudesti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane berceni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-berceni/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane tineretului'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-tineretului/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane piata sudului'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-piata-sudului/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane aparatorii patriei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-aparatorii-patriei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane oltenitei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-oltenitei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane rahova'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-rahova/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane cotroceni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-cotroceni/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane 13 septembrie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-13-septembrie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane ferentari'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-ferentari/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane sebastian'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sebastian/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane drumul taberei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-drumul-taberei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane militari'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-militari/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane crangasi'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-crangasi/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane giulesti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-giulesti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane grozavesti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-grozavesti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane ilfov'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane voluntari'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-voluntari/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane pipera'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-pipera/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane otopeni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-otopeni/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane tunari'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-tunari/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane corbeanca'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-corbeanca/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane balotesti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-balotesti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane mogosoaia'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-mogosoaia/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane chitila'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-chitila/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane chiajna'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-chiajna/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane domnesti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-domnesti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bragadiru'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-bragadiru/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane magurele'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-magurele/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane popesti leordeni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-popesti-leordeni/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane berceni ilfov'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-berceni-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane pantelimon ilfov'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-pantelimon-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane cernica'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-cernica/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane afumati'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-afumati/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane stefanestii de jos'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-stefanestii-de-jos/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane dascalu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-dascalu/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane snagov'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-snagov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane clinceni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-clinceni/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane dragomiresti vale'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-dragomiresti-vale/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane jilava'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-jilava/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane 1 decembrie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-1-decembrie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/galerie/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/galerie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/preturi-decoratiuni-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/preturi-decoratiuni-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/intrebari-frecvente/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/intrebari-frecvente/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/recenzii/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/recenzii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane mot bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-mot-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane turta bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-turta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane nunta bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane 8 martie bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-8-martie-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane cununie bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-cununie-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane majorat bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare copii bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare adulti bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane petrecere bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-petrecere-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane corporate bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-corporate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane deschidere magazin bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane deschidere restaurant bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane lansare produs bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-lansare-produs-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane showroom bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-showroom-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane gradinita bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-gradinita-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane scoala bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-scoala-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane baby shower bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-baby-shower-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane gender reveal bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-gender-reveal-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane craciun bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-craciun-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane revelion bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-revelion-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane paste bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-paste-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane halloween bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-halloween-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane 1 iunie bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-1-iunie-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane absolvire bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-absolvire-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/arcada-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane majorat bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/arcada-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane nunta bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/arcada-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/panou-foto-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto baloane majorat bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/panou-foto-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu majorat bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/baloane-heliu-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu aniversare bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/baloane-heliu-aniversare-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'buchete baloane aniversare bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/buchete-baloane-aniversare-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane roz auriu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-roz-auriu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane alb auriu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-alb-auriu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/termeni-si-conditii/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/termeni-si-conditii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/politica-de-confidentialitate/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/politica-de-confidentialitate/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cât costă decorațiunile cu baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-decoratiunile-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cât costă o arcadă de baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-o-arcada-de-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cât costă baloanele cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-baloanele-cu-heliu/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cât costă un panou foto cu baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-un-panou-foto-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cât costă decor baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cât costă decor baloane nuntă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'ce include un pachet decor baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/ce-include-un-pachet-decor-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cum alegi pachetul de decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cum alegi arcada de baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-alegi-arcada-de-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane organică sau clasică'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/arcada-baloane-organica-sau-clasica/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'dimensiune arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'unde se poate monta o arcadă de baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cât rezistă o arcadă de baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-rezista-o-arcada-de-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei arcadă baloane evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-arcada-baloane-pentru-evenimente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu cât rezistă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/baloane-heliu-cat-rezista/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu latex sau folie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/baloane-heliu-latex-sau-folie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'câte baloane cu heliu sunt necesare pentru o cameră'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cum se transportă baloanele cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-se-transporta-baloanele-cu-heliu/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu pentru copii idei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/baloane-cu-heliu-pentru-copii-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu pentru majorat idei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei decor baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-botez/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei decor baloane moț și turtă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-mot-si-turta/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei decor baloane nuntă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-nunta/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei decor baloane cununie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-cununie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei decor baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-majorat/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei decor baloane aniversare copii'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-aniversare-copii/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei decor baloane aniversare adulți'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-aniversare-adulti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei decor baloane baby shower'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-baby-shower/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei decor baloane gender reveal'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-gender-reveal/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'idei decor baloane corporate'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-corporate/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cum alegi culorile pentru decorul cu baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decor baloane roz auriu idei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/decor-baloane-roz-auriu-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decor baloane alb auriu idei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/decor-baloane-alb-auriu-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decor baloane pastel idei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/decor-baloane-pastel-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decor baloane luxury idei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/decor-baloane-luxury-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decor baloane minimalist sau spectaculos'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/decor-baloane-minimalist-sau-spectaculos/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cum comanzi decorațiuni cu baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-comanzi-decoratiuni-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cu cât timp înainte se comandă decorul cu baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'ce informații trebuie să trimiți pentru ofertă decor baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'montaj decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane exterior'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'ce se întâmplă cu decorul după eveniment'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto cu baloane idei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'candy bar cu decor de baloane idei'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/candy-bar-cu-decor-de-baloane-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'foto corner cu baloane pentru evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/foto-corner-cu-baloane-pentru-evenimente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cifre și litere din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'buchete baloane când se potrivesc'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/buchete-baloane-cand-se-potrivesc/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane personalizate pentru evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/baloane-personalizate-pentru-evenimente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/politica-cookies/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/politica-cookies/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'aranjamente baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/aranjamente-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'buchete baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane personalizate bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cifre litere bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/baloane-cifre-litere-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'ghirlande baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/ghirlande-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'stalpi baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/stalpi-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'perete baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/perete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decor baloane candy bar bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decor-baloane-candy-bar-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'livrare baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/livrare-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane nunta bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 1'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-sector-1/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane ilfov'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie decor'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact rapid'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'verifică prețurile'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'vezi galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie evenimente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni Ilfov'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/decoratiuni-baloane-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni Ilfov'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/decoratiuni-baloane-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'comandă acum'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade din baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'înapoi la eveniment'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'rezervă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'înapoi la eveniment'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'rezervă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'înapoi la eveniment'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'rezervă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'înapoi la eveniment'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'rezervă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'înapoi la eveniment'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'rezervă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'înapoi la eveniment'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'rezervă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'înapoi la eveniment'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'rezervă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'înapoi la eveniment'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'rezervă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'buchete baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-roz-auriu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'rezervă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-roz-auriu-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-roz-auriu-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-alb-auriu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'rezervă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-alb-auriu-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-alb-auriu-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-decoratiunile-cu-baloane/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-decoratiunile-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-decoratiunile-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-o-arcada-de-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-o-arcada-de-baloane/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-o-arcada-de-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-baloanele-cu-heliu/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'buchete baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-baloanele-cu-heliu/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-baloanele-cu-heliu/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-baloanele-cu-heliu/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-panou-foto-cu-baloane/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-panou-foto-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-panou-foto-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/' AND p2.path = '/arcada-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane nunta bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane nunta bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/' AND p2.path = '/arcada-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-include-un-pachet-decor-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-include-un-pachet-decor-baloane/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-include-un-pachet-decor-baloane/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-include-un-pachet-decor-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-arcada-de-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-arcada-de-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-arcada-de-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/arcada-baloane-organica-sau-clasica/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/arcada-baloane-organica-sau-clasica/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/arcada-baloane-organica-sau-clasica/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-rezista-o-arcada-de-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-rezista-o-arcada-de-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-rezista-o-arcada-de-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane nunta bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-cat-rezista/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'buchete baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-cat-rezista/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-cat-rezista/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-latex-sau-folie/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane personalizate bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-latex-sau-folie/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-latex-sau-folie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'buchete baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-transporta-baloanele-cu-heliu/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'livrare baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-transporta-baloanele-cu-heliu/' AND p2.path = '/livrare-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-transporta-baloanele-cu-heliu/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-copii-idei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare copii bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-copii-idei/' AND p2.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-copii-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane majorat bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu majorat bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/' AND p2.path = '/baloane-heliu-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-botez/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-botez/' AND p2.path = '/arcada-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-botez/' AND p2.path = '/panou-foto-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-botez/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane mot bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-mot-si-turta/' AND p2.path = '/decoratiuni-baloane-mot-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane turta bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-mot-si-turta/' AND p2.path = '/decoratiuni-baloane-turta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-mot-si-turta/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-mot-si-turta/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane nunta bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-nunta/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane nunta bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-nunta/' AND p2.path = '/arcada-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-nunta/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-nunta/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane cununie bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-cununie/' AND p2.path = '/decoratiuni-baloane-cununie-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-cununie/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-cununie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane majorat bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-majorat/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane majorat bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-majorat/' AND p2.path = '/arcada-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu majorat bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-majorat/' AND p2.path = '/baloane-heliu-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-majorat/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare copii bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-copii/' AND p2.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-copii/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-copii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare adulti bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-adulti/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-adulti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-adulti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-adulti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane baby shower bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-baby-shower/' AND p2.path = '/decoratiuni-baloane-baby-shower-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane personalizate bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-baby-shower/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-baby-shower/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane gender reveal bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-gender-reveal/' AND p2.path = '/decoratiuni-baloane-gender-reveal-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane personalizate bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-gender-reveal/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-gender-reveal/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-gender-reveal/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane corporate bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-corporate/' AND p2.path = '/decoratiuni-baloane-corporate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane deschidere magazin bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-corporate/' AND p2.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-corporate/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane roz auriu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-roz-auriu-idei/' AND p2.path = '/decoratiuni-baloane-roz-auriu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-roz-auriu-idei/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-roz-auriu-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane alb auriu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-alb-auriu-idei/' AND p2.path = '/decoratiuni-baloane-alb-auriu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-alb-auriu-idei/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-alb-auriu-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-pastel-idei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-pastel-idei/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-pastel-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-luxury-idei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-luxury-idei/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-luxury-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-minimalist-sau-spectaculos/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'galerie'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-minimalist-sau-spectaculos/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-minimalist-sau-spectaculos/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-comanzi-decoratiuni-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-comanzi-decoratiuni-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-comanzi-decoratiuni-cu-baloane/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'intrebari frecvente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/' AND p2.path = '/intrebari-frecvente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'intrebari frecvente'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/' AND p2.path = '/intrebari-frecvente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decor baloane candy bar bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/candy-bar-cu-decor-de-baloane-idei/' AND p2.path = '/decor-baloane-candy-bar-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/candy-bar-cu-decor-de-baloane-idei/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare copii bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/candy-bar-cu-decor-de-baloane-idei/' AND p2.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/candy-bar-cu-decor-de-baloane-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/foto-corner-cu-baloane-pentru-evenimente/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/foto-corner-cu-baloane-pentru-evenimente/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/foto-corner-cu-baloane-pentru-evenimente/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cifre litere bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/' AND p2.path = '/baloane-cifre-litere-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane majorat bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare copii bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/' AND p2.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'buchete baloane bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/buchete-baloane-cand-se-potrivesc/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/buchete-baloane-cand-se-potrivesc/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/buchete-baloane-cand-se-potrivesc/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane personalizate bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-personalizate-pentru-evenimente/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-personalizate-pentru-evenimente/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-personalizate-pentru-evenimente/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

END $$;

COMMIT;
