BEGIN;
DO $$
DECLARE
    v_page_id UUID;
    v_hub_id UUID;
    v_src UUID;
    v_tgt UUID;
BEGIN
-- PAGE: /blog/candy-bar-cu-decor-de-baloane-idei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'candy-bar-cu-decor-de-baloane-idei',
        page_type = 'guide',
        title = 'Candy bar cu decor de baloane idei',
        h1 = 'Candy bar cu decor de baloane idei',
        meta_title = 'Candy bar cu decor de baloane idei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/candy-bar-cu-decor-de-baloane-idei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('candy-bar-cu-decor-de-baloane-idei', '/blog/candy-bar-cu-decor-de-baloane-idei/', 'guide', 'Candy bar cu decor de baloane idei', 'Candy bar cu decor de baloane idei', 'Candy bar cu decor de baloane idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'candy bar cu decor de baloane idei', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'candy bar cu decor de baloane idei', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for candy-bar-cu-decor-de-baloane-idei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for candy-bar-cu-decor-de-baloane-idei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for candy-bar-cu-decor-de-baloane-idei', 'Placeholder', 3);
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
-- PAGE: /blog/foto-corner-cu-baloane-pentru-evenimente/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'foto-corner-cu-baloane-pentru-evenimente',
        page_type = 'guide',
        title = 'Foto corner cu baloane pentru evenimente',
        h1 = 'Foto corner cu baloane pentru evenimente',
        meta_title = 'Foto corner cu baloane pentru evenimente - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/foto-corner-cu-baloane-pentru-evenimente/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('foto-corner-cu-baloane-pentru-evenimente', '/blog/foto-corner-cu-baloane-pentru-evenimente/', 'guide', 'Foto corner cu baloane pentru evenimente', 'Foto corner cu baloane pentru evenimente', 'Foto corner cu baloane pentru evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'foto corner cu baloane pentru evenimente', search_intent = 'inspirațional / informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'foto corner cu baloane pentru evenimente', 'inspirațional / informativ', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for foto-corner-cu-baloane-pentru-evenimente', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for foto-corner-cu-baloane-pentru-evenimente', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for foto-corner-cu-baloane-pentru-evenimente', 'Placeholder', 3);
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
-- PAGE: /blog/cifre-si-litere-din-baloane-cand-se-folosesc/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cifre-si-litere-din-baloane-cand-se-folosesc',
        page_type = 'guide',
        title = 'Cifre și litere din baloane',
        h1 = 'Cifre și litere din baloane',
        meta_title = 'Cifre și litere din baloane - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cifre-si-litere-din-baloane-cand-se-folosesc', '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/', 'guide', 'Cifre și litere din baloane', 'Cifre și litere din baloane', 'Cifre și litere din baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cifre și litere din baloane', search_intent = 'informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cifre și litere din baloane', 'informativ', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for cifre-si-litere-din-baloane-cand-se-folosesc', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cifre-si-litere-din-baloane-cand-se-folosesc', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cifre-si-litere-din-baloane-cand-se-folosesc', 'Placeholder', 3);
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
-- PAGE: /blog/buchete-baloane-cand-se-potrivesc/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'buchete-baloane-cand-se-potrivesc',
        page_type = 'guide',
        title = 'Buchete baloane când se potrivesc',
        h1 = 'Buchete baloane când se potrivesc',
        meta_title = 'Buchete baloane când se potrivesc - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/buchete-baloane-cand-se-potrivesc/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('buchete-baloane-cand-se-potrivesc', '/blog/buchete-baloane-cand-se-potrivesc/', 'guide', 'Buchete baloane când se potrivesc', 'Buchete baloane când se potrivesc', 'Buchete baloane când se potrivesc - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'buchete baloane când se potrivesc', search_intent = 'informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'buchete baloane când se potrivesc', 'informativ', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for buchete-baloane-cand-se-potrivesc', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for buchete-baloane-cand-se-potrivesc', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for buchete-baloane-cand-se-potrivesc', 'Placeholder', 3);
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
-- PAGE: /blog/baloane-personalizate-pentru-evenimente/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'baloane-personalizate-pentru-evenimente',
        page_type = 'guide',
        title = 'Baloane personalizate pentru evenimente',
        h1 = 'Baloane personalizate pentru evenimente',
        meta_title = 'Baloane personalizate pentru evenimente - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/baloane-personalizate-pentru-evenimente/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('baloane-personalizate-pentru-evenimente', '/blog/baloane-personalizate-pentru-evenimente/', 'guide', 'Baloane personalizate pentru evenimente', 'Baloane personalizate pentru evenimente', 'Baloane personalizate pentru evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'baloane personalizate pentru evenimente', search_intent = 'informativ / comercial suport', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'baloane personalizate pentru evenimente', 'informativ / comercial suport', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for baloane-personalizate-pentru-evenimente', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for baloane-personalizate-pentru-evenimente', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for baloane-personalizate-pentru-evenimente', 'Placeholder', 3);
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

