BEGIN;
DO $$
DECLARE
    v_page_id UUID;
    v_hub_id UUID;
    v_src UUID;
    v_tgt UUID;
BEGIN
-- PAGE: /decoratiuni-baloane-colentina/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-colentina',
        page_type = 'location',
        title = 'Decoratiuni Baloane Colentina',
        h1 = 'Decoratiuni Baloane Colentina',
        meta_title = 'Decoratiuni Baloane Colentina - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-colentina/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-colentina', '/decoratiuni-baloane-colentina/', 'location', 'Decoratiuni Baloane Colentina', 'Decoratiuni Baloane Colentina', 'Decoratiuni Baloane Colentina - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane colentina', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane colentina', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-colentina', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-colentina', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-colentina', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-obor/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-obor',
        page_type = 'location',
        title = 'Decoratiuni Baloane Obor',
        h1 = 'Decoratiuni Baloane Obor',
        meta_title = 'Decoratiuni Baloane Obor - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-obor/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-obor', '/decoratiuni-baloane-obor/', 'location', 'Decoratiuni Baloane Obor', 'Decoratiuni Baloane Obor', 'Decoratiuni Baloane Obor - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane obor', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane obor', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-obor', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-obor', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-obor', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-pantelimon/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-pantelimon',
        page_type = 'location',
        title = 'Decoratiuni Baloane Pantelimon',
        h1 = 'Decoratiuni Baloane Pantelimon',
        meta_title = 'Decoratiuni Baloane Pantelimon - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-pantelimon/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-pantelimon', '/decoratiuni-baloane-pantelimon/', 'location', 'Decoratiuni Baloane Pantelimon', 'Decoratiuni Baloane Pantelimon', 'Decoratiuni Baloane Pantelimon - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane pantelimon', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane pantelimon', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-pantelimon', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-pantelimon', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-pantelimon', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-tei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-tei',
        page_type = 'location',
        title = 'Decoratiuni Baloane Tei',
        h1 = 'Decoratiuni Baloane Tei',
        meta_title = 'Decoratiuni Baloane Tei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-tei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-tei', '/decoratiuni-baloane-tei/', 'location', 'Decoratiuni Baloane Tei', 'Decoratiuni Baloane Tei', 'Decoratiuni Baloane Tei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane tei', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane tei', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-tei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-tei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-tei', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-stefan-cel-mare/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-stefan-cel-mare',
        page_type = 'location',
        title = 'Decoratiuni Baloane Stefan Cel Mare',
        h1 = 'Decoratiuni Baloane Stefan Cel Mare',
        meta_title = 'Decoratiuni Baloane Stefan Cel Mare - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-stefan-cel-mare/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-stefan-cel-mare', '/decoratiuni-baloane-stefan-cel-mare/', 'location', 'Decoratiuni Baloane Stefan Cel Mare', 'Decoratiuni Baloane Stefan Cel Mare', 'Decoratiuni Baloane Stefan Cel Mare - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane stefan cel mare', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane stefan cel mare', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-stefan-cel-mare', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-stefan-cel-mare', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-stefan-cel-mare', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-dristor/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-dristor',
        page_type = 'location',
        title = 'Decoratiuni Baloane Dristor',
        h1 = 'Decoratiuni Baloane Dristor',
        meta_title = 'Decoratiuni Baloane Dristor - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-dristor/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-dristor', '/decoratiuni-baloane-dristor/', 'location', 'Decoratiuni Baloane Dristor', 'Decoratiuni Baloane Dristor', 'Decoratiuni Baloane Dristor - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane dristor', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane dristor', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-dristor', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-dristor', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-dristor', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-titan/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-titan',
        page_type = 'location',
        title = 'Decoratiuni Baloane Titan',
        h1 = 'Decoratiuni Baloane Titan',
        meta_title = 'Decoratiuni Baloane Titan - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-titan/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-titan', '/decoratiuni-baloane-titan/', 'location', 'Decoratiuni Baloane Titan', 'Decoratiuni Baloane Titan', 'Decoratiuni Baloane Titan - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane titan', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane titan', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-titan', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-titan', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-titan', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-vitan/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-vitan',
        page_type = 'location',
        title = 'Decoratiuni Baloane Vitan',
        h1 = 'Decoratiuni Baloane Vitan',
        meta_title = 'Decoratiuni Baloane Vitan - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-vitan/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-vitan', '/decoratiuni-baloane-vitan/', 'location', 'Decoratiuni Baloane Vitan', 'Decoratiuni Baloane Vitan', 'Decoratiuni Baloane Vitan - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane vitan', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane vitan', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-vitan', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-vitan', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-vitan', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-unirii/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-unirii',
        page_type = 'location',
        title = 'Decoratiuni Baloane Unirii',
        h1 = 'Decoratiuni Baloane Unirii',
        meta_title = 'Decoratiuni Baloane Unirii - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-unirii/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-unirii', '/decoratiuni-baloane-unirii/', 'location', 'Decoratiuni Baloane Unirii', 'Decoratiuni Baloane Unirii', 'Decoratiuni Baloane Unirii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane unirii', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane unirii', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-unirii', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-unirii', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-unirii', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-dudesti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-dudesti',
        page_type = 'location',
        title = 'Decoratiuni Baloane Dudesti',
        h1 = 'Decoratiuni Baloane Dudesti',
        meta_title = 'Decoratiuni Baloane Dudesti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-dudesti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-dudesti', '/decoratiuni-baloane-dudesti/', 'location', 'Decoratiuni Baloane Dudesti', 'Decoratiuni Baloane Dudesti', 'Decoratiuni Baloane Dudesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane dudesti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane dudesti', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-dudesti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-dudesti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-dudesti', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-berceni/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-berceni',
        page_type = 'location',
        title = 'Decoratiuni Baloane Berceni',
        h1 = 'Decoratiuni Baloane Berceni',
        meta_title = 'Decoratiuni Baloane Berceni - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-berceni/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-berceni', '/decoratiuni-baloane-berceni/', 'location', 'Decoratiuni Baloane Berceni', 'Decoratiuni Baloane Berceni', 'Decoratiuni Baloane Berceni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane berceni', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane berceni', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-berceni', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-berceni', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-berceni', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-tineretului/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-tineretului',
        page_type = 'location',
        title = 'Decoratiuni Baloane Tineretului',
        h1 = 'Decoratiuni Baloane Tineretului',
        meta_title = 'Decoratiuni Baloane Tineretului - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-tineretului/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-tineretului', '/decoratiuni-baloane-tineretului/', 'location', 'Decoratiuni Baloane Tineretului', 'Decoratiuni Baloane Tineretului', 'Decoratiuni Baloane Tineretului - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane tineretului', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane tineretului', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-tineretului', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-tineretului', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-tineretului', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-piata-sudului/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-piata-sudului',
        page_type = 'location',
        title = 'Decoratiuni Baloane Piata Sudului',
        h1 = 'Decoratiuni Baloane Piata Sudului',
        meta_title = 'Decoratiuni Baloane Piata Sudului - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-piata-sudului/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-piata-sudului', '/decoratiuni-baloane-piata-sudului/', 'location', 'Decoratiuni Baloane Piata Sudului', 'Decoratiuni Baloane Piata Sudului', 'Decoratiuni Baloane Piata Sudului - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane piata sudului', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane piata sudului', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-piata-sudului', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-piata-sudului', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-piata-sudului', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-aparatorii-patriei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-aparatorii-patriei',
        page_type = 'location',
        title = 'Decoratiuni Baloane Aparatorii Patriei',
        h1 = 'Decoratiuni Baloane Aparatorii Patriei',
        meta_title = 'Decoratiuni Baloane Aparatorii Patriei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-aparatorii-patriei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-aparatorii-patriei', '/decoratiuni-baloane-aparatorii-patriei/', 'location', 'Decoratiuni Baloane Aparatorii Patriei', 'Decoratiuni Baloane Aparatorii Patriei', 'Decoratiuni Baloane Aparatorii Patriei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane aparatorii patriei', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane aparatorii patriei', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-aparatorii-patriei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-aparatorii-patriei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-aparatorii-patriei', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-oltenitei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-oltenitei',
        page_type = 'location',
        title = 'Decoratiuni Baloane Oltenitei',
        h1 = 'Decoratiuni Baloane Oltenitei',
        meta_title = 'Decoratiuni Baloane Oltenitei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-oltenitei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-oltenitei', '/decoratiuni-baloane-oltenitei/', 'location', 'Decoratiuni Baloane Oltenitei', 'Decoratiuni Baloane Oltenitei', 'Decoratiuni Baloane Oltenitei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane oltenitei', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane oltenitei', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-oltenitei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-oltenitei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-oltenitei', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-rahova/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-rahova',
        page_type = 'location',
        title = 'Decoratiuni Baloane Rahova',
        h1 = 'Decoratiuni Baloane Rahova',
        meta_title = 'Decoratiuni Baloane Rahova - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-rahova/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-rahova', '/decoratiuni-baloane-rahova/', 'location', 'Decoratiuni Baloane Rahova', 'Decoratiuni Baloane Rahova', 'Decoratiuni Baloane Rahova - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane rahova', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane rahova', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-rahova', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-rahova', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-rahova', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-cotroceni/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-cotroceni',
        page_type = 'location',
        title = 'Decoratiuni Baloane Cotroceni',
        h1 = 'Decoratiuni Baloane Cotroceni',
        meta_title = 'Decoratiuni Baloane Cotroceni - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-cotroceni/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-cotroceni', '/decoratiuni-baloane-cotroceni/', 'location', 'Decoratiuni Baloane Cotroceni', 'Decoratiuni Baloane Cotroceni', 'Decoratiuni Baloane Cotroceni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane cotroceni', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane cotroceni', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-cotroceni', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-cotroceni', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-cotroceni', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-13-septembrie/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-13-septembrie',
        page_type = 'location',
        title = 'Decoratiuni Baloane 13 Septembrie',
        h1 = 'Decoratiuni Baloane 13 Septembrie',
        meta_title = 'Decoratiuni Baloane 13 Septembrie - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-13-septembrie/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-13-septembrie', '/decoratiuni-baloane-13-septembrie/', 'location', 'Decoratiuni Baloane 13 Septembrie', 'Decoratiuni Baloane 13 Septembrie', 'Decoratiuni Baloane 13 Septembrie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane 13 septembrie', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane 13 septembrie', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-13-septembrie', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-13-septembrie', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-13-septembrie', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-ferentari/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-ferentari',
        page_type = 'location',
        title = 'Decoratiuni Baloane Ferentari',
        h1 = 'Decoratiuni Baloane Ferentari',
        meta_title = 'Decoratiuni Baloane Ferentari - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-ferentari/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-ferentari', '/decoratiuni-baloane-ferentari/', 'location', 'Decoratiuni Baloane Ferentari', 'Decoratiuni Baloane Ferentari', 'Decoratiuni Baloane Ferentari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane ferentari', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane ferentari', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-ferentari', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-ferentari', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-ferentari', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-sebastian/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-sebastian',
        page_type = 'location',
        title = 'Decoratiuni Baloane Sebastian',
        h1 = 'Decoratiuni Baloane Sebastian',
        meta_title = 'Decoratiuni Baloane Sebastian - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-sebastian/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-sebastian', '/decoratiuni-baloane-sebastian/', 'location', 'Decoratiuni Baloane Sebastian', 'Decoratiuni Baloane Sebastian', 'Decoratiuni Baloane Sebastian - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane sebastian', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane sebastian', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-sebastian', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-sebastian', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-sebastian', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-drumul-taberei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-drumul-taberei',
        page_type = 'location',
        title = 'Decoratiuni Baloane Drumul Taberei',
        h1 = 'Decoratiuni Baloane Drumul Taberei',
        meta_title = 'Decoratiuni Baloane Drumul Taberei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-drumul-taberei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-drumul-taberei', '/decoratiuni-baloane-drumul-taberei/', 'location', 'Decoratiuni Baloane Drumul Taberei', 'Decoratiuni Baloane Drumul Taberei', 'Decoratiuni Baloane Drumul Taberei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane drumul taberei', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane drumul taberei', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-drumul-taberei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-drumul-taberei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-drumul-taberei', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-militari/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-militari',
        page_type = 'location',
        title = 'Decoratiuni Baloane Militari',
        h1 = 'Decoratiuni Baloane Militari',
        meta_title = 'Decoratiuni Baloane Militari - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-militari/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-militari', '/decoratiuni-baloane-militari/', 'location', 'Decoratiuni Baloane Militari', 'Decoratiuni Baloane Militari', 'Decoratiuni Baloane Militari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane militari', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane militari', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-militari', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-militari', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-militari', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-crangasi/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-crangasi',
        page_type = 'location',
        title = 'Decoratiuni Baloane Crangasi',
        h1 = 'Decoratiuni Baloane Crangasi',
        meta_title = 'Decoratiuni Baloane Crangasi - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-crangasi/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-crangasi', '/decoratiuni-baloane-crangasi/', 'location', 'Decoratiuni Baloane Crangasi', 'Decoratiuni Baloane Crangasi', 'Decoratiuni Baloane Crangasi - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane crangasi', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane crangasi', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-crangasi', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-crangasi', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-crangasi', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-giulesti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-giulesti',
        page_type = 'location',
        title = 'Decoratiuni Baloane Giulesti',
        h1 = 'Decoratiuni Baloane Giulesti',
        meta_title = 'Decoratiuni Baloane Giulesti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-giulesti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-giulesti', '/decoratiuni-baloane-giulesti/', 'location', 'Decoratiuni Baloane Giulesti', 'Decoratiuni Baloane Giulesti', 'Decoratiuni Baloane Giulesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane giulesti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane giulesti', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-giulesti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-giulesti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-giulesti', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-grozavesti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-grozavesti',
        page_type = 'location',
        title = 'Decoratiuni Baloane Grozavesti',
        h1 = 'Decoratiuni Baloane Grozavesti',
        meta_title = 'Decoratiuni Baloane Grozavesti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-grozavesti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-grozavesti', '/decoratiuni-baloane-grozavesti/', 'location', 'Decoratiuni Baloane Grozavesti', 'Decoratiuni Baloane Grozavesti', 'Decoratiuni Baloane Grozavesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane grozavesti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane grozavesti', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-grozavesti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-grozavesti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-grozavesti', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-ilfov/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-ilfov',
        page_type = 'location',
        title = 'Decoratiuni Baloane Ilfov',
        h1 = 'Decoratiuni Baloane Ilfov',
        meta_title = 'Decoratiuni Baloane Ilfov - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-ilfov/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-ilfov', '/decoratiuni-baloane-ilfov/', 'location', 'Decoratiuni Baloane Ilfov', 'Decoratiuni Baloane Ilfov', 'Decoratiuni Baloane Ilfov - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane ilfov', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane ilfov', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-ilfov', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-ilfov', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-ilfov', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-voluntari/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-voluntari',
        page_type = 'location',
        title = 'Decoratiuni Baloane Voluntari',
        h1 = 'Decoratiuni Baloane Voluntari',
        meta_title = 'Decoratiuni Baloane Voluntari - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-voluntari/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-voluntari', '/decoratiuni-baloane-voluntari/', 'location', 'Decoratiuni Baloane Voluntari', 'Decoratiuni Baloane Voluntari', 'Decoratiuni Baloane Voluntari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane voluntari', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane voluntari', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-voluntari', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-voluntari', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-voluntari', 'Placeholder', 3);
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
