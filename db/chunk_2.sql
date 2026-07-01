BEGIN;
DO $$
DECLARE
    v_page_id UUID;
    v_hub_id UUID;
    v_src UUID;
    v_tgt UUID;
BEGIN
-- PAGE: /decoratiuni-baloane-petrecere-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-petrecere-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Petrecere Bucuresti',
        h1 = 'Decoratiuni Baloane Petrecere Bucuresti',
        meta_title = 'Decoratiuni Baloane Petrecere Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-petrecere-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-petrecere-bucuresti', '/decoratiuni-baloane-petrecere-bucuresti/', 'event', 'Decoratiuni Baloane Petrecere Bucuresti', 'Decoratiuni Baloane Petrecere Bucuresti', 'Decoratiuni Baloane Petrecere Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane petrecere bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane petrecere bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-petrecere-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-petrecere-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-petrecere-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-corporate-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-corporate-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Corporate Bucuresti',
        h1 = 'Decoratiuni Baloane Corporate Bucuresti',
        meta_title = 'Decoratiuni Baloane Corporate Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-corporate-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-corporate-bucuresti', '/decoratiuni-baloane-corporate-bucuresti/', 'event', 'Decoratiuni Baloane Corporate Bucuresti', 'Decoratiuni Baloane Corporate Bucuresti', 'Decoratiuni Baloane Corporate Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane corporate bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane corporate bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-corporate-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-corporate-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-corporate-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-deschidere-magazin-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-deschidere-magazin-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Deschidere Magazin Bucuresti',
        h1 = 'Decoratiuni Baloane Deschidere Magazin Bucuresti',
        meta_title = 'Decoratiuni Baloane Deschidere Magazin Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-deschidere-magazin-bucuresti', '/decoratiuni-baloane-deschidere-magazin-bucuresti/', 'event', 'Decoratiuni Baloane Deschidere Magazin Bucuresti', 'Decoratiuni Baloane Deschidere Magazin Bucuresti', 'Decoratiuni Baloane Deschidere Magazin Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane deschidere magazin bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane deschidere magazin bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-deschidere-magazin-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-deschidere-magazin-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-deschidere-magazin-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-deschidere-restaurant-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-deschidere-restaurant-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Deschidere Restaurant Bucuresti',
        h1 = 'Decoratiuni Baloane Deschidere Restaurant Bucuresti',
        meta_title = 'Decoratiuni Baloane Deschidere Restaurant Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-deschidere-restaurant-bucuresti', '/decoratiuni-baloane-deschidere-restaurant-bucuresti/', 'event', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane deschidere restaurant bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane deschidere restaurant bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-deschidere-restaurant-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-deschidere-restaurant-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-deschidere-restaurant-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-lansare-produs-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-lansare-produs-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Lansare Produs Bucuresti',
        h1 = 'Decoratiuni Baloane Lansare Produs Bucuresti',
        meta_title = 'Decoratiuni Baloane Lansare Produs Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-lansare-produs-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-lansare-produs-bucuresti', '/decoratiuni-baloane-lansare-produs-bucuresti/', 'event', 'Decoratiuni Baloane Lansare Produs Bucuresti', 'Decoratiuni Baloane Lansare Produs Bucuresti', 'Decoratiuni Baloane Lansare Produs Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane lansare produs bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane lansare produs bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-lansare-produs-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-lansare-produs-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-lansare-produs-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-showroom-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-showroom-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Showroom Bucuresti',
        h1 = 'Decoratiuni Baloane Showroom Bucuresti',
        meta_title = 'Decoratiuni Baloane Showroom Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-showroom-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-showroom-bucuresti', '/decoratiuni-baloane-showroom-bucuresti/', 'event', 'Decoratiuni Baloane Showroom Bucuresti', 'Decoratiuni Baloane Showroom Bucuresti', 'Decoratiuni Baloane Showroom Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane showroom bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane showroom bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-showroom-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-showroom-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-showroom-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-gradinita-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-gradinita-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Gradinita Bucuresti',
        h1 = 'Decoratiuni Baloane Gradinita Bucuresti',
        meta_title = 'Decoratiuni Baloane Gradinita Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-gradinita-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-gradinita-bucuresti', '/decoratiuni-baloane-gradinita-bucuresti/', 'event', 'Decoratiuni Baloane Gradinita Bucuresti', 'Decoratiuni Baloane Gradinita Bucuresti', 'Decoratiuni Baloane Gradinita Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane gradinita bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane gradinita bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-gradinita-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-gradinita-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-gradinita-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-scoala-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-scoala-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Scoala Bucuresti',
        h1 = 'Decoratiuni Baloane Scoala Bucuresti',
        meta_title = 'Decoratiuni Baloane Scoala Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-scoala-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-scoala-bucuresti', '/decoratiuni-baloane-scoala-bucuresti/', 'event', 'Decoratiuni Baloane Scoala Bucuresti', 'Decoratiuni Baloane Scoala Bucuresti', 'Decoratiuni Baloane Scoala Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane scoala bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane scoala bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-scoala-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-scoala-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-scoala-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-baby-shower-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-baby-shower-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Baby Shower Bucuresti',
        h1 = 'Decoratiuni Baloane Baby Shower Bucuresti',
        meta_title = 'Decoratiuni Baloane Baby Shower Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-baby-shower-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-baby-shower-bucuresti', '/decoratiuni-baloane-baby-shower-bucuresti/', 'event', 'Decoratiuni Baloane Baby Shower Bucuresti', 'Decoratiuni Baloane Baby Shower Bucuresti', 'Decoratiuni Baloane Baby Shower Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane baby shower bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane baby shower bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-baby-shower-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-baby-shower-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-baby-shower-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-gender-reveal-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-gender-reveal-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Gender Reveal Bucuresti',
        h1 = 'Decoratiuni Baloane Gender Reveal Bucuresti',
        meta_title = 'Decoratiuni Baloane Gender Reveal Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-gender-reveal-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-gender-reveal-bucuresti', '/decoratiuni-baloane-gender-reveal-bucuresti/', 'event', 'Decoratiuni Baloane Gender Reveal Bucuresti', 'Decoratiuni Baloane Gender Reveal Bucuresti', 'Decoratiuni Baloane Gender Reveal Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane gender reveal bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane gender reveal bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-gender-reveal-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-gender-reveal-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-gender-reveal-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-craciun-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-craciun-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Craciun Bucuresti',
        h1 = 'Decoratiuni Baloane Craciun Bucuresti',
        meta_title = 'Decoratiuni Baloane Craciun Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-craciun-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-craciun-bucuresti', '/decoratiuni-baloane-craciun-bucuresti/', 'event', 'Decoratiuni Baloane Craciun Bucuresti', 'Decoratiuni Baloane Craciun Bucuresti', 'Decoratiuni Baloane Craciun Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane craciun bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane craciun bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-craciun-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-craciun-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-craciun-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-revelion-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-revelion-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Revelion Bucuresti',
        h1 = 'Decoratiuni Baloane Revelion Bucuresti',
        meta_title = 'Decoratiuni Baloane Revelion Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-revelion-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-revelion-bucuresti', '/decoratiuni-baloane-revelion-bucuresti/', 'event', 'Decoratiuni Baloane Revelion Bucuresti', 'Decoratiuni Baloane Revelion Bucuresti', 'Decoratiuni Baloane Revelion Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane revelion bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane revelion bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-revelion-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-revelion-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-revelion-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-paste-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-paste-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Paste Bucuresti',
        h1 = 'Decoratiuni Baloane Paste Bucuresti',
        meta_title = 'Decoratiuni Baloane Paste Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-paste-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-paste-bucuresti', '/decoratiuni-baloane-paste-bucuresti/', 'event', 'Decoratiuni Baloane Paste Bucuresti', 'Decoratiuni Baloane Paste Bucuresti', 'Decoratiuni Baloane Paste Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane paste bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane paste bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-paste-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-paste-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-paste-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-halloween-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-halloween-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Halloween Bucuresti',
        h1 = 'Decoratiuni Baloane Halloween Bucuresti',
        meta_title = 'Decoratiuni Baloane Halloween Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-halloween-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-halloween-bucuresti', '/decoratiuni-baloane-halloween-bucuresti/', 'event', 'Decoratiuni Baloane Halloween Bucuresti', 'Decoratiuni Baloane Halloween Bucuresti', 'Decoratiuni Baloane Halloween Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane halloween bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane halloween bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-halloween-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-halloween-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-halloween-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-1-iunie-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-1-iunie-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane 1 Iunie Bucuresti',
        h1 = 'Decoratiuni Baloane 1 Iunie Bucuresti',
        meta_title = 'Decoratiuni Baloane 1 Iunie Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-1-iunie-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-1-iunie-bucuresti', '/decoratiuni-baloane-1-iunie-bucuresti/', 'event', 'Decoratiuni Baloane 1 Iunie Bucuresti', 'Decoratiuni Baloane 1 Iunie Bucuresti', 'Decoratiuni Baloane 1 Iunie Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane 1 iunie bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane 1 iunie bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-1-iunie-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-1-iunie-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-1-iunie-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-absolvire-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-absolvire-bucuresti',
        page_type = 'event',
        title = 'Decoratiuni Baloane Absolvire Bucuresti',
        h1 = 'Decoratiuni Baloane Absolvire Bucuresti',
        meta_title = 'Decoratiuni Baloane Absolvire Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-absolvire-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-absolvire-bucuresti', '/decoratiuni-baloane-absolvire-bucuresti/', 'event', 'Decoratiuni Baloane Absolvire Bucuresti', 'Decoratiuni Baloane Absolvire Bucuresti', 'Decoratiuni Baloane Absolvire Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane absolvire bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane absolvire bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'event_use_cases') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'event_use_cases', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-absolvire-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-absolvire-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-absolvire-bucuresti', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-sector-1/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-sector-1',
        page_type = 'location',
        title = 'Decoratiuni Baloane Sector 1',
        h1 = 'Decoratiuni Baloane Sector 1',
        meta_title = 'Decoratiuni Baloane Sector 1 - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-sector-1/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-sector-1', '/decoratiuni-baloane-sector-1/', 'location', 'Decoratiuni Baloane Sector 1', 'Decoratiuni Baloane Sector 1', 'Decoratiuni Baloane Sector 1 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane sector 1', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane sector 1', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-1', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-1', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-1', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-sector-2/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-sector-2',
        page_type = 'location',
        title = 'Decoratiuni Baloane Sector 2',
        h1 = 'Decoratiuni Baloane Sector 2',
        meta_title = 'Decoratiuni Baloane Sector 2 - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-sector-2/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-sector-2', '/decoratiuni-baloane-sector-2/', 'location', 'Decoratiuni Baloane Sector 2', 'Decoratiuni Baloane Sector 2', 'Decoratiuni Baloane Sector 2 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane sector 2', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane sector 2', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-2', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-2', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-2', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-sector-3/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-sector-3',
        page_type = 'location',
        title = 'Decoratiuni Baloane Sector 3',
        h1 = 'Decoratiuni Baloane Sector 3',
        meta_title = 'Decoratiuni Baloane Sector 3 - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-sector-3/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-sector-3', '/decoratiuni-baloane-sector-3/', 'location', 'Decoratiuni Baloane Sector 3', 'Decoratiuni Baloane Sector 3', 'Decoratiuni Baloane Sector 3 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane sector 3', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane sector 3', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-3', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-3', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-3', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-sector-4/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-sector-4',
        page_type = 'location',
        title = 'Decoratiuni Baloane Sector 4',
        h1 = 'Decoratiuni Baloane Sector 4',
        meta_title = 'Decoratiuni Baloane Sector 4 - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-sector-4/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-sector-4', '/decoratiuni-baloane-sector-4/', 'location', 'Decoratiuni Baloane Sector 4', 'Decoratiuni Baloane Sector 4', 'Decoratiuni Baloane Sector 4 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane sector 4', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane sector 4', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-4', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-4', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-4', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-sector-5/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-sector-5',
        page_type = 'location',
        title = 'Decoratiuni Baloane Sector 5',
        h1 = 'Decoratiuni Baloane Sector 5',
        meta_title = 'Decoratiuni Baloane Sector 5 - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-sector-5/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-sector-5', '/decoratiuni-baloane-sector-5/', 'location', 'Decoratiuni Baloane Sector 5', 'Decoratiuni Baloane Sector 5', 'Decoratiuni Baloane Sector 5 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane sector 5', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane sector 5', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-5', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-5', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-5', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-sector-6/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-sector-6',
        page_type = 'location',
        title = 'Decoratiuni Baloane Sector 6',
        h1 = 'Decoratiuni Baloane Sector 6',
        meta_title = 'Decoratiuni Baloane Sector 6 - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-sector-6/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-sector-6', '/decoratiuni-baloane-sector-6/', 'location', 'Decoratiuni Baloane Sector 6', 'Decoratiuni Baloane Sector 6', 'Decoratiuni Baloane Sector 6 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane sector 6', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane sector 6', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sector-6', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sector-6', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sector-6', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-aviatiei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-aviatiei',
        page_type = 'location',
        title = 'Decoratiuni Baloane Aviatiei',
        h1 = 'Decoratiuni Baloane Aviatiei',
        meta_title = 'Decoratiuni Baloane Aviatiei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-aviatiei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-aviatiei', '/decoratiuni-baloane-aviatiei/', 'location', 'Decoratiuni Baloane Aviatiei', 'Decoratiuni Baloane Aviatiei', 'Decoratiuni Baloane Aviatiei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane aviatiei', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane aviatiei', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-aviatiei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-aviatiei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-aviatiei', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-baneasa/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-baneasa',
        page_type = 'location',
        title = 'Decoratiuni Baloane Baneasa',
        h1 = 'Decoratiuni Baloane Baneasa',
        meta_title = 'Decoratiuni Baloane Baneasa - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-baneasa/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-baneasa', '/decoratiuni-baloane-baneasa/', 'location', 'Decoratiuni Baloane Baneasa', 'Decoratiuni Baloane Baneasa', 'Decoratiuni Baloane Baneasa - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane baneasa', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane baneasa', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-baneasa', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-baneasa', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-baneasa', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-domenii/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-domenii',
        page_type = 'location',
        title = 'Decoratiuni Baloane Domenii',
        h1 = 'Decoratiuni Baloane Domenii',
        meta_title = 'Decoratiuni Baloane Domenii - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-domenii/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-domenii', '/decoratiuni-baloane-domenii/', 'location', 'Decoratiuni Baloane Domenii', 'Decoratiuni Baloane Domenii', 'Decoratiuni Baloane Domenii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane domenii', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane domenii', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-domenii', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-domenii', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-domenii', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-herastrau/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-herastrau',
        page_type = 'location',
        title = 'Decoratiuni Baloane Herastrau',
        h1 = 'Decoratiuni Baloane Herastrau',
        meta_title = 'Decoratiuni Baloane Herastrau - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-herastrau/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-herastrau', '/decoratiuni-baloane-herastrau/', 'location', 'Decoratiuni Baloane Herastrau', 'Decoratiuni Baloane Herastrau', 'Decoratiuni Baloane Herastrau - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane herastrau', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane herastrau', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-herastrau', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-herastrau', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-herastrau', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;
-- PAGE: /decoratiuni-baloane-victoriei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-victoriei',
        page_type = 'location',
        title = 'Decoratiuni Baloane Victoriei',
        h1 = 'Decoratiuni Baloane Victoriei',
        meta_title = 'Decoratiuni Baloane Victoriei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-victoriei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-victoriei', '/decoratiuni-baloane-victoriei/', 'location', 'Decoratiuni Baloane Victoriei', 'Decoratiuni Baloane Victoriei', 'Decoratiuni Baloane Victoriei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane victoriei', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane victoriei', 'commercial', '/decoratiuni-baloane-bucuresti/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'gallery') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'gallery', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'pricing') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'pricing', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'available_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'available_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'nearby_areas') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'nearby_areas', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-victoriei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-victoriei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-victoriei', 'Placeholder', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 4) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 4);
    END IF;

END $$;
COMMIT;