DO $$
DECLARE
  v_src UUID;
  v_tgt UUID;
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
SELECT id INTO v_src FROM kassia_pages WHERE path = '/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'prețuri') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'prețuri');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/despre-noi/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/despre-noi/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-1/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane sector 1') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane sector 1');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-2/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane sector 2') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane sector 2');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-3/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane sector 3') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane sector 3');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-4/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane sector 4') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane sector 4');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-5/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane sector 5') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane sector 5');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-6/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane sector 6') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane sector 6');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aviatiei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane aviatiei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane aviatiei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-baneasa/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane baneasa') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane baneasa');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-domenii/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane domenii') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane domenii');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-herastrau/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane herastrau') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane herastrau');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-victoriei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane victoriei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane victoriei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-colentina/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane colentina') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane colentina');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-obor/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane obor') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane obor');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane pantelimon') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane pantelimon');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-tei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane tei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane tei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefan-cel-mare/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane stefan cel mare') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane stefan cel mare');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-dristor/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane dristor') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane dristor');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-titan/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane titan') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane titan');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-vitan/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane vitan') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane vitan');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-unirii/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane unirii') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane unirii');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-dudesti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane dudesti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane dudesti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane berceni') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane berceni');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-tineretului/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane tineretului') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane tineretului');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-piata-sudului/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane piata sudului') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane piata sudului');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aparatorii-patriei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane aparatorii patriei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane aparatorii patriei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-oltenitei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane oltenitei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane oltenitei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-rahova/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane rahova') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane rahova');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-cotroceni/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane cotroceni') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane cotroceni');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-13-septembrie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane 13 septembrie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane 13 septembrie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-ferentari/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane ferentari') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane ferentari');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-sebastian/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane sebastian') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane sebastian');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-drumul-taberei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane drumul taberei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane drumul taberei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-militari/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane militari') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane militari');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-crangasi/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane crangasi') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane crangasi');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-giulesti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane giulesti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane giulesti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-grozavesti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane grozavesti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane grozavesti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-ilfov/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane ilfov') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane ilfov');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-voluntari/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane voluntari') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane voluntari');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-pipera/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane pipera') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane pipera');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-otopeni/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane otopeni') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane otopeni');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-tunari/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane tunari') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane tunari');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-corbeanca/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane corbeanca') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane corbeanca');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-balotesti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane balotesti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane balotesti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-mogosoaia/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane mogosoaia') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane mogosoaia');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-chitila/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane chitila') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane chitila');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-chiajna/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane chiajna') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane chiajna');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-domnesti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane domnesti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane domnesti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bragadiru/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bragadiru') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bragadiru');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-magurele/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane magurele') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane magurele');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-popesti-leordeni/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane popesti leordeni') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane popesti leordeni');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni-ilfov/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane berceni ilfov') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane berceni ilfov');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon-ilfov/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane pantelimon ilfov') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane pantelimon ilfov');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-cernica/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane cernica') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane cernica');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-afumati/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane afumati') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane afumati');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefanestii-de-jos/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane stefanestii de jos') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane stefanestii de jos');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-dascalu/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane dascalu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane dascalu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-snagov/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane snagov') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane snagov');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-clinceni/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane clinceni') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane clinceni');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-dragomiresti-vale/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane dragomiresti vale') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane dragomiresti vale');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-jilava/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane jilava') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane jilava');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/contact/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-decembrie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane 1 decembrie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane 1 decembrie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/galerie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/galerie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/intrebari-frecvente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/intrebari-frecvente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/recenzii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/recenzii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane botez bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane botez bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-mot-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane mot bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane mot bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-turta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane turta bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane turta bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane nunta bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane nunta bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-8-martie-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane 8 martie bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane 8 martie bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-cununie-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane cununie bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane cununie bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane majorat bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane majorat bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane aniversare copii bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane aniversare copii bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane aniversare adulti bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane aniversare adulti bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-petrecere-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane petrecere bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane petrecere bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-corporate-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane corporate bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane corporate bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane deschidere magazin bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane deschidere magazin bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane deschidere restaurant bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane deschidere restaurant bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-lansare-produs-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane lansare produs bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane lansare produs bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-showroom-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane showroom bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane showroom bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-gradinita-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane gradinita bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane gradinita bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-scoala-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane scoala bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane scoala bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-baby-shower-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane baby shower bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane baby shower bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-gender-reveal-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane gender reveal bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane gender reveal bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-craciun-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane craciun bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane craciun bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-revelion-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane revelion bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane revelion bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-paste-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane paste bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane paste bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-halloween-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane halloween bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane halloween bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-iunie-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane 1 iunie bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane 1 iunie bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/portofoliu-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-absolvire-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane absolvire bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane absolvire bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/termeni-si-conditii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/termeni-si-conditii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/politica-de-confidentialitate/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/politica-de-confidentialitate/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cat-costa-decoratiunile-cu-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cât costă decorațiunile cu baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cât costă decorațiunile cu baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cat-costa-o-arcada-de-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cât costă o arcadă de baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cât costă o arcadă de baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cat-costa-baloanele-cu-heliu/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cât costă baloanele cu heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cât costă baloanele cu heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cat-costa-un-panou-foto-cu-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cât costă un panou foto cu baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cât costă un panou foto cu baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cât costă decor baloane botez') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cât costă decor baloane botez');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cât costă decor baloane nuntă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cât costă decor baloane nuntă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/ce-include-un-pachet-decor-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'ce include un pachet decor baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'ce include un pachet decor baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cum alegi pachetul de decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cum alegi pachetul de decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cum-alegi-arcada-de-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cum alegi arcada de baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cum alegi arcada de baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/arcada-baloane-organica-sau-clasica/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane organică sau clasică') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane organică sau clasică');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'dimensiune arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'dimensiune arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'unde se poate monta o arcadă de baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'unde se poate monta o arcadă de baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cat-rezista-o-arcada-de-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cât rezistă o arcadă de baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cât rezistă o arcadă de baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-arcada-baloane-pentru-evenimente/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei arcadă baloane evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei arcadă baloane evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/baloane-heliu-cat-rezista/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu cât rezistă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu cât rezistă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/baloane-heliu-latex-sau-folie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu latex sau folie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu latex sau folie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'câte baloane cu heliu sunt necesare pentru o cameră') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'câte baloane cu heliu sunt necesare pentru o cameră');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cum-se-transporta-baloanele-cu-heliu/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cum se transportă baloanele cu heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cum se transportă baloanele cu heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/baloane-cu-heliu-pentru-copii-idei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane cu heliu pentru copii idei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane cu heliu pentru copii idei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/baloane-cu-heliu-pentru-majorat-idei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane cu heliu pentru majorat idei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane cu heliu pentru majorat idei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-botez/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei decor baloane botez') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei decor baloane botez');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-mot-si-turta/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei decor baloane moț și turtă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei decor baloane moț și turtă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-nunta/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei decor baloane nuntă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei decor baloane nuntă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-cununie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei decor baloane cununie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei decor baloane cununie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-majorat/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei decor baloane majorat') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei decor baloane majorat');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-copii/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei decor baloane aniversare copii') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei decor baloane aniversare copii');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-adulti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei decor baloane aniversare adulți') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei decor baloane aniversare adulți');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-baby-shower/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei decor baloane baby shower') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei decor baloane baby shower');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-gender-reveal/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei decor baloane gender reveal') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei decor baloane gender reveal');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-corporate/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'idei decor baloane corporate') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'idei decor baloane corporate');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cum alegi culorile pentru decorul cu baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cum alegi culorile pentru decorul cu baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/decor-baloane-roz-auriu-idei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decor baloane roz auriu idei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decor baloane roz auriu idei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/decor-baloane-alb-auriu-idei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decor baloane alb auriu idei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decor baloane alb auriu idei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/decor-baloane-pastel-idei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decor baloane pastel idei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decor baloane pastel idei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/decor-baloane-luxury-idei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decor baloane luxury idei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decor baloane luxury idei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/decor-baloane-minimalist-sau-spectaculos/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decor baloane minimalist sau spectaculos') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decor baloane minimalist sau spectaculos');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cum-comanzi-decoratiuni-cu-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cum comanzi decorațiuni cu baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cum comanzi decorațiuni cu baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cu cât timp înainte se comandă decorul cu baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cu cât timp înainte se comandă decorul cu baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'ce informații trebuie să trimiți pentru ofertă decor baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'ce informații trebuie să trimiți pentru ofertă decor baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'montaj decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'montaj decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane exterior') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane exterior');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'ce se întâmplă cu decorul după eveniment') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'ce se întâmplă cu decorul după eveniment');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto cu baloane idei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto cu baloane idei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/candy-bar-cu-decor-de-baloane-idei/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'candy bar cu decor de baloane idei') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'candy bar cu decor de baloane idei');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/foto-corner-cu-baloane-pentru-evenimente/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'foto corner cu baloane pentru evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'foto corner cu baloane pentru evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cifre și litere din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cifre și litere din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/buchete-baloane-cand-se-potrivesc/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane când se potrivesc') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane când se potrivesc');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/blog/baloane-personalizate-pentru-evenimente/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane personalizate pentru evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane personalizate pentru evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/politica-cookies/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/politica-cookies/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;

END $$;
COMMIT;
