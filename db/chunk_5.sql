BEGIN;
DO $$
DECLARE
    v_page_id UUID;
    v_hub_id UUID;
    v_src UUID;
    v_tgt UUID;
BEGIN
-- PAGE: /panou-foto-baloane-majorat-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'panou-foto-baloane-majorat-bucuresti',
        page_type = 'satellite',
        title = 'Panou Foto Baloane Majorat Bucuresti',
        h1 = 'Panou Foto Baloane Majorat Bucuresti',
        meta_title = 'Panou Foto Baloane Majorat Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/panou-foto-baloane-majorat-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('panou-foto-baloane-majorat-bucuresti', '/panou-foto-baloane-majorat-bucuresti/', 'satellite', 'Panou Foto Baloane Majorat Bucuresti', 'Panou Foto Baloane Majorat Bucuresti', 'Panou Foto Baloane Majorat Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'panou foto baloane majorat bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-majorat-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'panou foto baloane majorat bucuresti', 'commercial', '/decoratiuni-baloane-majorat-bucuresti/');
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
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for panou-foto-baloane-majorat-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for panou-foto-baloane-majorat-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for panou-foto-baloane-majorat-bucuresti', 'Placeholder', 3);
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
-- PAGE: /baloane-heliu-majorat-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'baloane-heliu-majorat-bucuresti',
        page_type = 'satellite',
        title = 'Baloane Heliu Majorat Bucuresti',
        h1 = 'Baloane Heliu Majorat Bucuresti',
        meta_title = 'Baloane Heliu Majorat Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/baloane-heliu-majorat-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('baloane-heliu-majorat-bucuresti', '/baloane-heliu-majorat-bucuresti/', 'satellite', 'Baloane Heliu Majorat Bucuresti', 'Baloane Heliu Majorat Bucuresti', 'Baloane Heliu Majorat Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'baloane heliu majorat bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-majorat-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'baloane heliu majorat bucuresti', 'commercial', '/decoratiuni-baloane-majorat-bucuresti/');
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
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for baloane-heliu-majorat-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for baloane-heliu-majorat-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for baloane-heliu-majorat-bucuresti', 'Placeholder', 3);
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
-- PAGE: /baloane-heliu-aniversare-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'baloane-heliu-aniversare-bucuresti',
        page_type = 'satellite',
        title = 'Baloane Heliu Aniversare Bucuresti',
        h1 = 'Baloane Heliu Aniversare Bucuresti',
        meta_title = 'Baloane Heliu Aniversare Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/baloane-heliu-aniversare-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('baloane-heliu-aniversare-bucuresti', '/baloane-heliu-aniversare-bucuresti/', 'satellite', 'Baloane Heliu Aniversare Bucuresti', 'Baloane Heliu Aniversare Bucuresti', 'Baloane Heliu Aniversare Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'baloane heliu aniversare bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'baloane heliu aniversare bucuresti', 'commercial', '/decoratiuni-baloane-aniversare-adulti-bucuresti/');
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
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for baloane-heliu-aniversare-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for baloane-heliu-aniversare-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for baloane-heliu-aniversare-bucuresti', 'Placeholder', 3);
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
-- PAGE: /buchete-baloane-aniversare-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'buchete-baloane-aniversare-bucuresti',
        page_type = 'satellite',
        title = 'Buchete Baloane Aniversare Bucuresti',
        h1 = 'Buchete Baloane Aniversare Bucuresti',
        meta_title = 'Buchete Baloane Aniversare Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/buchete-baloane-aniversare-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('buchete-baloane-aniversare-bucuresti', '/buchete-baloane-aniversare-bucuresti/', 'satellite', 'Buchete Baloane Aniversare Bucuresti', 'Buchete Baloane Aniversare Bucuresti', 'Buchete Baloane Aniversare Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'buchete baloane aniversare bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'buchete baloane aniversare bucuresti', 'commercial', '/decoratiuni-baloane-aniversare-adulti-bucuresti/');
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
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for buchete-baloane-aniversare-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for buchete-baloane-aniversare-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for buchete-baloane-aniversare-bucuresti', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-roz-auriu-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-roz-auriu-bucuresti',
        page_type = 'satellite',
        title = 'Decoratiuni Baloane Roz Auriu Bucuresti',
        h1 = 'Decoratiuni Baloane Roz Auriu Bucuresti',
        meta_title = 'Decoratiuni Baloane Roz Auriu Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-roz-auriu-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-roz-auriu-bucuresti', '/decoratiuni-baloane-roz-auriu-bucuresti/', 'satellite', 'Decoratiuni Baloane Roz Auriu Bucuresti', 'Decoratiuni Baloane Roz Auriu Bucuresti', 'Decoratiuni Baloane Roz Auriu Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane roz auriu bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane roz auriu bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-roz-auriu-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-roz-auriu-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-roz-auriu-bucuresti', 'Placeholder', 3);
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
-- PAGE: /decoratiuni-baloane-alb-auriu-bucuresti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decoratiuni-baloane-alb-auriu-bucuresti',
        page_type = 'satellite',
        title = 'Decoratiuni Baloane Alb Auriu Bucuresti',
        h1 = 'Decoratiuni Baloane Alb Auriu Bucuresti',
        meta_title = 'Decoratiuni Baloane Alb Auriu Bucuresti - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/decoratiuni-baloane-alb-auriu-bucuresti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decoratiuni-baloane-alb-auriu-bucuresti', '/decoratiuni-baloane-alb-auriu-bucuresti/', 'satellite', 'Decoratiuni Baloane Alb Auriu Bucuresti', 'Decoratiuni Baloane Alb Auriu Bucuresti', 'Decoratiuni Baloane Alb Auriu Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decoratiuni baloane alb auriu bucuresti', search_intent = 'commercial', parent_path = '/decoratiuni-baloane-bucuresti/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decoratiuni baloane alb auriu bucuresti', 'commercial', '/decoratiuni-baloane-bucuresti/');
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
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for decoratiuni-baloane-alb-auriu-bucuresti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decoratiuni-baloane-alb-auriu-bucuresti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decoratiuni-baloane-alb-auriu-bucuresti', 'Placeholder', 3);
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
-- PAGE: /blog/cat-costa-decoratiunile-cu-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cat-costa-decoratiunile-cu-baloane',
        page_type = 'guide',
        title = 'Cât costă decorațiunile cu baloane?',
        h1 = 'Cât costă decorațiunile cu baloane?',
        meta_title = 'Cât costă decorațiunile cu baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cat-costa-decoratiunile-cu-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cat-costa-decoratiunile-cu-baloane', '/blog/cat-costa-decoratiunile-cu-baloane/', 'guide', 'Cât costă decorațiunile cu baloane?', 'Cât costă decorațiunile cu baloane?', 'Cât costă decorațiunile cu baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cât costă decorațiunile cu baloane', search_intent = 'informativ / preț', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cât costă decorațiunile cu baloane', 'informativ / preț', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-decoratiunile-cu-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-decoratiunile-cu-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-decoratiunile-cu-baloane', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/cat-costa-o-arcada-de-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cat-costa-o-arcada-de-baloane',
        page_type = 'guide',
        title = 'Cât costă o arcadă de baloane?',
        h1 = 'Cât costă o arcadă de baloane?',
        meta_title = 'Cât costă o arcadă de baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cat-costa-o-arcada-de-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cat-costa-o-arcada-de-baloane', '/blog/cat-costa-o-arcada-de-baloane/', 'guide', 'Cât costă o arcadă de baloane?', 'Cât costă o arcadă de baloane?', 'Cât costă o arcadă de baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cât costă o arcadă de baloane', search_intent = 'informativ / preț serviciu', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cât costă o arcadă de baloane', 'informativ / preț serviciu', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-o-arcada-de-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-o-arcada-de-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-o-arcada-de-baloane', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/cat-costa-baloanele-cu-heliu/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cat-costa-baloanele-cu-heliu',
        page_type = 'guide',
        title = 'Cât costă baloanele cu heliu?',
        h1 = 'Cât costă baloanele cu heliu?',
        meta_title = 'Cât costă baloanele cu heliu? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cat-costa-baloanele-cu-heliu/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cat-costa-baloanele-cu-heliu', '/blog/cat-costa-baloanele-cu-heliu/', 'guide', 'Cât costă baloanele cu heliu?', 'Cât costă baloanele cu heliu?', 'Cât costă baloanele cu heliu? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cât costă baloanele cu heliu', search_intent = 'informativ / preț produs', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cât costă baloanele cu heliu', 'informativ / preț produs', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-baloanele-cu-heliu', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-baloanele-cu-heliu', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-baloanele-cu-heliu', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/cat-costa-un-panou-foto-cu-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cat-costa-un-panou-foto-cu-baloane',
        page_type = 'guide',
        title = 'Cât costă un panou foto cu baloane?',
        h1 = 'Cât costă un panou foto cu baloane?',
        meta_title = 'Cât costă un panou foto cu baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cat-costa-un-panou-foto-cu-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cat-costa-un-panou-foto-cu-baloane', '/blog/cat-costa-un-panou-foto-cu-baloane/', 'guide', 'Cât costă un panou foto cu baloane?', 'Cât costă un panou foto cu baloane?', 'Cât costă un panou foto cu baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cât costă un panou foto cu baloane', search_intent = 'informativ / preț serviciu', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cât costă un panou foto cu baloane', 'informativ / preț serviciu', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-un-panou-foto-cu-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-un-panou-foto-cu-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-un-panou-foto-cu-baloane', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/cat-costa-un-decor-de-baloane-pentru-botez/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cat-costa-un-decor-de-baloane-pentru-botez',
        page_type = 'guide',
        title = 'Cât costă decor baloane botez?',
        h1 = 'Cât costă decor baloane botez?',
        meta_title = 'Cât costă decor baloane botez? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cat-costa-un-decor-de-baloane-pentru-botez', '/blog/cat-costa-un-decor-de-baloane-pentru-botez/', 'guide', 'Cât costă decor baloane botez?', 'Cât costă decor baloane botez?', 'Cât costă decor baloane botez? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cât costă decor baloane botez', search_intent = 'informativ / preț eveniment', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cât costă decor baloane botez', 'informativ / preț eveniment', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-un-decor-de-baloane-pentru-botez', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-un-decor-de-baloane-pentru-botez', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-un-decor-de-baloane-pentru-botez', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/cat-costa-un-decor-de-baloane-pentru-nunta/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cat-costa-un-decor-de-baloane-pentru-nunta',
        page_type = 'guide',
        title = 'Cât costă decor baloane nuntă?',
        h1 = 'Cât costă decor baloane nuntă?',
        meta_title = 'Cât costă decor baloane nuntă? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cat-costa-un-decor-de-baloane-pentru-nunta', '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/', 'guide', 'Cât costă decor baloane nuntă?', 'Cât costă decor baloane nuntă?', 'Cât costă decor baloane nuntă? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cât costă decor baloane nuntă', search_intent = 'informativ / preț eveniment', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cât costă decor baloane nuntă', 'informativ / preț eveniment', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cat-costa-un-decor-de-baloane-pentru-nunta', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cat-costa-un-decor-de-baloane-pentru-nunta', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cat-costa-un-decor-de-baloane-pentru-nunta', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/ce-include-un-pachet-decor-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'ce-include-un-pachet-decor-baloane',
        page_type = 'guide',
        title = 'Ce include un pachet decor baloane?',
        h1 = 'Ce include un pachet decor baloane?',
        meta_title = 'Ce include un pachet decor baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/ce-include-un-pachet-decor-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('ce-include-un-pachet-decor-baloane', '/blog/ce-include-un-pachet-decor-baloane/', 'guide', 'Ce include un pachet decor baloane?', 'Ce include un pachet decor baloane?', 'Ce include un pachet decor baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'ce include un pachet decor baloane', search_intent = 'informativ / decizie', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'ce include un pachet decor baloane', 'informativ / decizie', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for ce-include-un-pachet-decor-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for ce-include-un-pachet-decor-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for ce-include-un-pachet-decor-baloane', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/cum-alegi-pachetul-de-decoratiuni-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cum-alegi-pachetul-de-decoratiuni-baloane',
        page_type = 'guide',
        title = 'Cum alegi pachetul de decorațiuni baloane?',
        h1 = 'Cum alegi pachetul de decorațiuni baloane?',
        meta_title = 'Cum alegi pachetul de decorațiuni baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cum-alegi-pachetul-de-decoratiuni-baloane', '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/', 'guide', 'Cum alegi pachetul de decorațiuni baloane?', 'Cum alegi pachetul de decorațiuni baloane?', 'Cum alegi pachetul de decorațiuni baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cum alegi pachetul de decorațiuni baloane', search_intent = 'informativ / decizie', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cum alegi pachetul de decorațiuni baloane', 'informativ / decizie', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cum-alegi-pachetul-de-decoratiuni-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cum-alegi-pachetul-de-decoratiuni-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cum-alegi-pachetul-de-decoratiuni-baloane', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/cum-alegi-arcada-de-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cum-alegi-arcada-de-baloane',
        page_type = 'guide',
        title = 'Cum alegi arcada de baloane?',
        h1 = 'Cum alegi arcada de baloane?',
        meta_title = 'Cum alegi arcada de baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cum-alegi-arcada-de-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cum-alegi-arcada-de-baloane', '/blog/cum-alegi-arcada-de-baloane/', 'guide', 'Cum alegi arcada de baloane?', 'Cum alegi arcada de baloane?', 'Cum alegi arcada de baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cum alegi arcada de baloane', search_intent = 'ghid informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cum alegi arcada de baloane', 'ghid informativ', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cum-alegi-arcada-de-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cum-alegi-arcada-de-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cum-alegi-arcada-de-baloane', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/arcada-baloane-organica-sau-clasica/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'arcada-baloane-organica-sau-clasica',
        page_type = 'guide',
        title = 'Arcadă baloane organică sau clasică',
        h1 = 'Arcadă baloane organică sau clasică',
        meta_title = 'Arcadă baloane organică sau clasică - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/arcada-baloane-organica-sau-clasica/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('arcada-baloane-organica-sau-clasica', '/blog/arcada-baloane-organica-sau-clasica/', 'guide', 'Arcadă baloane organică sau clasică', 'Arcadă baloane organică sau clasică', 'Arcadă baloane organică sau clasică - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'arcadă baloane organică sau clasică', search_intent = 'comparație', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'arcadă baloane organică sau clasică', 'comparație', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for arcada-baloane-organica-sau-clasica', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for arcada-baloane-organica-sau-clasica', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for arcada-baloane-organica-sau-clasica', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane',
        page_type = 'guide',
        title = 'Dimensiune arcadă baloane',
        h1 = 'Dimensiune arcadă baloane',
        meta_title = 'Dimensiune arcadă baloane - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane', '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/', 'guide', 'Dimensiune arcadă baloane', 'Dimensiune arcadă baloane', 'Dimensiune arcadă baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'dimensiune arcadă baloane', search_intent = 'informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'dimensiune arcadă baloane', 'informativ', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/unde-se-poate-monta-o-arcada-de-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'unde-se-poate-monta-o-arcada-de-baloane',
        page_type = 'guide',
        title = 'Unde se poate monta o arcadă de baloane?',
        h1 = 'Unde se poate monta o arcadă de baloane?',
        meta_title = 'Unde se poate monta o arcadă de baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('unde-se-poate-monta-o-arcada-de-baloane', '/blog/unde-se-poate-monta-o-arcada-de-baloane/', 'guide', 'Unde se poate monta o arcadă de baloane?', 'Unde se poate monta o arcadă de baloane?', 'Unde se poate monta o arcadă de baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'unde se poate monta o arcadă de baloane', search_intent = 'logistic / informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'unde se poate monta o arcadă de baloane', 'logistic / informativ', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for unde-se-poate-monta-o-arcada-de-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for unde-se-poate-monta-o-arcada-de-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for unde-se-poate-monta-o-arcada-de-baloane', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/cat-rezista-o-arcada-de-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cat-rezista-o-arcada-de-baloane',
        page_type = 'guide',
        title = 'Cât rezistă o arcadă de baloane?',
        h1 = 'Cât rezistă o arcadă de baloane?',
        meta_title = 'Cât rezistă o arcadă de baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cat-rezista-o-arcada-de-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cat-rezista-o-arcada-de-baloane', '/blog/cat-rezista-o-arcada-de-baloane/', 'guide', 'Cât rezistă o arcadă de baloane?', 'Cât rezistă o arcadă de baloane?', 'Cât rezistă o arcadă de baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cât rezistă o arcadă de baloane', search_intent = 'informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cât rezistă o arcadă de baloane', 'informativ', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cat-rezista-o-arcada-de-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cat-rezista-o-arcada-de-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cat-rezista-o-arcada-de-baloane', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/idei-arcada-baloane-pentru-evenimente/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-arcada-baloane-pentru-evenimente',
        page_type = 'guide',
        title = 'Idei arcadă baloane evenimente',
        h1 = 'Idei arcadă baloane evenimente',
        meta_title = 'Idei arcadă baloane evenimente - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-arcada-baloane-pentru-evenimente/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-arcada-baloane-pentru-evenimente', '/blog/idei-arcada-baloane-pentru-evenimente/', 'guide', 'Idei arcadă baloane evenimente', 'Idei arcadă baloane evenimente', 'Idei arcadă baloane evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei arcadă baloane evenimente', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei arcadă baloane evenimente', 'inspirațional', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for idei-arcada-baloane-pentru-evenimente', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-arcada-baloane-pentru-evenimente', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-arcada-baloane-pentru-evenimente', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/baloane-heliu-cat-rezista/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'baloane-heliu-cat-rezista',
        page_type = 'guide',
        title = 'Baloane heliu cât rezistă',
        h1 = 'Baloane heliu cât rezistă',
        meta_title = 'Baloane heliu cât rezistă - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/baloane-heliu-cat-rezista/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('baloane-heliu-cat-rezista', '/blog/baloane-heliu-cat-rezista/', 'guide', 'Baloane heliu cât rezistă', 'Baloane heliu cât rezistă', 'Baloane heliu cât rezistă - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'baloane heliu cât rezistă', search_intent = 'informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'baloane heliu cât rezistă', 'informativ', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for baloane-heliu-cat-rezista', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for baloane-heliu-cat-rezista', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for baloane-heliu-cat-rezista', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/baloane-heliu-latex-sau-folie/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'baloane-heliu-latex-sau-folie',
        page_type = 'guide',
        title = 'Baloane heliu latex sau folie',
        h1 = 'Baloane heliu latex sau folie',
        meta_title = 'Baloane heliu latex sau folie - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/baloane-heliu-latex-sau-folie/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('baloane-heliu-latex-sau-folie', '/blog/baloane-heliu-latex-sau-folie/', 'guide', 'Baloane heliu latex sau folie', 'Baloane heliu latex sau folie', 'Baloane heliu latex sau folie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'baloane heliu latex sau folie', search_intent = 'comparație', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'baloane heliu latex sau folie', 'comparație', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for baloane-heliu-latex-sau-folie', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for baloane-heliu-latex-sau-folie', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for baloane-heliu-latex-sau-folie', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera',
        page_type = 'guide',
        title = 'Câte baloane cu heliu sunt necesare pentru o cameră?',
        h1 = 'Câte baloane cu heliu sunt necesare pentru o cameră?',
        meta_title = 'Câte baloane cu heliu sunt necesare pentru o cameră? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera', '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/', 'guide', 'Câte baloane cu heliu sunt necesare pentru o cameră?', 'Câte baloane cu heliu sunt necesare pentru o cameră?', 'Câte baloane cu heliu sunt necesare pentru o cameră? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'câte baloane cu heliu sunt necesare pentru o cameră', search_intent = 'informativ / calcul', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'câte baloane cu heliu sunt necesare pentru o cameră', 'informativ / calcul', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/cum-se-transporta-baloanele-cu-heliu/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cum-se-transporta-baloanele-cu-heliu',
        page_type = 'guide',
        title = 'Cum se transportă baloanele cu heliu?',
        h1 = 'Cum se transportă baloanele cu heliu?',
        meta_title = 'Cum se transportă baloanele cu heliu? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cum-se-transporta-baloanele-cu-heliu/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cum-se-transporta-baloanele-cu-heliu', '/blog/cum-se-transporta-baloanele-cu-heliu/', 'guide', 'Cum se transportă baloanele cu heliu?', 'Cum se transportă baloanele cu heliu?', 'Cum se transportă baloanele cu heliu? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cum se transportă baloanele cu heliu', search_intent = 'logistic', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cum se transportă baloanele cu heliu', 'logistic', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for cum-se-transporta-baloanele-cu-heliu', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cum-se-transporta-baloanele-cu-heliu', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cum-se-transporta-baloanele-cu-heliu', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;
