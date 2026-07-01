BEGIN;
DO $$
DECLARE
    v_page_id UUID;
    v_hub_id UUID;
    v_src UUID;
    v_tgt UUID;
BEGIN
-- PAGE: /blog/baloane-cu-heliu-pentru-majorat-idei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'baloane-cu-heliu-pentru-majorat-idei',
        page_type = 'guide',
        title = 'Baloane cu heliu pentru majorat idei',
        h1 = 'Baloane cu heliu pentru majorat idei',
        meta_title = 'Baloane cu heliu pentru majorat idei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/baloane-cu-heliu-pentru-majorat-idei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('baloane-cu-heliu-pentru-majorat-idei', '/blog/baloane-cu-heliu-pentru-majorat-idei/', 'guide', 'Baloane cu heliu pentru majorat idei', 'Baloane cu heliu pentru majorat idei', 'Baloane cu heliu pentru majorat idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'baloane cu heliu pentru majorat idei', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'baloane cu heliu pentru majorat idei', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for baloane-cu-heliu-pentru-majorat-idei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for baloane-cu-heliu-pentru-majorat-idei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for baloane-cu-heliu-pentru-majorat-idei', 'Placeholder', 3);
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
-- PAGE: /blog/idei-decor-baloane-botez/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-decor-baloane-botez',
        page_type = 'guide',
        title = 'Idei decor baloane botez',
        h1 = 'Idei decor baloane botez',
        meta_title = 'Idei decor baloane botez - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-decor-baloane-botez/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-decor-baloane-botez', '/blog/idei-decor-baloane-botez/', 'guide', 'Idei decor baloane botez', 'Idei decor baloane botez', 'Idei decor baloane botez - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei decor baloane botez', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei decor baloane botez', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-botez', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-botez', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-botez', 'Placeholder', 3);
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
-- PAGE: /blog/idei-decor-baloane-mot-si-turta/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-decor-baloane-mot-si-turta',
        page_type = 'guide',
        title = 'Idei decor baloane moț și turtă',
        h1 = 'Idei decor baloane moț și turtă',
        meta_title = 'Idei decor baloane moț și turtă - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-decor-baloane-mot-si-turta/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-decor-baloane-mot-si-turta', '/blog/idei-decor-baloane-mot-si-turta/', 'guide', 'Idei decor baloane moț și turtă', 'Idei decor baloane moț și turtă', 'Idei decor baloane moț și turtă - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei decor baloane moț și turtă', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei decor baloane moț și turtă', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-mot-si-turta', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-mot-si-turta', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-mot-si-turta', 'Placeholder', 3);
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
-- PAGE: /blog/idei-decor-baloane-nunta/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-decor-baloane-nunta',
        page_type = 'guide',
        title = 'Idei decor baloane nuntă',
        h1 = 'Idei decor baloane nuntă',
        meta_title = 'Idei decor baloane nuntă - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-decor-baloane-nunta/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-decor-baloane-nunta', '/blog/idei-decor-baloane-nunta/', 'guide', 'Idei decor baloane nuntă', 'Idei decor baloane nuntă', 'Idei decor baloane nuntă - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei decor baloane nuntă', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei decor baloane nuntă', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-nunta', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-nunta', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-nunta', 'Placeholder', 3);
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
-- PAGE: /blog/idei-decor-baloane-cununie/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-decor-baloane-cununie',
        page_type = 'guide',
        title = 'Idei decor baloane cununie',
        h1 = 'Idei decor baloane cununie',
        meta_title = 'Idei decor baloane cununie - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-decor-baloane-cununie/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-decor-baloane-cununie', '/blog/idei-decor-baloane-cununie/', 'guide', 'Idei decor baloane cununie', 'Idei decor baloane cununie', 'Idei decor baloane cununie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei decor baloane cununie', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei decor baloane cununie', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-cununie', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-cununie', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-cununie', 'Placeholder', 3);
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
-- PAGE: /blog/idei-decor-baloane-majorat/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-decor-baloane-majorat',
        page_type = 'guide',
        title = 'Idei decor baloane majorat',
        h1 = 'Idei decor baloane majorat',
        meta_title = 'Idei decor baloane majorat - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-decor-baloane-majorat/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-decor-baloane-majorat', '/blog/idei-decor-baloane-majorat/', 'guide', 'Idei decor baloane majorat', 'Idei decor baloane majorat', 'Idei decor baloane majorat - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei decor baloane majorat', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei decor baloane majorat', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-majorat', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-majorat', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-majorat', 'Placeholder', 3);
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
-- PAGE: /blog/idei-decor-baloane-aniversare-copii/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-decor-baloane-aniversare-copii',
        page_type = 'guide',
        title = 'Idei decor baloane aniversare copii',
        h1 = 'Idei decor baloane aniversare copii',
        meta_title = 'Idei decor baloane aniversare copii - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-decor-baloane-aniversare-copii/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-decor-baloane-aniversare-copii', '/blog/idei-decor-baloane-aniversare-copii/', 'guide', 'Idei decor baloane aniversare copii', 'Idei decor baloane aniversare copii', 'Idei decor baloane aniversare copii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei decor baloane aniversare copii', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei decor baloane aniversare copii', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-aniversare-copii', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-aniversare-copii', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-aniversare-copii', 'Placeholder', 3);
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
-- PAGE: /blog/idei-decor-baloane-aniversare-adulti/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-decor-baloane-aniversare-adulti',
        page_type = 'guide',
        title = 'Idei decor baloane aniversare adulți',
        h1 = 'Idei decor baloane aniversare adulți',
        meta_title = 'Idei decor baloane aniversare adulți - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-decor-baloane-aniversare-adulti/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-decor-baloane-aniversare-adulti', '/blog/idei-decor-baloane-aniversare-adulti/', 'guide', 'Idei decor baloane aniversare adulți', 'Idei decor baloane aniversare adulți', 'Idei decor baloane aniversare adulți - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei decor baloane aniversare adulți', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei decor baloane aniversare adulți', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-aniversare-adulti', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-aniversare-adulti', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-aniversare-adulti', 'Placeholder', 3);
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
-- PAGE: /blog/idei-decor-baloane-baby-shower/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-decor-baloane-baby-shower',
        page_type = 'guide',
        title = 'Idei decor baloane baby shower',
        h1 = 'Idei decor baloane baby shower',
        meta_title = 'Idei decor baloane baby shower - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-decor-baloane-baby-shower/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-decor-baloane-baby-shower', '/blog/idei-decor-baloane-baby-shower/', 'guide', 'Idei decor baloane baby shower', 'Idei decor baloane baby shower', 'Idei decor baloane baby shower - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei decor baloane baby shower', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei decor baloane baby shower', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-baby-shower', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-baby-shower', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-baby-shower', 'Placeholder', 3);
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
-- PAGE: /blog/idei-decor-baloane-gender-reveal/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-decor-baloane-gender-reveal',
        page_type = 'guide',
        title = 'Idei decor baloane gender reveal',
        h1 = 'Idei decor baloane gender reveal',
        meta_title = 'Idei decor baloane gender reveal - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-decor-baloane-gender-reveal/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-decor-baloane-gender-reveal', '/blog/idei-decor-baloane-gender-reveal/', 'guide', 'Idei decor baloane gender reveal', 'Idei decor baloane gender reveal', 'Idei decor baloane gender reveal - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei decor baloane gender reveal', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei decor baloane gender reveal', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-gender-reveal', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-gender-reveal', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-gender-reveal', 'Placeholder', 3);
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
-- PAGE: /blog/idei-decor-baloane-corporate/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'idei-decor-baloane-corporate',
        page_type = 'guide',
        title = 'Idei decor baloane corporate',
        h1 = 'Idei decor baloane corporate',
        meta_title = 'Idei decor baloane corporate - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/idei-decor-baloane-corporate/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('idei-decor-baloane-corporate', '/blog/idei-decor-baloane-corporate/', 'guide', 'Idei decor baloane corporate', 'Idei decor baloane corporate', 'Idei decor baloane corporate - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'idei decor baloane corporate', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'idei decor baloane corporate', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for idei-decor-baloane-corporate', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for idei-decor-baloane-corporate', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for idei-decor-baloane-corporate', 'Placeholder', 3);
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
-- PAGE: /blog/cum-alegi-culorile-pentru-decorul-cu-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cum-alegi-culorile-pentru-decorul-cu-baloane',
        page_type = 'guide',
        title = 'Cum alegi culorile pentru decorul cu baloane?',
        h1 = 'Cum alegi culorile pentru decorul cu baloane?',
        meta_title = 'Cum alegi culorile pentru decorul cu baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cum-alegi-culorile-pentru-decorul-cu-baloane', '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/', 'guide', 'Cum alegi culorile pentru decorul cu baloane?', 'Cum alegi culorile pentru decorul cu baloane?', 'Cum alegi culorile pentru decorul cu baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cum alegi culorile pentru decorul cu baloane', search_intent = 'informativ / design', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cum alegi culorile pentru decorul cu baloane', 'informativ / design', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for cum-alegi-culorile-pentru-decorul-cu-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cum-alegi-culorile-pentru-decorul-cu-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cum-alegi-culorile-pentru-decorul-cu-baloane', 'Placeholder', 3);
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
-- PAGE: /blog/decor-baloane-roz-auriu-idei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decor-baloane-roz-auriu-idei',
        page_type = 'guide',
        title = 'Decor baloane roz auriu idei',
        h1 = 'Decor baloane roz auriu idei',
        meta_title = 'Decor baloane roz auriu idei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/decor-baloane-roz-auriu-idei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decor-baloane-roz-auriu-idei', '/blog/decor-baloane-roz-auriu-idei/', 'guide', 'Decor baloane roz auriu idei', 'Decor baloane roz auriu idei', 'Decor baloane roz auriu idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decor baloane roz auriu idei', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decor baloane roz auriu idei', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-roz-auriu-idei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-roz-auriu-idei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-roz-auriu-idei', 'Placeholder', 3);
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
-- PAGE: /blog/decor-baloane-alb-auriu-idei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decor-baloane-alb-auriu-idei',
        page_type = 'guide',
        title = 'Decor baloane alb auriu idei',
        h1 = 'Decor baloane alb auriu idei',
        meta_title = 'Decor baloane alb auriu idei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/decor-baloane-alb-auriu-idei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decor-baloane-alb-auriu-idei', '/blog/decor-baloane-alb-auriu-idei/', 'guide', 'Decor baloane alb auriu idei', 'Decor baloane alb auriu idei', 'Decor baloane alb auriu idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decor baloane alb auriu idei', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decor baloane alb auriu idei', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-alb-auriu-idei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-alb-auriu-idei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-alb-auriu-idei', 'Placeholder', 3);
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
-- PAGE: /blog/decor-baloane-pastel-idei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decor-baloane-pastel-idei',
        page_type = 'guide',
        title = 'Decor baloane pastel idei',
        h1 = 'Decor baloane pastel idei',
        meta_title = 'Decor baloane pastel idei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/decor-baloane-pastel-idei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decor-baloane-pastel-idei', '/blog/decor-baloane-pastel-idei/', 'guide', 'Decor baloane pastel idei', 'Decor baloane pastel idei', 'Decor baloane pastel idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decor baloane pastel idei', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decor baloane pastel idei', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-pastel-idei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-pastel-idei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-pastel-idei', 'Placeholder', 3);
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
-- PAGE: /blog/decor-baloane-luxury-idei/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decor-baloane-luxury-idei',
        page_type = 'guide',
        title = 'Decor baloane luxury idei',
        h1 = 'Decor baloane luxury idei',
        meta_title = 'Decor baloane luxury idei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/decor-baloane-luxury-idei/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decor-baloane-luxury-idei', '/blog/decor-baloane-luxury-idei/', 'guide', 'Decor baloane luxury idei', 'Decor baloane luxury idei', 'Decor baloane luxury idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decor baloane luxury idei', search_intent = 'inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decor baloane luxury idei', 'inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-luxury-idei', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-luxury-idei', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-luxury-idei', 'Placeholder', 3);
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
-- PAGE: /blog/decor-baloane-minimalist-sau-spectaculos/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'decor-baloane-minimalist-sau-spectaculos',
        page_type = 'guide',
        title = 'Decor baloane minimalist sau spectaculos',
        h1 = 'Decor baloane minimalist sau spectaculos',
        meta_title = 'Decor baloane minimalist sau spectaculos - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/decor-baloane-minimalist-sau-spectaculos/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('decor-baloane-minimalist-sau-spectaculos', '/blog/decor-baloane-minimalist-sau-spectaculos/', 'guide', 'Decor baloane minimalist sau spectaculos', 'Decor baloane minimalist sau spectaculos', 'Decor baloane minimalist sau spectaculos - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decor baloane minimalist sau spectaculos', search_intent = 'comparație / inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decor baloane minimalist sau spectaculos', 'comparație / inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for decor-baloane-minimalist-sau-spectaculos', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for decor-baloane-minimalist-sau-spectaculos', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for decor-baloane-minimalist-sau-spectaculos', 'Placeholder', 3);
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
-- PAGE: /blog/cum-comanzi-decoratiuni-cu-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cum-comanzi-decoratiuni-cu-baloane',
        page_type = 'guide',
        title = 'Cum comanzi decorațiuni cu baloane?',
        h1 = 'Cum comanzi decorațiuni cu baloane?',
        meta_title = 'Cum comanzi decorațiuni cu baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cum-comanzi-decoratiuni-cu-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cum-comanzi-decoratiuni-cu-baloane', '/blog/cum-comanzi-decoratiuni-cu-baloane/', 'guide', 'Cum comanzi decorațiuni cu baloane?', 'Cum comanzi decorațiuni cu baloane?', 'Cum comanzi decorațiuni cu baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cum comanzi decorațiuni cu baloane', search_intent = 'logistic / conversie', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cum comanzi decorațiuni cu baloane', 'logistic / conversie', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for cum-comanzi-decoratiuni-cu-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cum-comanzi-decoratiuni-cu-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cum-comanzi-decoratiuni-cu-baloane', 'Placeholder', 3);
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
-- PAGE: /blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cu-cat-timp-inainte-se-comanda-decorul-cu-baloane',
        page_type = 'guide',
        title = 'Cu cât timp înainte se comandă decorul cu baloane?',
        h1 = 'Cu cât timp înainte se comandă decorul cu baloane?',
        meta_title = 'Cu cât timp înainte se comandă decorul cu baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cu-cat-timp-inainte-se-comanda-decorul-cu-baloane', '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/', 'guide', 'Cu cât timp înainte se comandă decorul cu baloane?', 'Cu cât timp înainte se comandă decorul cu baloane?', 'Cu cât timp înainte se comandă decorul cu baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'cu cât timp înainte se comandă decorul cu baloane', search_intent = 'logistic', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'cu cât timp înainte se comandă decorul cu baloane', 'logistic', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for cu-cat-timp-inainte-se-comanda-decorul-cu-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cu-cat-timp-inainte-se-comanda-decorul-cu-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cu-cat-timp-inainte-se-comanda-decorul-cu-baloane', 'Placeholder', 3);
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
-- PAGE: /blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'ce-informatii-trebuie-sa-trimiti-pentru-o-oferta',
        page_type = 'guide',
        title = 'Ce informații trebuie să trimiți pentru ofertă decor baloane?',
        h1 = 'Ce informații trebuie să trimiți pentru ofertă decor baloane?',
        meta_title = 'Ce informații trebuie să trimiți pentru ofertă decor baloane? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('ce-informatii-trebuie-sa-trimiti-pentru-o-oferta', '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/', 'guide', 'Ce informații trebuie să trimiți pentru ofertă decor baloane?', 'Ce informații trebuie să trimiți pentru ofertă decor baloane?', 'Ce informații trebuie să trimiți pentru ofertă decor baloane? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'ce informații trebuie să trimiți pentru ofertă decor baloane', search_intent = 'logistic / conversie', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'ce informații trebuie să trimiți pentru ofertă decor baloane', 'logistic / conversie', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for ce-informatii-trebuie-sa-trimiti-pentru-o-oferta', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for ce-informatii-trebuie-sa-trimiti-pentru-o-oferta', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for ce-informatii-trebuie-sa-trimiti-pentru-o-oferta', 'Placeholder', 3);
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
-- PAGE: /blog/cum-se-face-montajul-decoratiunilor-cu-baloane/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'cum-se-face-montajul-decoratiunilor-cu-baloane',
        page_type = 'guide',
        title = 'Montaj decorațiuni baloane',
        h1 = 'Montaj decorațiuni baloane',
        meta_title = 'Montaj decorațiuni baloane - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('cum-se-face-montajul-decoratiunilor-cu-baloane', '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/', 'guide', 'Montaj decorațiuni baloane', 'Montaj decorațiuni baloane', 'Montaj decorațiuni baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'montaj decorațiuni baloane', search_intent = 'logistic / informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'montaj decorațiuni baloane', 'logistic / informativ', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for cum-se-face-montajul-decoratiunilor-cu-baloane', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for cum-se-face-montajul-decoratiunilor-cu-baloane', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for cum-se-face-montajul-decoratiunilor-cu-baloane', 'Placeholder', 3);
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
-- PAGE: /blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'se-pot-monta-decoratiuni-cu-baloane-in-exterior',
        page_type = 'guide',
        title = 'Decorațiuni baloane exterior',
        h1 = 'Decorațiuni baloane exterior',
        meta_title = 'Decorațiuni baloane exterior - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('se-pot-monta-decoratiuni-cu-baloane-in-exterior', '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/', 'guide', 'Decorațiuni baloane exterior', 'Decorațiuni baloane exterior', 'Decorațiuni baloane exterior - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'decorațiuni baloane exterior', search_intent = 'logistic / informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'decorațiuni baloane exterior', 'logistic / informativ', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for se-pot-monta-decoratiuni-cu-baloane-in-exterior', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for se-pot-monta-decoratiuni-cu-baloane-in-exterior', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for se-pot-monta-decoratiuni-cu-baloane-in-exterior', 'Placeholder', 3);
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
-- PAGE: /blog/ce-se-intampla-cu-decorul-dupa-eveniment/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'ce-se-intampla-cu-decorul-dupa-eveniment',
        page_type = 'guide',
        title = 'Ce se întâmplă cu decorul după eveniment?',
        h1 = 'Ce se întâmplă cu decorul după eveniment?',
        meta_title = 'Ce se întâmplă cu decorul după eveniment? - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('ce-se-intampla-cu-decorul-dupa-eveniment', '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/', 'guide', 'Ce se întâmplă cu decorul după eveniment?', 'Ce se întâmplă cu decorul după eveniment?', 'Ce se întâmplă cu decorul după eveniment? - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'ce se întâmplă cu decorul după eveniment', search_intent = 'logistic / informativ', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'ce se întâmplă cu decorul după eveniment', 'logistic / informativ', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for ce-se-intampla-cu-decorul-dupa-eveniment', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for ce-se-intampla-cu-decorul-dupa-eveniment', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for ce-se-intampla-cu-decorul-dupa-eveniment', 'Placeholder', 3);
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
-- PAGE: /blog/panou-foto-cu-baloane-idei-si-recomandari/
    v_page_id := NULL;
    UPDATE kassia_pages SET
        slug = 'panou-foto-cu-baloane-idei-si-recomandari',
        page_type = 'guide',
        title = 'Panou foto cu baloane idei',
        h1 = 'Panou foto cu baloane idei',
        meta_title = 'Panou foto cu baloane idei - Kassia',
        canonical_url = NULL,
        priority = 0.5,
        status = CASE WHEN status = 'published' THEN status ELSE 'draft' END,
        index_status = CASE WHEN status = 'published' THEN index_status ELSE 'noindex' END
    WHERE path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/' RETURNING id INTO v_page_id;

    IF v_page_id IS NULL THEN
        INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
        VALUES ('panou-foto-cu-baloane-idei-si-recomandari', '/blog/panou-foto-cu-baloane-idei-si-recomandari/', 'guide', 'Panou foto cu baloane idei', 'Panou foto cu baloane idei', 'Panou foto cu baloane idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
        RETURNING id INTO v_page_id;
    END IF;

    IF EXISTS (SELECT 1 FROM kassia_seo_map WHERE page_id = v_page_id) THEN
        UPDATE kassia_seo_map SET main_keyword = 'panou foto cu baloane idei', search_intent = 'informativ / inspirațional', parent_path = '/blog/' WHERE page_id = v_page_id;
    ELSE
        INSERT INTO kassia_seo_map (page_id, main_keyword, search_intent, parent_path) VALUES (v_page_id, 'panou foto cu baloane idei', 'informativ / inspirațional', '/blog/');
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
        VALUES (v_page_id, 'Draft FAQ 1 for panou-foto-cu-baloane-idei-si-recomandari', 'Placeholder', 1);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 2) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 2 for panou-foto-cu-baloane-idei-si-recomandari', 'Placeholder', 2);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = v_page_id AND order_index = 3) THEN
        INSERT INTO kassia_faqs (page_id, question, answer, order_index)
        VALUES (v_page_id, 'Draft FAQ 3 for panou-foto-cu-baloane-idei-si-recomandari', 'Placeholder', 3);
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