-- PAGE: /blog/baloane-cu-heliu-pentru-copii-idei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'baloane-cu-heliu-pentru-copii-idei',
        page_type = 'guide',
        title = 'Baloane cu heliu pentru copii idei',
        h1 = 'Baloane cu heliu pentru copii idei',
        meta_title = 'Baloane cu heliu pentru copii idei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/baloane-cu-heliu-pentru-copii-idei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('baloane-cu-heliu-pentru-copii-idei', '/blog/baloane-cu-heliu-pentru-copii-idei/', 'guide', 'Baloane cu heliu pentru copii idei', 'Baloane cu heliu pentru copii idei', 'Baloane cu heliu pentru copii idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'baloane cu heliu pentru copii idei', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'baloane cu heliu pentru copii idei', 'inspirațional', '/blog/');
    END IF;

    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'hero') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'hero', '{}'::jsonb, 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'intro') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'intro', '{}'::jsonb, 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'toc') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'toc', '{}'::jsonb, 3);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'main_answer') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'main_answer', '{}'::jsonb, 4);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'examples') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'examples', '{}'::jsonb, 5);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'mistakes_to_avoid') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'mistakes_to_avoid', '{}'::jsonb, 6);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'recommended_services') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'recommended_services', '{}'::jsonb, 7);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'faq') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'faq', '{}'::jsonb, 8);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = v_page_id AND section_type = 'final_cta') THEN
        INSERT INTO kassia_page_sections (page_id, section_type, content, order_index)
        VALUES (v_page_id, 'final_cta', '{}'::jsonb, 9);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 1) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 1 for baloane-cu-heliu-pentru-copii-idei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for baloane-cu-heliu-pentru-copii-idei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for baloane-cu-heliu-pentru-copii-idei', 'Placeholder', 3);
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
    IF NOT EXISTS (SELECT 1 FROM kassia_gallery_items WHERE page_id = v_page_id AND order_index = 5) THEN
        INSERT INTO kassia_gallery_items (page_id, url, alt_text, order_index)
        VALUES (v_page_id, '', '', 5);
    END IF;

END $$;
COMMIT;
