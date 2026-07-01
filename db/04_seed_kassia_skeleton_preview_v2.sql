-- SEED SKELETON PREVIEW PENTRU KASSIA V2 (169 PAGES)
-- GENERATED VIA SCRIPT.

DO $$
DECLARE
    v_page_id UUID;
BEGIN

    -- PAGE: /
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('home', '/', 'homepage', 'Homepage', 'Homepage', 'Homepage - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru home?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru home?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru home?', 'A3', 3);

    -- PAGE: /despre-noi/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('despre-noi', '/despre-noi/', 'support', 'Despre Noi', 'Despre Noi', 'Despre Noi - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /contact/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('contact', '/contact/', 'support', 'Contact', 'Contact', 'Contact - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /galerie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('galerie', '/galerie/', 'support', 'Galerie', 'Galerie', 'Galerie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /preturi-decoratiuni-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('preturi-decoratiuni-baloane', '/preturi-decoratiuni-baloane/', 'support', 'Preturi Decoratiuni Baloane', 'Preturi Decoratiuni Baloane', 'Preturi Decoratiuni Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /intrebari-frecvente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('intrebari-frecvente', '/intrebari-frecvente/', 'support', 'Intrebari Frecvente', 'Intrebari Frecvente', 'Intrebari Frecvente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /recenzii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('recenzii', '/recenzii/', 'support', 'Recenzii', 'Recenzii', 'Recenzii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /portofoliu-evenimente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('portofoliu-evenimente', '/portofoliu-evenimente/', 'support', 'Portofoliu Evenimente', 'Portofoliu Evenimente', 'Portofoliu Evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /termeni-si-conditii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('termeni-si-conditii', '/termeni-si-conditii/', 'support', 'Termeni Si Conditii', 'Termeni Si Conditii', 'Termeni Si Conditii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /politica-de-confidentialitate/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('politica-de-confidentialitate', '/politica-de-confidentialitate/', 'support', 'Politica De Confidentialitate', 'Politica De Confidentialitate', 'Politica De Confidentialitate - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /blog/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blog', '/blog/', 'support', 'Blog', 'Blog', 'Blog - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /politica-cookies/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('politica-cookies', '/politica-cookies/', 'support', 'Politica Cookies', 'Politica Cookies', 'Politica Cookies - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- PAGE: /decoratiuni-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-bucuresti', '/decoratiuni-baloane-bucuresti/', 'service_pillar', 'Decoratiuni Baloane Bucuresti', 'Decoratiuni Baloane Bucuresti', 'Decoratiuni Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-bucuresti?', 'A3', 3);

    -- PAGE: /aranjamente-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('aranjamente-baloane-bucuresti', '/aranjamente-baloane-bucuresti/', 'service', 'Aranjamente Baloane Bucuresti', 'Aranjamente Baloane Bucuresti', 'Aranjamente Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru aranjamente-baloane-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru aranjamente-baloane-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru aranjamente-baloane-bucuresti?', 'A3', 3);

    -- PAGE: /arcada-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-bucuresti', '/arcada-baloane-bucuresti/', 'service', 'Arcada Baloane Bucuresti', 'Arcada Baloane Bucuresti', 'Arcada Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru arcada-baloane-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru arcada-baloane-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru arcada-baloane-bucuresti?', 'A3', 3);

    -- PAGE: /baloane-heliu-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-bucuresti', '/baloane-heliu-bucuresti/', 'service', 'Baloane Heliu Bucuresti', 'Baloane Heliu Bucuresti', 'Baloane Heliu Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru baloane-heliu-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru baloane-heliu-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru baloane-heliu-bucuresti?', 'A3', 3);

    -- PAGE: /panou-foto-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('panou-foto-baloane-bucuresti', '/panou-foto-baloane-bucuresti/', 'service', 'Panou Foto Baloane Bucuresti', 'Panou Foto Baloane Bucuresti', 'Panou Foto Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru panou-foto-baloane-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru panou-foto-baloane-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru panou-foto-baloane-bucuresti?', 'A3', 3);

    -- PAGE: /buchete-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('buchete-baloane-bucuresti', '/buchete-baloane-bucuresti/', 'service', 'Buchete Baloane Bucuresti', 'Buchete Baloane Bucuresti', 'Buchete Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru buchete-baloane-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru buchete-baloane-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru buchete-baloane-bucuresti?', 'A3', 3);

    -- PAGE: /baloane-personalizate-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-personalizate-bucuresti', '/baloane-personalizate-bucuresti/', 'service', 'Baloane Personalizate Bucuresti', 'Baloane Personalizate Bucuresti', 'Baloane Personalizate Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru baloane-personalizate-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru baloane-personalizate-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru baloane-personalizate-bucuresti?', 'A3', 3);

    -- PAGE: /baloane-cifre-litere-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-cifre-litere-bucuresti', '/baloane-cifre-litere-bucuresti/', 'service', 'Baloane Cifre Litere Bucuresti', 'Baloane Cifre Litere Bucuresti', 'Baloane Cifre Litere Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru baloane-cifre-litere-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru baloane-cifre-litere-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru baloane-cifre-litere-bucuresti?', 'A3', 3);

    -- PAGE: /ghirlande-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('ghirlande-baloane-bucuresti', '/ghirlande-baloane-bucuresti/', 'service', 'Ghirlande Baloane Bucuresti', 'Ghirlande Baloane Bucuresti', 'Ghirlande Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru ghirlande-baloane-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru ghirlande-baloane-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru ghirlande-baloane-bucuresti?', 'A3', 3);

    -- PAGE: /stalpi-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('stalpi-baloane-bucuresti', '/stalpi-baloane-bucuresti/', 'service', 'Stalpi Baloane Bucuresti', 'Stalpi Baloane Bucuresti', 'Stalpi Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru stalpi-baloane-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru stalpi-baloane-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru stalpi-baloane-bucuresti?', 'A3', 3);

    -- PAGE: /perete-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('perete-baloane-bucuresti', '/perete-baloane-bucuresti/', 'service', 'Perete Baloane Bucuresti', 'Perete Baloane Bucuresti', 'Perete Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru perete-baloane-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru perete-baloane-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru perete-baloane-bucuresti?', 'A3', 3);

    -- PAGE: /decor-baloane-candy-bar-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decor-baloane-candy-bar-bucuresti', '/decor-baloane-candy-bar-bucuresti/', 'service', 'Decor Baloane Candy Bar Bucuresti', 'Decor Baloane Candy Bar Bucuresti', 'Decor Baloane Candy Bar Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decor-baloane-candy-bar-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decor-baloane-candy-bar-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decor-baloane-candy-bar-bucuresti?', 'A3', 3);

    -- PAGE: /livrare-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('livrare-baloane-bucuresti', '/livrare-baloane-bucuresti/', 'service', 'Livrare Baloane Bucuresti', 'Livrare Baloane Bucuresti', 'Livrare Baloane Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru livrare-baloane-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru livrare-baloane-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru livrare-baloane-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-botez-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-botez-bucuresti', '/decoratiuni-baloane-botez-bucuresti/', 'event', 'Decoratiuni Baloane Botez Bucuresti', 'Decoratiuni Baloane Botez Bucuresti', 'Decoratiuni Baloane Botez Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-botez-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-botez-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-botez-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-mot-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-mot-bucuresti', '/decoratiuni-baloane-mot-bucuresti/', 'event', 'Decoratiuni Baloane Mot Bucuresti', 'Decoratiuni Baloane Mot Bucuresti', 'Decoratiuni Baloane Mot Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-mot-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-mot-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-mot-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-turta-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-turta-bucuresti', '/decoratiuni-baloane-turta-bucuresti/', 'event', 'Decoratiuni Baloane Turta Bucuresti', 'Decoratiuni Baloane Turta Bucuresti', 'Decoratiuni Baloane Turta Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-turta-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-turta-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-turta-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-nunta-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-nunta-bucuresti', '/decoratiuni-baloane-nunta-bucuresti/', 'event', 'Decoratiuni Baloane Nunta Bucuresti', 'Decoratiuni Baloane Nunta Bucuresti', 'Decoratiuni Baloane Nunta Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-nunta-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-nunta-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-nunta-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-8-martie-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-8-martie-bucuresti', '/decoratiuni-baloane-8-martie-bucuresti/', 'event', 'Decoratiuni Baloane 8 Martie Bucuresti', 'Decoratiuni Baloane 8 Martie Bucuresti', 'Decoratiuni Baloane 8 Martie Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-8-martie-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-8-martie-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-8-martie-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-cununie-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-cununie-bucuresti', '/decoratiuni-baloane-cununie-bucuresti/', 'event', 'Decoratiuni Baloane Cununie Bucuresti', 'Decoratiuni Baloane Cununie Bucuresti', 'Decoratiuni Baloane Cununie Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-cununie-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-cununie-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-cununie-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-majorat-bucuresti', '/decoratiuni-baloane-majorat-bucuresti/', 'event', 'Decoratiuni Baloane Majorat Bucuresti', 'Decoratiuni Baloane Majorat Bucuresti', 'Decoratiuni Baloane Majorat Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-majorat-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-majorat-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-majorat-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-aniversare-copii-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aniversare-copii-bucuresti', '/decoratiuni-baloane-aniversare-copii-bucuresti/', 'event', 'Decoratiuni Baloane Aniversare Copii Bucuresti', 'Decoratiuni Baloane Aniversare Copii Bucuresti', 'Decoratiuni Baloane Aniversare Copii Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-aniversare-copii-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-aniversare-copii-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-aniversare-copii-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-aniversare-adulti-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aniversare-adulti-bucuresti', '/decoratiuni-baloane-aniversare-adulti-bucuresti/', 'event', 'Decoratiuni Baloane Aniversare Adulti Bucuresti', 'Decoratiuni Baloane Aniversare Adulti Bucuresti', 'Decoratiuni Baloane Aniversare Adulti Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-aniversare-adulti-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-aniversare-adulti-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-aniversare-adulti-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-petrecere-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-petrecere-bucuresti', '/decoratiuni-baloane-petrecere-bucuresti/', 'event', 'Decoratiuni Baloane Petrecere Bucuresti', 'Decoratiuni Baloane Petrecere Bucuresti', 'Decoratiuni Baloane Petrecere Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-petrecere-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-petrecere-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-petrecere-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-corporate-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-corporate-bucuresti', '/decoratiuni-baloane-corporate-bucuresti/', 'event', 'Decoratiuni Baloane Corporate Bucuresti', 'Decoratiuni Baloane Corporate Bucuresti', 'Decoratiuni Baloane Corporate Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-corporate-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-corporate-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-corporate-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-deschidere-magazin-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-deschidere-magazin-bucuresti', '/decoratiuni-baloane-deschidere-magazin-bucuresti/', 'event', 'Decoratiuni Baloane Deschidere Magazin Bucuresti', 'Decoratiuni Baloane Deschidere Magazin Bucuresti', 'Decoratiuni Baloane Deschidere Magazin Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-deschidere-magazin-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-deschidere-magazin-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-deschidere-magazin-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-deschidere-restaurant-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-deschidere-restaurant-bucuresti', '/decoratiuni-baloane-deschidere-restaurant-bucuresti/', 'event', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-deschidere-restaurant-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-deschidere-restaurant-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-deschidere-restaurant-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-lansare-produs-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-lansare-produs-bucuresti', '/decoratiuni-baloane-lansare-produs-bucuresti/', 'event', 'Decoratiuni Baloane Lansare Produs Bucuresti', 'Decoratiuni Baloane Lansare Produs Bucuresti', 'Decoratiuni Baloane Lansare Produs Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-lansare-produs-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-lansare-produs-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-lansare-produs-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-showroom-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-showroom-bucuresti', '/decoratiuni-baloane-showroom-bucuresti/', 'event', 'Decoratiuni Baloane Showroom Bucuresti', 'Decoratiuni Baloane Showroom Bucuresti', 'Decoratiuni Baloane Showroom Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-showroom-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-showroom-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-showroom-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-gradinita-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-gradinita-bucuresti', '/decoratiuni-baloane-gradinita-bucuresti/', 'event', 'Decoratiuni Baloane Gradinita Bucuresti', 'Decoratiuni Baloane Gradinita Bucuresti', 'Decoratiuni Baloane Gradinita Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-gradinita-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-gradinita-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-gradinita-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-scoala-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-scoala-bucuresti', '/decoratiuni-baloane-scoala-bucuresti/', 'event', 'Decoratiuni Baloane Scoala Bucuresti', 'Decoratiuni Baloane Scoala Bucuresti', 'Decoratiuni Baloane Scoala Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-scoala-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-scoala-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-scoala-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-baby-shower-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-baby-shower-bucuresti', '/decoratiuni-baloane-baby-shower-bucuresti/', 'event', 'Decoratiuni Baloane Baby Shower Bucuresti', 'Decoratiuni Baloane Baby Shower Bucuresti', 'Decoratiuni Baloane Baby Shower Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-baby-shower-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-baby-shower-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-baby-shower-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-gender-reveal-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-gender-reveal-bucuresti', '/decoratiuni-baloane-gender-reveal-bucuresti/', 'event', 'Decoratiuni Baloane Gender Reveal Bucuresti', 'Decoratiuni Baloane Gender Reveal Bucuresti', 'Decoratiuni Baloane Gender Reveal Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-gender-reveal-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-gender-reveal-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-gender-reveal-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-craciun-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-craciun-bucuresti', '/decoratiuni-baloane-craciun-bucuresti/', 'event', 'Decoratiuni Baloane Craciun Bucuresti', 'Decoratiuni Baloane Craciun Bucuresti', 'Decoratiuni Baloane Craciun Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-craciun-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-craciun-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-craciun-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-revelion-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-revelion-bucuresti', '/decoratiuni-baloane-revelion-bucuresti/', 'event', 'Decoratiuni Baloane Revelion Bucuresti', 'Decoratiuni Baloane Revelion Bucuresti', 'Decoratiuni Baloane Revelion Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-revelion-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-revelion-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-revelion-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-paste-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-paste-bucuresti', '/decoratiuni-baloane-paste-bucuresti/', 'event', 'Decoratiuni Baloane Paste Bucuresti', 'Decoratiuni Baloane Paste Bucuresti', 'Decoratiuni Baloane Paste Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-paste-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-paste-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-paste-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-halloween-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-halloween-bucuresti', '/decoratiuni-baloane-halloween-bucuresti/', 'event', 'Decoratiuni Baloane Halloween Bucuresti', 'Decoratiuni Baloane Halloween Bucuresti', 'Decoratiuni Baloane Halloween Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-halloween-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-halloween-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-halloween-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-1-iunie-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-1-iunie-bucuresti', '/decoratiuni-baloane-1-iunie-bucuresti/', 'event', 'Decoratiuni Baloane 1 Iunie Bucuresti', 'Decoratiuni Baloane 1 Iunie Bucuresti', 'Decoratiuni Baloane 1 Iunie Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-1-iunie-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-1-iunie-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-1-iunie-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-absolvire-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-absolvire-bucuresti', '/decoratiuni-baloane-absolvire-bucuresti/', 'event', 'Decoratiuni Baloane Absolvire Bucuresti', 'Decoratiuni Baloane Absolvire Bucuresti', 'Decoratiuni Baloane Absolvire Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 7);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-absolvire-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-absolvire-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-absolvire-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-sector-1/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-1', '/decoratiuni-baloane-sector-1/', 'location', 'Decoratiuni Baloane Sector 1', 'Decoratiuni Baloane Sector 1', 'Decoratiuni Baloane Sector 1 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-sector-1?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-sector-1?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-sector-1?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-sector-2/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-2', '/decoratiuni-baloane-sector-2/', 'location', 'Decoratiuni Baloane Sector 2', 'Decoratiuni Baloane Sector 2', 'Decoratiuni Baloane Sector 2 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-sector-2?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-sector-2?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-sector-2?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-sector-3/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-3', '/decoratiuni-baloane-sector-3/', 'location', 'Decoratiuni Baloane Sector 3', 'Decoratiuni Baloane Sector 3', 'Decoratiuni Baloane Sector 3 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-sector-3?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-sector-3?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-sector-3?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-sector-4/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-4', '/decoratiuni-baloane-sector-4/', 'location', 'Decoratiuni Baloane Sector 4', 'Decoratiuni Baloane Sector 4', 'Decoratiuni Baloane Sector 4 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-sector-4?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-sector-4?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-sector-4?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-sector-5/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-5', '/decoratiuni-baloane-sector-5/', 'location', 'Decoratiuni Baloane Sector 5', 'Decoratiuni Baloane Sector 5', 'Decoratiuni Baloane Sector 5 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-sector-5?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-sector-5?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-sector-5?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-sector-6/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-6', '/decoratiuni-baloane-sector-6/', 'location', 'Decoratiuni Baloane Sector 6', 'Decoratiuni Baloane Sector 6', 'Decoratiuni Baloane Sector 6 - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-sector-6?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-sector-6?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-sector-6?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-aviatiei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aviatiei', '/decoratiuni-baloane-aviatiei/', 'location', 'Decoratiuni Baloane Aviatiei', 'Decoratiuni Baloane Aviatiei', 'Decoratiuni Baloane Aviatiei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-aviatiei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-aviatiei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-aviatiei?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-baneasa/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-baneasa', '/decoratiuni-baloane-baneasa/', 'location', 'Decoratiuni Baloane Baneasa', 'Decoratiuni Baloane Baneasa', 'Decoratiuni Baloane Baneasa - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-baneasa?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-baneasa?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-baneasa?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-domenii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-domenii', '/decoratiuni-baloane-domenii/', 'location', 'Decoratiuni Baloane Domenii', 'Decoratiuni Baloane Domenii', 'Decoratiuni Baloane Domenii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-domenii?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-domenii?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-domenii?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-herastrau/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-herastrau', '/decoratiuni-baloane-herastrau/', 'location', 'Decoratiuni Baloane Herastrau', 'Decoratiuni Baloane Herastrau', 'Decoratiuni Baloane Herastrau - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-herastrau?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-herastrau?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-herastrau?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-victoriei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-victoriei', '/decoratiuni-baloane-victoriei/', 'location', 'Decoratiuni Baloane Victoriei', 'Decoratiuni Baloane Victoriei', 'Decoratiuni Baloane Victoriei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-victoriei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-victoriei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-victoriei?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-colentina/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-colentina', '/decoratiuni-baloane-colentina/', 'location', 'Decoratiuni Baloane Colentina', 'Decoratiuni Baloane Colentina', 'Decoratiuni Baloane Colentina - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-colentina?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-colentina?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-colentina?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-obor/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-obor', '/decoratiuni-baloane-obor/', 'location', 'Decoratiuni Baloane Obor', 'Decoratiuni Baloane Obor', 'Decoratiuni Baloane Obor - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-obor?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-obor?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-obor?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-pantelimon/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-pantelimon', '/decoratiuni-baloane-pantelimon/', 'location', 'Decoratiuni Baloane Pantelimon', 'Decoratiuni Baloane Pantelimon', 'Decoratiuni Baloane Pantelimon - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-pantelimon?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-pantelimon?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-pantelimon?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-tei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-tei', '/decoratiuni-baloane-tei/', 'location', 'Decoratiuni Baloane Tei', 'Decoratiuni Baloane Tei', 'Decoratiuni Baloane Tei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-tei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-tei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-tei?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-stefan-cel-mare/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-stefan-cel-mare', '/decoratiuni-baloane-stefan-cel-mare/', 'location', 'Decoratiuni Baloane Stefan Cel Mare', 'Decoratiuni Baloane Stefan Cel Mare', 'Decoratiuni Baloane Stefan Cel Mare - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-stefan-cel-mare?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-stefan-cel-mare?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-stefan-cel-mare?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-dristor/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dristor', '/decoratiuni-baloane-dristor/', 'location', 'Decoratiuni Baloane Dristor', 'Decoratiuni Baloane Dristor', 'Decoratiuni Baloane Dristor - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-dristor?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-dristor?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-dristor?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-titan/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-titan', '/decoratiuni-baloane-titan/', 'location', 'Decoratiuni Baloane Titan', 'Decoratiuni Baloane Titan', 'Decoratiuni Baloane Titan - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-titan?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-titan?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-titan?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-vitan/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-vitan', '/decoratiuni-baloane-vitan/', 'location', 'Decoratiuni Baloane Vitan', 'Decoratiuni Baloane Vitan', 'Decoratiuni Baloane Vitan - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-vitan?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-vitan?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-vitan?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-unirii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-unirii', '/decoratiuni-baloane-unirii/', 'location', 'Decoratiuni Baloane Unirii', 'Decoratiuni Baloane Unirii', 'Decoratiuni Baloane Unirii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-unirii?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-unirii?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-unirii?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-dudesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dudesti', '/decoratiuni-baloane-dudesti/', 'location', 'Decoratiuni Baloane Dudesti', 'Decoratiuni Baloane Dudesti', 'Decoratiuni Baloane Dudesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-dudesti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-dudesti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-dudesti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-berceni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-berceni', '/decoratiuni-baloane-berceni/', 'location', 'Decoratiuni Baloane Berceni', 'Decoratiuni Baloane Berceni', 'Decoratiuni Baloane Berceni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-berceni?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-berceni?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-berceni?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-tineretului/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-tineretului', '/decoratiuni-baloane-tineretului/', 'location', 'Decoratiuni Baloane Tineretului', 'Decoratiuni Baloane Tineretului', 'Decoratiuni Baloane Tineretului - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-tineretului?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-tineretului?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-tineretului?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-piata-sudului/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-piata-sudului', '/decoratiuni-baloane-piata-sudului/', 'location', 'Decoratiuni Baloane Piata Sudului', 'Decoratiuni Baloane Piata Sudului', 'Decoratiuni Baloane Piata Sudului - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-piata-sudului?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-piata-sudului?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-piata-sudului?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-aparatorii-patriei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aparatorii-patriei', '/decoratiuni-baloane-aparatorii-patriei/', 'location', 'Decoratiuni Baloane Aparatorii Patriei', 'Decoratiuni Baloane Aparatorii Patriei', 'Decoratiuni Baloane Aparatorii Patriei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-aparatorii-patriei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-aparatorii-patriei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-aparatorii-patriei?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-oltenitei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-oltenitei', '/decoratiuni-baloane-oltenitei/', 'location', 'Decoratiuni Baloane Oltenitei', 'Decoratiuni Baloane Oltenitei', 'Decoratiuni Baloane Oltenitei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-oltenitei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-oltenitei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-oltenitei?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-rahova/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-rahova', '/decoratiuni-baloane-rahova/', 'location', 'Decoratiuni Baloane Rahova', 'Decoratiuni Baloane Rahova', 'Decoratiuni Baloane Rahova - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-rahova?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-rahova?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-rahova?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-cotroceni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-cotroceni', '/decoratiuni-baloane-cotroceni/', 'location', 'Decoratiuni Baloane Cotroceni', 'Decoratiuni Baloane Cotroceni', 'Decoratiuni Baloane Cotroceni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-cotroceni?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-cotroceni?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-cotroceni?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-13-septembrie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-13-septembrie', '/decoratiuni-baloane-13-septembrie/', 'location', 'Decoratiuni Baloane 13 Septembrie', 'Decoratiuni Baloane 13 Septembrie', 'Decoratiuni Baloane 13 Septembrie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-13-septembrie?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-13-septembrie?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-13-septembrie?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-ferentari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-ferentari', '/decoratiuni-baloane-ferentari/', 'location', 'Decoratiuni Baloane Ferentari', 'Decoratiuni Baloane Ferentari', 'Decoratiuni Baloane Ferentari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-ferentari?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-ferentari?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-ferentari?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-sebastian/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sebastian', '/decoratiuni-baloane-sebastian/', 'location', 'Decoratiuni Baloane Sebastian', 'Decoratiuni Baloane Sebastian', 'Decoratiuni Baloane Sebastian - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-sebastian?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-sebastian?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-sebastian?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-drumul-taberei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-drumul-taberei', '/decoratiuni-baloane-drumul-taberei/', 'location', 'Decoratiuni Baloane Drumul Taberei', 'Decoratiuni Baloane Drumul Taberei', 'Decoratiuni Baloane Drumul Taberei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-drumul-taberei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-drumul-taberei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-drumul-taberei?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-militari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-militari', '/decoratiuni-baloane-militari/', 'location', 'Decoratiuni Baloane Militari', 'Decoratiuni Baloane Militari', 'Decoratiuni Baloane Militari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-militari?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-militari?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-militari?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-crangasi/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-crangasi', '/decoratiuni-baloane-crangasi/', 'location', 'Decoratiuni Baloane Crangasi', 'Decoratiuni Baloane Crangasi', 'Decoratiuni Baloane Crangasi - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-crangasi?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-crangasi?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-crangasi?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-giulesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-giulesti', '/decoratiuni-baloane-giulesti/', 'location', 'Decoratiuni Baloane Giulesti', 'Decoratiuni Baloane Giulesti', 'Decoratiuni Baloane Giulesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-giulesti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-giulesti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-giulesti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-grozavesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-grozavesti', '/decoratiuni-baloane-grozavesti/', 'location', 'Decoratiuni Baloane Grozavesti', 'Decoratiuni Baloane Grozavesti', 'Decoratiuni Baloane Grozavesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-grozavesti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-grozavesti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-grozavesti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-ilfov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-ilfov', '/decoratiuni-baloane-ilfov/', 'location', 'Decoratiuni Baloane Ilfov', 'Decoratiuni Baloane Ilfov', 'Decoratiuni Baloane Ilfov - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-ilfov?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-ilfov?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-ilfov?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-voluntari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-voluntari', '/decoratiuni-baloane-voluntari/', 'location', 'Decoratiuni Baloane Voluntari', 'Decoratiuni Baloane Voluntari', 'Decoratiuni Baloane Voluntari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-voluntari?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-voluntari?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-voluntari?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-pipera/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-pipera', '/decoratiuni-baloane-pipera/', 'location', 'Decoratiuni Baloane Pipera', 'Decoratiuni Baloane Pipera', 'Decoratiuni Baloane Pipera - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-pipera?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-pipera?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-pipera?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-otopeni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-otopeni', '/decoratiuni-baloane-otopeni/', 'location', 'Decoratiuni Baloane Otopeni', 'Decoratiuni Baloane Otopeni', 'Decoratiuni Baloane Otopeni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-otopeni?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-otopeni?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-otopeni?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-tunari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-tunari', '/decoratiuni-baloane-tunari/', 'location', 'Decoratiuni Baloane Tunari', 'Decoratiuni Baloane Tunari', 'Decoratiuni Baloane Tunari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-tunari?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-tunari?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-tunari?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-corbeanca/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-corbeanca', '/decoratiuni-baloane-corbeanca/', 'location', 'Decoratiuni Baloane Corbeanca', 'Decoratiuni Baloane Corbeanca', 'Decoratiuni Baloane Corbeanca - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-corbeanca?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-corbeanca?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-corbeanca?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-balotesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-balotesti', '/decoratiuni-baloane-balotesti/', 'location', 'Decoratiuni Baloane Balotesti', 'Decoratiuni Baloane Balotesti', 'Decoratiuni Baloane Balotesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-balotesti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-balotesti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-balotesti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-mogosoaia/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-mogosoaia', '/decoratiuni-baloane-mogosoaia/', 'location', 'Decoratiuni Baloane Mogosoaia', 'Decoratiuni Baloane Mogosoaia', 'Decoratiuni Baloane Mogosoaia - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-mogosoaia?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-mogosoaia?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-mogosoaia?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-chitila/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-chitila', '/decoratiuni-baloane-chitila/', 'location', 'Decoratiuni Baloane Chitila', 'Decoratiuni Baloane Chitila', 'Decoratiuni Baloane Chitila - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-chitila?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-chitila?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-chitila?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-chiajna/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-chiajna', '/decoratiuni-baloane-chiajna/', 'location', 'Decoratiuni Baloane Chiajna', 'Decoratiuni Baloane Chiajna', 'Decoratiuni Baloane Chiajna - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-chiajna?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-chiajna?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-chiajna?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-domnesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-domnesti', '/decoratiuni-baloane-domnesti/', 'location', 'Decoratiuni Baloane Domnesti', 'Decoratiuni Baloane Domnesti', 'Decoratiuni Baloane Domnesti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-domnesti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-domnesti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-domnesti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-bragadiru/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-bragadiru', '/decoratiuni-baloane-bragadiru/', 'location', 'Decoratiuni Baloane Bragadiru', 'Decoratiuni Baloane Bragadiru', 'Decoratiuni Baloane Bragadiru - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-bragadiru?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-bragadiru?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-bragadiru?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-magurele/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-magurele', '/decoratiuni-baloane-magurele/', 'location', 'Decoratiuni Baloane Magurele', 'Decoratiuni Baloane Magurele', 'Decoratiuni Baloane Magurele - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-magurele?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-magurele?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-magurele?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-popesti-leordeni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-popesti-leordeni', '/decoratiuni-baloane-popesti-leordeni/', 'location', 'Decoratiuni Baloane Popesti Leordeni', 'Decoratiuni Baloane Popesti Leordeni', 'Decoratiuni Baloane Popesti Leordeni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-popesti-leordeni?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-popesti-leordeni?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-popesti-leordeni?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-berceni-ilfov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-berceni-ilfov', '/decoratiuni-baloane-berceni-ilfov/', 'location', 'Decoratiuni Baloane Berceni Ilfov', 'Decoratiuni Baloane Berceni Ilfov', 'Decoratiuni Baloane Berceni Ilfov - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-berceni-ilfov?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-berceni-ilfov?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-berceni-ilfov?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-pantelimon-ilfov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-pantelimon-ilfov', '/decoratiuni-baloane-pantelimon-ilfov/', 'location', 'Decoratiuni Baloane Pantelimon Ilfov', 'Decoratiuni Baloane Pantelimon Ilfov', 'Decoratiuni Baloane Pantelimon Ilfov - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-pantelimon-ilfov?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-pantelimon-ilfov?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-pantelimon-ilfov?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-cernica/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-cernica', '/decoratiuni-baloane-cernica/', 'location', 'Decoratiuni Baloane Cernica', 'Decoratiuni Baloane Cernica', 'Decoratiuni Baloane Cernica - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-cernica?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-cernica?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-cernica?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-afumati/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-afumati', '/decoratiuni-baloane-afumati/', 'location', 'Decoratiuni Baloane Afumati', 'Decoratiuni Baloane Afumati', 'Decoratiuni Baloane Afumati - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-afumati?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-afumati?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-afumati?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-stefanestii-de-jos/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-stefanestii-de-jos', '/decoratiuni-baloane-stefanestii-de-jos/', 'location', 'Decoratiuni Baloane Stefanestii De Jos', 'Decoratiuni Baloane Stefanestii De Jos', 'Decoratiuni Baloane Stefanestii De Jos - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-stefanestii-de-jos?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-stefanestii-de-jos?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-stefanestii-de-jos?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-dascalu/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dascalu', '/decoratiuni-baloane-dascalu/', 'location', 'Decoratiuni Baloane Dascalu', 'Decoratiuni Baloane Dascalu', 'Decoratiuni Baloane Dascalu - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-dascalu?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-dascalu?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-dascalu?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-snagov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-snagov', '/decoratiuni-baloane-snagov/', 'location', 'Decoratiuni Baloane Snagov', 'Decoratiuni Baloane Snagov', 'Decoratiuni Baloane Snagov - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-snagov?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-snagov?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-snagov?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-clinceni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-clinceni', '/decoratiuni-baloane-clinceni/', 'location', 'Decoratiuni Baloane Clinceni', 'Decoratiuni Baloane Clinceni', 'Decoratiuni Baloane Clinceni - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-clinceni?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-clinceni?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-clinceni?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-dragomiresti-vale/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dragomiresti-vale', '/decoratiuni-baloane-dragomiresti-vale/', 'location', 'Decoratiuni Baloane Dragomiresti Vale', 'Decoratiuni Baloane Dragomiresti Vale', 'Decoratiuni Baloane Dragomiresti Vale - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-dragomiresti-vale?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-dragomiresti-vale?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-dragomiresti-vale?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-jilava/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-jilava', '/decoratiuni-baloane-jilava/', 'location', 'Decoratiuni Baloane Jilava', 'Decoratiuni Baloane Jilava', 'Decoratiuni Baloane Jilava - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-jilava?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-jilava?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-jilava?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-1-decembrie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-1-decembrie', '/decoratiuni-baloane-1-decembrie/', 'location', 'Decoratiuni Baloane 1 Decembrie', 'Decoratiuni Baloane 1 Decembrie', 'Decoratiuni Baloane 1 Decembrie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 8);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-1-decembrie?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-1-decembrie?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-1-decembrie?', 'A3', 3);

    -- PAGE: /arcada-baloane-botez-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-botez-bucuresti', '/arcada-baloane-botez-bucuresti/', 'satellite', 'Arcada Baloane Botez Bucuresti', 'Arcada Baloane Botez Bucuresti', 'Arcada Baloane Botez Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru arcada-baloane-botez-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru arcada-baloane-botez-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru arcada-baloane-botez-bucuresti?', 'A3', 3);

    -- PAGE: /arcada-baloane-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-majorat-bucuresti', '/arcada-baloane-majorat-bucuresti/', 'satellite', 'Arcada Baloane Majorat Bucuresti', 'Arcada Baloane Majorat Bucuresti', 'Arcada Baloane Majorat Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru arcada-baloane-majorat-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru arcada-baloane-majorat-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru arcada-baloane-majorat-bucuresti?', 'A3', 3);

    -- PAGE: /arcada-baloane-nunta-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-nunta-bucuresti', '/arcada-baloane-nunta-bucuresti/', 'satellite', 'Arcada Baloane Nunta Bucuresti', 'Arcada Baloane Nunta Bucuresti', 'Arcada Baloane Nunta Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru arcada-baloane-nunta-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru arcada-baloane-nunta-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru arcada-baloane-nunta-bucuresti?', 'A3', 3);

    -- PAGE: /panou-foto-baloane-botez-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('panou-foto-baloane-botez-bucuresti', '/panou-foto-baloane-botez-bucuresti/', 'satellite', 'Panou Foto Baloane Botez Bucuresti', 'Panou Foto Baloane Botez Bucuresti', 'Panou Foto Baloane Botez Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru panou-foto-baloane-botez-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru panou-foto-baloane-botez-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru panou-foto-baloane-botez-bucuresti?', 'A3', 3);

    -- PAGE: /panou-foto-baloane-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('panou-foto-baloane-majorat-bucuresti', '/panou-foto-baloane-majorat-bucuresti/', 'satellite', 'Panou Foto Baloane Majorat Bucuresti', 'Panou Foto Baloane Majorat Bucuresti', 'Panou Foto Baloane Majorat Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru panou-foto-baloane-majorat-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru panou-foto-baloane-majorat-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru panou-foto-baloane-majorat-bucuresti?', 'A3', 3);

    -- PAGE: /baloane-heliu-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-majorat-bucuresti', '/baloane-heliu-majorat-bucuresti/', 'satellite', 'Baloane Heliu Majorat Bucuresti', 'Baloane Heliu Majorat Bucuresti', 'Baloane Heliu Majorat Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru baloane-heliu-majorat-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru baloane-heliu-majorat-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru baloane-heliu-majorat-bucuresti?', 'A3', 3);

    -- PAGE: /baloane-heliu-aniversare-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-aniversare-bucuresti', '/baloane-heliu-aniversare-bucuresti/', 'satellite', 'Baloane Heliu Aniversare Bucuresti', 'Baloane Heliu Aniversare Bucuresti', 'Baloane Heliu Aniversare Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru baloane-heliu-aniversare-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru baloane-heliu-aniversare-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru baloane-heliu-aniversare-bucuresti?', 'A3', 3);

    -- PAGE: /buchete-baloane-aniversare-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('buchete-baloane-aniversare-bucuresti', '/buchete-baloane-aniversare-bucuresti/', 'satellite', 'Buchete Baloane Aniversare Bucuresti', 'Buchete Baloane Aniversare Bucuresti', 'Buchete Baloane Aniversare Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru buchete-baloane-aniversare-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru buchete-baloane-aniversare-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru buchete-baloane-aniversare-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-roz-auriu-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-roz-auriu-bucuresti', '/decoratiuni-baloane-roz-auriu-bucuresti/', 'satellite', 'Decoratiuni Baloane Roz Auriu Bucuresti', 'Decoratiuni Baloane Roz Auriu Bucuresti', 'Decoratiuni Baloane Roz Auriu Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-roz-auriu-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-roz-auriu-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-roz-auriu-bucuresti?', 'A3', 3);

    -- PAGE: /decoratiuni-baloane-alb-auriu-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-alb-auriu-bucuresti', '/decoratiuni-baloane-alb-auriu-bucuresti/', 'satellite', 'Decoratiuni Baloane Alb Auriu Bucuresti', 'Decoratiuni Baloane Alb Auriu Bucuresti', 'Decoratiuni Baloane Alb Auriu Bucuresti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 6);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru decoratiuni-baloane-alb-auriu-bucuresti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru decoratiuni-baloane-alb-auriu-bucuresti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru decoratiuni-baloane-alb-auriu-bucuresti?', 'A3', 3);

    -- PAGE: /blog/cat-costa-decoratiunile-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcat-costa-decoratiunile-cu-baloane', '/blog/cat-costa-decoratiunile-cu-baloane/', 'guide', 'Blogcat Costa Decoratiunile Cu Baloane', 'Blogcat Costa Decoratiunile Cu Baloane', 'Blogcat Costa Decoratiunile Cu Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcat-costa-decoratiunile-cu-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcat-costa-decoratiunile-cu-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcat-costa-decoratiunile-cu-baloane?', 'A3', 3);

    -- PAGE: /blog/cat-costa-o-arcada-de-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcat-costa-o-arcada-de-baloane', '/blog/cat-costa-o-arcada-de-baloane/', 'guide', 'Blogcat Costa O Arcada De Baloane', 'Blogcat Costa O Arcada De Baloane', 'Blogcat Costa O Arcada De Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcat-costa-o-arcada-de-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcat-costa-o-arcada-de-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcat-costa-o-arcada-de-baloane?', 'A3', 3);

    -- PAGE: /blog/cat-costa-baloanele-cu-heliu/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcat-costa-baloanele-cu-heliu', '/blog/cat-costa-baloanele-cu-heliu/', 'guide', 'Blogcat Costa Baloanele Cu Heliu', 'Blogcat Costa Baloanele Cu Heliu', 'Blogcat Costa Baloanele Cu Heliu - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcat-costa-baloanele-cu-heliu?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcat-costa-baloanele-cu-heliu?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcat-costa-baloanele-cu-heliu?', 'A3', 3);

    -- PAGE: /blog/cat-costa-un-panou-foto-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcat-costa-un-panou-foto-cu-baloane', '/blog/cat-costa-un-panou-foto-cu-baloane/', 'guide', 'Blogcat Costa Un Panou Foto Cu Baloane', 'Blogcat Costa Un Panou Foto Cu Baloane', 'Blogcat Costa Un Panou Foto Cu Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcat-costa-un-panou-foto-cu-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcat-costa-un-panou-foto-cu-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcat-costa-un-panou-foto-cu-baloane?', 'A3', 3);

    -- PAGE: /blog/cat-costa-un-decor-de-baloane-pentru-botez/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcat-costa-un-decor-de-baloane-pentru-botez', '/blog/cat-costa-un-decor-de-baloane-pentru-botez/', 'guide', 'Blogcat Costa Un Decor De Baloane Pentru Botez', 'Blogcat Costa Un Decor De Baloane Pentru Botez', 'Blogcat Costa Un Decor De Baloane Pentru Botez - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcat-costa-un-decor-de-baloane-pentru-botez?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcat-costa-un-decor-de-baloane-pentru-botez?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcat-costa-un-decor-de-baloane-pentru-botez?', 'A3', 3);

    -- PAGE: /blog/cat-costa-un-decor-de-baloane-pentru-nunta/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcat-costa-un-decor-de-baloane-pentru-nunta', '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/', 'guide', 'Blogcat Costa Un Decor De Baloane Pentru Nunta', 'Blogcat Costa Un Decor De Baloane Pentru Nunta', 'Blogcat Costa Un Decor De Baloane Pentru Nunta - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcat-costa-un-decor-de-baloane-pentru-nunta?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcat-costa-un-decor-de-baloane-pentru-nunta?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcat-costa-un-decor-de-baloane-pentru-nunta?', 'A3', 3);

    -- PAGE: /blog/ce-include-un-pachet-decor-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogce-include-un-pachet-decor-baloane', '/blog/ce-include-un-pachet-decor-baloane/', 'guide', 'Blogce Include Un Pachet Decor Baloane', 'Blogce Include Un Pachet Decor Baloane', 'Blogce Include Un Pachet Decor Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogce-include-un-pachet-decor-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogce-include-un-pachet-decor-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogce-include-un-pachet-decor-baloane?', 'A3', 3);

    -- PAGE: /blog/cum-alegi-pachetul-de-decoratiuni-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcum-alegi-pachetul-de-decoratiuni-baloane', '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/', 'guide', 'Blogcum Alegi Pachetul De Decoratiuni Baloane', 'Blogcum Alegi Pachetul De Decoratiuni Baloane', 'Blogcum Alegi Pachetul De Decoratiuni Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcum-alegi-pachetul-de-decoratiuni-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcum-alegi-pachetul-de-decoratiuni-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcum-alegi-pachetul-de-decoratiuni-baloane?', 'A3', 3);

    -- PAGE: /blog/cum-alegi-arcada-de-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcum-alegi-arcada-de-baloane', '/blog/cum-alegi-arcada-de-baloane/', 'guide', 'Blogcum Alegi Arcada De Baloane', 'Blogcum Alegi Arcada De Baloane', 'Blogcum Alegi Arcada De Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcum-alegi-arcada-de-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcum-alegi-arcada-de-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcum-alegi-arcada-de-baloane?', 'A3', 3);

    -- PAGE: /blog/arcada-baloane-organica-sau-clasica/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogarcada-baloane-organica-sau-clasica', '/blog/arcada-baloane-organica-sau-clasica/', 'guide', 'Blogarcada Baloane Organica Sau Clasica', 'Blogarcada Baloane Organica Sau Clasica', 'Blogarcada Baloane Organica Sau Clasica - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogarcada-baloane-organica-sau-clasica?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogarcada-baloane-organica-sau-clasica?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogarcada-baloane-organica-sau-clasica?', 'A3', 3);

    -- PAGE: /blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane', '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/', 'guide', 'Blogce Dimensiune Trebuie Sa Aiba O Arcada De Baloane', 'Blogce Dimensiune Trebuie Sa Aiba O Arcada De Baloane', 'Blogce Dimensiune Trebuie Sa Aiba O Arcada De Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane?', 'A3', 3);

    -- PAGE: /blog/unde-se-poate-monta-o-arcada-de-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogunde-se-poate-monta-o-arcada-de-baloane', '/blog/unde-se-poate-monta-o-arcada-de-baloane/', 'guide', 'Blogunde Se Poate Monta O Arcada De Baloane', 'Blogunde Se Poate Monta O Arcada De Baloane', 'Blogunde Se Poate Monta O Arcada De Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogunde-se-poate-monta-o-arcada-de-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogunde-se-poate-monta-o-arcada-de-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogunde-se-poate-monta-o-arcada-de-baloane?', 'A3', 3);

    -- PAGE: /blog/cat-rezista-o-arcada-de-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcat-rezista-o-arcada-de-baloane', '/blog/cat-rezista-o-arcada-de-baloane/', 'guide', 'Blogcat Rezista O Arcada De Baloane', 'Blogcat Rezista O Arcada De Baloane', 'Blogcat Rezista O Arcada De Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcat-rezista-o-arcada-de-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcat-rezista-o-arcada-de-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcat-rezista-o-arcada-de-baloane?', 'A3', 3);

    -- PAGE: /blog/idei-arcada-baloane-pentru-evenimente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-arcada-baloane-pentru-evenimente', '/blog/idei-arcada-baloane-pentru-evenimente/', 'guide', 'Blogidei Arcada Baloane Pentru Evenimente', 'Blogidei Arcada Baloane Pentru Evenimente', 'Blogidei Arcada Baloane Pentru Evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-arcada-baloane-pentru-evenimente?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-arcada-baloane-pentru-evenimente?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-arcada-baloane-pentru-evenimente?', 'A3', 3);

    -- PAGE: /blog/baloane-heliu-cat-rezista/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogbaloane-heliu-cat-rezista', '/blog/baloane-heliu-cat-rezista/', 'guide', 'Blogbaloane Heliu Cat Rezista', 'Blogbaloane Heliu Cat Rezista', 'Blogbaloane Heliu Cat Rezista - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogbaloane-heliu-cat-rezista?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogbaloane-heliu-cat-rezista?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogbaloane-heliu-cat-rezista?', 'A3', 3);

    -- PAGE: /blog/baloane-heliu-latex-sau-folie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogbaloane-heliu-latex-sau-folie', '/blog/baloane-heliu-latex-sau-folie/', 'guide', 'Blogbaloane Heliu Latex Sau Folie', 'Blogbaloane Heliu Latex Sau Folie', 'Blogbaloane Heliu Latex Sau Folie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogbaloane-heliu-latex-sau-folie?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogbaloane-heliu-latex-sau-folie?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogbaloane-heliu-latex-sau-folie?', 'A3', 3);

    -- PAGE: /blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcate-baloane-cu-heliu-sunt-necesare-pentru-o-camera', '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/', 'guide', 'Blogcate Baloane Cu Heliu Sunt Necesare Pentru O Camera', 'Blogcate Baloane Cu Heliu Sunt Necesare Pentru O Camera', 'Blogcate Baloane Cu Heliu Sunt Necesare Pentru O Camera - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcate-baloane-cu-heliu-sunt-necesare-pentru-o-camera?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcate-baloane-cu-heliu-sunt-necesare-pentru-o-camera?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcate-baloane-cu-heliu-sunt-necesare-pentru-o-camera?', 'A3', 3);

    -- PAGE: /blog/cum-se-transporta-baloanele-cu-heliu/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcum-se-transporta-baloanele-cu-heliu', '/blog/cum-se-transporta-baloanele-cu-heliu/', 'guide', 'Blogcum Se Transporta Baloanele Cu Heliu', 'Blogcum Se Transporta Baloanele Cu Heliu', 'Blogcum Se Transporta Baloanele Cu Heliu - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcum-se-transporta-baloanele-cu-heliu?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcum-se-transporta-baloanele-cu-heliu?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcum-se-transporta-baloanele-cu-heliu?', 'A3', 3);

    -- PAGE: /blog/baloane-cu-heliu-pentru-copii-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogbaloane-cu-heliu-pentru-copii-idei', '/blog/baloane-cu-heliu-pentru-copii-idei/', 'guide', 'Blogbaloane Cu Heliu Pentru Copii Idei', 'Blogbaloane Cu Heliu Pentru Copii Idei', 'Blogbaloane Cu Heliu Pentru Copii Idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogbaloane-cu-heliu-pentru-copii-idei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogbaloane-cu-heliu-pentru-copii-idei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogbaloane-cu-heliu-pentru-copii-idei?', 'A3', 3);

    -- PAGE: /blog/baloane-cu-heliu-pentru-majorat-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogbaloane-cu-heliu-pentru-majorat-idei', '/blog/baloane-cu-heliu-pentru-majorat-idei/', 'guide', 'Blogbaloane Cu Heliu Pentru Majorat Idei', 'Blogbaloane Cu Heliu Pentru Majorat Idei', 'Blogbaloane Cu Heliu Pentru Majorat Idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogbaloane-cu-heliu-pentru-majorat-idei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogbaloane-cu-heliu-pentru-majorat-idei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogbaloane-cu-heliu-pentru-majorat-idei?', 'A3', 3);

    -- PAGE: /blog/idei-decor-baloane-botez/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-decor-baloane-botez', '/blog/idei-decor-baloane-botez/', 'guide', 'Blogidei Decor Baloane Botez', 'Blogidei Decor Baloane Botez', 'Blogidei Decor Baloane Botez - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-decor-baloane-botez?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-decor-baloane-botez?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-decor-baloane-botez?', 'A3', 3);

    -- PAGE: /blog/idei-decor-baloane-mot-si-turta/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-decor-baloane-mot-si-turta', '/blog/idei-decor-baloane-mot-si-turta/', 'guide', 'Blogidei Decor Baloane Mot Si Turta', 'Blogidei Decor Baloane Mot Si Turta', 'Blogidei Decor Baloane Mot Si Turta - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-decor-baloane-mot-si-turta?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-decor-baloane-mot-si-turta?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-decor-baloane-mot-si-turta?', 'A3', 3);

    -- PAGE: /blog/idei-decor-baloane-nunta/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-decor-baloane-nunta', '/blog/idei-decor-baloane-nunta/', 'guide', 'Blogidei Decor Baloane Nunta', 'Blogidei Decor Baloane Nunta', 'Blogidei Decor Baloane Nunta - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-decor-baloane-nunta?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-decor-baloane-nunta?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-decor-baloane-nunta?', 'A3', 3);

    -- PAGE: /blog/idei-decor-baloane-cununie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-decor-baloane-cununie', '/blog/idei-decor-baloane-cununie/', 'guide', 'Blogidei Decor Baloane Cununie', 'Blogidei Decor Baloane Cununie', 'Blogidei Decor Baloane Cununie - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-decor-baloane-cununie?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-decor-baloane-cununie?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-decor-baloane-cununie?', 'A3', 3);

    -- PAGE: /blog/idei-decor-baloane-majorat/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-decor-baloane-majorat', '/blog/idei-decor-baloane-majorat/', 'guide', 'Blogidei Decor Baloane Majorat', 'Blogidei Decor Baloane Majorat', 'Blogidei Decor Baloane Majorat - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-decor-baloane-majorat?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-decor-baloane-majorat?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-decor-baloane-majorat?', 'A3', 3);

    -- PAGE: /blog/idei-decor-baloane-aniversare-copii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-decor-baloane-aniversare-copii', '/blog/idei-decor-baloane-aniversare-copii/', 'guide', 'Blogidei Decor Baloane Aniversare Copii', 'Blogidei Decor Baloane Aniversare Copii', 'Blogidei Decor Baloane Aniversare Copii - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-decor-baloane-aniversare-copii?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-decor-baloane-aniversare-copii?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-decor-baloane-aniversare-copii?', 'A3', 3);

    -- PAGE: /blog/idei-decor-baloane-aniversare-adulti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-decor-baloane-aniversare-adulti', '/blog/idei-decor-baloane-aniversare-adulti/', 'guide', 'Blogidei Decor Baloane Aniversare Adulti', 'Blogidei Decor Baloane Aniversare Adulti', 'Blogidei Decor Baloane Aniversare Adulti - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-decor-baloane-aniversare-adulti?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-decor-baloane-aniversare-adulti?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-decor-baloane-aniversare-adulti?', 'A3', 3);

    -- PAGE: /blog/idei-decor-baloane-baby-shower/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-decor-baloane-baby-shower', '/blog/idei-decor-baloane-baby-shower/', 'guide', 'Blogidei Decor Baloane Baby Shower', 'Blogidei Decor Baloane Baby Shower', 'Blogidei Decor Baloane Baby Shower - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-decor-baloane-baby-shower?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-decor-baloane-baby-shower?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-decor-baloane-baby-shower?', 'A3', 3);

    -- PAGE: /blog/idei-decor-baloane-gender-reveal/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-decor-baloane-gender-reveal', '/blog/idei-decor-baloane-gender-reveal/', 'guide', 'Blogidei Decor Baloane Gender Reveal', 'Blogidei Decor Baloane Gender Reveal', 'Blogidei Decor Baloane Gender Reveal - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-decor-baloane-gender-reveal?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-decor-baloane-gender-reveal?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-decor-baloane-gender-reveal?', 'A3', 3);

    -- PAGE: /blog/idei-decor-baloane-corporate/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogidei-decor-baloane-corporate', '/blog/idei-decor-baloane-corporate/', 'guide', 'Blogidei Decor Baloane Corporate', 'Blogidei Decor Baloane Corporate', 'Blogidei Decor Baloane Corporate - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogidei-decor-baloane-corporate?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogidei-decor-baloane-corporate?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogidei-decor-baloane-corporate?', 'A3', 3);

    -- PAGE: /blog/cum-alegi-culorile-pentru-decorul-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcum-alegi-culorile-pentru-decorul-cu-baloane', '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/', 'guide', 'Blogcum Alegi Culorile Pentru Decorul Cu Baloane', 'Blogcum Alegi Culorile Pentru Decorul Cu Baloane', 'Blogcum Alegi Culorile Pentru Decorul Cu Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcum-alegi-culorile-pentru-decorul-cu-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcum-alegi-culorile-pentru-decorul-cu-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcum-alegi-culorile-pentru-decorul-cu-baloane?', 'A3', 3);

    -- PAGE: /blog/decor-baloane-roz-auriu-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogdecor-baloane-roz-auriu-idei', '/blog/decor-baloane-roz-auriu-idei/', 'guide', 'Blogdecor Baloane Roz Auriu Idei', 'Blogdecor Baloane Roz Auriu Idei', 'Blogdecor Baloane Roz Auriu Idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogdecor-baloane-roz-auriu-idei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogdecor-baloane-roz-auriu-idei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogdecor-baloane-roz-auriu-idei?', 'A3', 3);

    -- PAGE: /blog/decor-baloane-alb-auriu-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogdecor-baloane-alb-auriu-idei', '/blog/decor-baloane-alb-auriu-idei/', 'guide', 'Blogdecor Baloane Alb Auriu Idei', 'Blogdecor Baloane Alb Auriu Idei', 'Blogdecor Baloane Alb Auriu Idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogdecor-baloane-alb-auriu-idei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogdecor-baloane-alb-auriu-idei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogdecor-baloane-alb-auriu-idei?', 'A3', 3);

    -- PAGE: /blog/decor-baloane-pastel-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogdecor-baloane-pastel-idei', '/blog/decor-baloane-pastel-idei/', 'guide', 'Blogdecor Baloane Pastel Idei', 'Blogdecor Baloane Pastel Idei', 'Blogdecor Baloane Pastel Idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogdecor-baloane-pastel-idei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogdecor-baloane-pastel-idei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogdecor-baloane-pastel-idei?', 'A3', 3);

    -- PAGE: /blog/decor-baloane-luxury-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogdecor-baloane-luxury-idei', '/blog/decor-baloane-luxury-idei/', 'guide', 'Blogdecor Baloane Luxury Idei', 'Blogdecor Baloane Luxury Idei', 'Blogdecor Baloane Luxury Idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogdecor-baloane-luxury-idei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogdecor-baloane-luxury-idei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogdecor-baloane-luxury-idei?', 'A3', 3);

    -- PAGE: /blog/decor-baloane-minimalist-sau-spectaculos/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogdecor-baloane-minimalist-sau-spectaculos', '/blog/decor-baloane-minimalist-sau-spectaculos/', 'guide', 'Blogdecor Baloane Minimalist Sau Spectaculos', 'Blogdecor Baloane Minimalist Sau Spectaculos', 'Blogdecor Baloane Minimalist Sau Spectaculos - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogdecor-baloane-minimalist-sau-spectaculos?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogdecor-baloane-minimalist-sau-spectaculos?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogdecor-baloane-minimalist-sau-spectaculos?', 'A3', 3);

    -- PAGE: /blog/cum-comanzi-decoratiuni-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcum-comanzi-decoratiuni-cu-baloane', '/blog/cum-comanzi-decoratiuni-cu-baloane/', 'guide', 'Blogcum Comanzi Decoratiuni Cu Baloane', 'Blogcum Comanzi Decoratiuni Cu Baloane', 'Blogcum Comanzi Decoratiuni Cu Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcum-comanzi-decoratiuni-cu-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcum-comanzi-decoratiuni-cu-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcum-comanzi-decoratiuni-cu-baloane?', 'A3', 3);

    -- PAGE: /blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcu-cat-timp-inainte-se-comanda-decorul-cu-baloane', '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/', 'guide', 'Blogcu Cat Timp Inainte Se Comanda Decorul Cu Baloane', 'Blogcu Cat Timp Inainte Se Comanda Decorul Cu Baloane', 'Blogcu Cat Timp Inainte Se Comanda Decorul Cu Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcu-cat-timp-inainte-se-comanda-decorul-cu-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcu-cat-timp-inainte-se-comanda-decorul-cu-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcu-cat-timp-inainte-se-comanda-decorul-cu-baloane?', 'A3', 3);

    -- PAGE: /blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogce-informatii-trebuie-sa-trimiti-pentru-o-oferta', '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/', 'guide', 'Blogce Informatii Trebuie Sa Trimiti Pentru O Oferta', 'Blogce Informatii Trebuie Sa Trimiti Pentru O Oferta', 'Blogce Informatii Trebuie Sa Trimiti Pentru O Oferta - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogce-informatii-trebuie-sa-trimiti-pentru-o-oferta?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogce-informatii-trebuie-sa-trimiti-pentru-o-oferta?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogce-informatii-trebuie-sa-trimiti-pentru-o-oferta?', 'A3', 3);

    -- PAGE: /blog/cum-se-face-montajul-decoratiunilor-cu-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcum-se-face-montajul-decoratiunilor-cu-baloane', '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/', 'guide', 'Blogcum Se Face Montajul Decoratiunilor Cu Baloane', 'Blogcum Se Face Montajul Decoratiunilor Cu Baloane', 'Blogcum Se Face Montajul Decoratiunilor Cu Baloane - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcum-se-face-montajul-decoratiunilor-cu-baloane?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcum-se-face-montajul-decoratiunilor-cu-baloane?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcum-se-face-montajul-decoratiunilor-cu-baloane?', 'A3', 3);

    -- PAGE: /blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogse-pot-monta-decoratiuni-cu-baloane-in-exterior', '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/', 'guide', 'Blogse Pot Monta Decoratiuni Cu Baloane In Exterior', 'Blogse Pot Monta Decoratiuni Cu Baloane In Exterior', 'Blogse Pot Monta Decoratiuni Cu Baloane In Exterior - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogse-pot-monta-decoratiuni-cu-baloane-in-exterior?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogse-pot-monta-decoratiuni-cu-baloane-in-exterior?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogse-pot-monta-decoratiuni-cu-baloane-in-exterior?', 'A3', 3);

    -- PAGE: /blog/ce-se-intampla-cu-decorul-dupa-eveniment/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogce-se-intampla-cu-decorul-dupa-eveniment', '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/', 'guide', 'Blogce Se Intampla Cu Decorul Dupa Eveniment', 'Blogce Se Intampla Cu Decorul Dupa Eveniment', 'Blogce Se Intampla Cu Decorul Dupa Eveniment - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogce-se-intampla-cu-decorul-dupa-eveniment?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogce-se-intampla-cu-decorul-dupa-eveniment?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogce-se-intampla-cu-decorul-dupa-eveniment?', 'A3', 3);

    -- PAGE: /blog/panou-foto-cu-baloane-idei-si-recomandari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogpanou-foto-cu-baloane-idei-si-recomandari', '/blog/panou-foto-cu-baloane-idei-si-recomandari/', 'guide', 'Blogpanou Foto Cu Baloane Idei Si Recomandari', 'Blogpanou Foto Cu Baloane Idei Si Recomandari', 'Blogpanou Foto Cu Baloane Idei Si Recomandari - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogpanou-foto-cu-baloane-idei-si-recomandari?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogpanou-foto-cu-baloane-idei-si-recomandari?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogpanou-foto-cu-baloane-idei-si-recomandari?', 'A3', 3);

    -- PAGE: /blog/candy-bar-cu-decor-de-baloane-idei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcandy-bar-cu-decor-de-baloane-idei', '/blog/candy-bar-cu-decor-de-baloane-idei/', 'guide', 'Blogcandy Bar Cu Decor De Baloane Idei', 'Blogcandy Bar Cu Decor De Baloane Idei', 'Blogcandy Bar Cu Decor De Baloane Idei - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcandy-bar-cu-decor-de-baloane-idei?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcandy-bar-cu-decor-de-baloane-idei?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcandy-bar-cu-decor-de-baloane-idei?', 'A3', 3);

    -- PAGE: /blog/foto-corner-cu-baloane-pentru-evenimente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogfoto-corner-cu-baloane-pentru-evenimente', '/blog/foto-corner-cu-baloane-pentru-evenimente/', 'guide', 'Blogfoto Corner Cu Baloane Pentru Evenimente', 'Blogfoto Corner Cu Baloane Pentru Evenimente', 'Blogfoto Corner Cu Baloane Pentru Evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogfoto-corner-cu-baloane-pentru-evenimente?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogfoto-corner-cu-baloane-pentru-evenimente?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogfoto-corner-cu-baloane-pentru-evenimente?', 'A3', 3);

    -- PAGE: /blog/cifre-si-litere-din-baloane-cand-se-folosesc/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogcifre-si-litere-din-baloane-cand-se-folosesc', '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/', 'guide', 'Blogcifre Si Litere Din Baloane Cand Se Folosesc', 'Blogcifre Si Litere Din Baloane Cand Se Folosesc', 'Blogcifre Si Litere Din Baloane Cand Se Folosesc - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogcifre-si-litere-din-baloane-cand-se-folosesc?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogcifre-si-litere-din-baloane-cand-se-folosesc?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogcifre-si-litere-din-baloane-cand-se-folosesc?', 'A3', 3);

    -- PAGE: /blog/buchete-baloane-cand-se-potrivesc/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogbuchete-baloane-cand-se-potrivesc', '/blog/buchete-baloane-cand-se-potrivesc/', 'guide', 'Blogbuchete Baloane Cand Se Potrivesc', 'Blogbuchete Baloane Cand Se Potrivesc', 'Blogbuchete Baloane Cand Se Potrivesc - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogbuchete-baloane-cand-se-potrivesc?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogbuchete-baloane-cand-se-potrivesc?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogbuchete-baloane-cand-se-potrivesc?', 'A3', 3);

    -- PAGE: /blog/baloane-personalizate-pentru-evenimente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blogbaloane-personalizate-pentru-evenimente', '/blog/baloane-personalizate-pentru-evenimente/', 'guide', 'Blogbaloane Personalizate Pentru Evenimente', 'Blogbaloane Personalizate Pentru Evenimente', 'Blogbaloane Personalizate Pentru Evenimente - Kassia', '', NULL, 0.5, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'toc', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'main_answer', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'examples', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'mistakes_to_avoid', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 9);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q1 pentru blogbaloane-personalizate-pentru-evenimente?', 'A1', 1);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q2 pentru blogbaloane-personalizate-pentru-evenimente?', 'A2', 2);
    INSERT INTO kassia_faqs (page_id, question, answer, sort_order)
    VALUES (v_page_id, 'Q3 pentru blogbaloane-personalizate-pentru-evenimente?', 'A3', 3);

END $$;

DO $$
BEGIN

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'prețuri', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'despre noi', 'footer_nav'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/despre-noi/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'intrebari frecvente', 'footer_nav'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/intrebari-frecvente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'recenzii', 'footer_nav'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/recenzii/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'portofoliu evenimente', 'footer_nav'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/portofoliu-evenimente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'termeni si conditii', 'footer_nav'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/termeni-si-conditii/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'politica de confidentialitate', 'footer_nav'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/politica-de-confidentialitate/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'blog', 'footer_nav'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/blog/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'politica cookies', 'footer_nav'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/' AND p2.path = '/politica-cookies/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/despre-noi/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/despre-noi/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 1', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-1/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 2', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-2/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 3', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-3/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 4', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-4/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 5', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-5/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 6', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sector-6/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane aviatiei', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-aviatiei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane baneasa', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-baneasa/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane domenii', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-domenii/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane herastrau', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-herastrau/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane victoriei', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-victoriei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane colentina', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-colentina/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane obor', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-obor/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane pantelimon', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-pantelimon/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane tei', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-tei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane stefan cel mare', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-stefan-cel-mare/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane dristor', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-dristor/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane titan', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-titan/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane vitan', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-vitan/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane unirii', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-unirii/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane dudesti', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-dudesti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane berceni', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-berceni/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane tineretului', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-tineretului/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane piata sudului', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-piata-sudului/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane aparatorii patriei', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-aparatorii-patriei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane oltenitei', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-oltenitei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane rahova', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-rahova/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane cotroceni', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-cotroceni/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane 13 septembrie', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-13-septembrie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane ferentari', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-ferentari/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane sebastian', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-sebastian/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane drumul taberei', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-drumul-taberei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane militari', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-militari/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane crangasi', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-crangasi/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane giulesti', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-giulesti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane grozavesti', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-grozavesti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane ilfov', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane voluntari', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-voluntari/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane pipera', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-pipera/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane otopeni', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-otopeni/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane tunari', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-tunari/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane corbeanca', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-corbeanca/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane balotesti', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-balotesti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane mogosoaia', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-mogosoaia/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane chitila', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-chitila/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane chiajna', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-chiajna/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane domnesti', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-domnesti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bragadiru', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-bragadiru/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane magurele', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-magurele/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane popesti leordeni', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-popesti-leordeni/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane berceni ilfov', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-berceni-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane pantelimon ilfov', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-pantelimon-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane cernica', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-cernica/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane afumati', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-afumati/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane stefanestii de jos', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-stefanestii-de-jos/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane dascalu', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-dascalu/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane snagov', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-snagov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane clinceni', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-clinceni/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane dragomiresti vale', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-dragomiresti-vale/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane jilava', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-jilava/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane 1 decembrie', 'area_covered'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-1-decembrie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/galerie/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/galerie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/preturi-decoratiuni-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/preturi-decoratiuni-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/intrebari-frecvente/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/intrebari-frecvente/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/recenzii/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/recenzii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane mot bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-mot-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane turta bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-turta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane nunta bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane 8 martie bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-8-martie-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane cununie bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-cununie-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane majorat bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare copii bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare adulti bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane petrecere bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-petrecere-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane corporate bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-corporate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane deschidere magazin bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane deschidere restaurant bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane lansare produs bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-lansare-produs-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane showroom bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-showroom-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane gradinita bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-gradinita-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane scoala bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-scoala-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane baby shower bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-baby-shower-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane gender reveal bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-gender-reveal-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane craciun bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-craciun-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane revelion bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-revelion-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane paste bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-paste-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane halloween bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-halloween-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane 1 iunie bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-1-iunie-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane absolvire bucuresti', 'portfolio_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-absolvire-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane botez bucuresti', 'portfolio_satellite'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/arcada-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane majorat bucuresti', 'portfolio_satellite'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/arcada-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane nunta bucuresti', 'portfolio_satellite'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/arcada-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto baloane botez bucuresti', 'portfolio_satellite'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/panou-foto-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto baloane majorat bucuresti', 'portfolio_satellite'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/panou-foto-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu majorat bucuresti', 'portfolio_satellite'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/baloane-heliu-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu aniversare bucuresti', 'portfolio_satellite'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/baloane-heliu-aniversare-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'buchete baloane aniversare bucuresti', 'portfolio_satellite'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/buchete-baloane-aniversare-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane roz auriu bucuresti', 'portfolio_satellite'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-roz-auriu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane alb auriu bucuresti', 'portfolio_satellite'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/portofoliu-evenimente/' AND p2.path = '/decoratiuni-baloane-alb-auriu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/termeni-si-conditii/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/termeni-si-conditii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/politica-de-confidentialitate/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/politica-de-confidentialitate/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cât costă decorațiunile cu baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-decoratiunile-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cât costă o arcadă de baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-o-arcada-de-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cât costă baloanele cu heliu', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-baloanele-cu-heliu/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cât costă un panou foto cu baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-un-panou-foto-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cât costă decor baloane botez', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cât costă decor baloane nuntă', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'ce include un pachet decor baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/ce-include-un-pachet-decor-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cum alegi pachetul de decorațiuni baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cum alegi arcada de baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-alegi-arcada-de-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane organică sau clasică', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/arcada-baloane-organica-sau-clasica/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'dimensiune arcadă baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'unde se poate monta o arcadă de baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cât rezistă o arcadă de baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cat-rezista-o-arcada-de-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei arcadă baloane evenimente', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-arcada-baloane-pentru-evenimente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu cât rezistă', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/baloane-heliu-cat-rezista/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu latex sau folie', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/baloane-heliu-latex-sau-folie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'câte baloane cu heliu sunt necesare pentru o cameră', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cum se transportă baloanele cu heliu', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-se-transporta-baloanele-cu-heliu/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane cu heliu pentru copii idei', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/baloane-cu-heliu-pentru-copii-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane cu heliu pentru majorat idei', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei decor baloane botez', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-botez/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei decor baloane moț și turtă', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-mot-si-turta/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei decor baloane nuntă', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-nunta/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei decor baloane cununie', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-cununie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei decor baloane majorat', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-majorat/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei decor baloane aniversare copii', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-aniversare-copii/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei decor baloane aniversare adulți', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-aniversare-adulti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei decor baloane baby shower', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-baby-shower/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei decor baloane gender reveal', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-gender-reveal/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'idei decor baloane corporate', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/idei-decor-baloane-corporate/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cum alegi culorile pentru decorul cu baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decor baloane roz auriu idei', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/decor-baloane-roz-auriu-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decor baloane alb auriu idei', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/decor-baloane-alb-auriu-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decor baloane pastel idei', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/decor-baloane-pastel-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decor baloane luxury idei', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/decor-baloane-luxury-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decor baloane minimalist sau spectaculos', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/decor-baloane-minimalist-sau-spectaculos/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cum comanzi decorațiuni cu baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-comanzi-decoratiuni-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cu cât timp înainte se comandă decorul cu baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'ce informații trebuie să trimiți pentru ofertă decor baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'montaj decorațiuni baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane exterior', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'ce se întâmplă cu decorul după eveniment', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto cu baloane idei', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'candy bar cu decor de baloane idei', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/candy-bar-cu-decor-de-baloane-idei/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'foto corner cu baloane pentru evenimente', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/foto-corner-cu-baloane-pentru-evenimente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cifre și litere din baloane', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'buchete baloane când se potrivesc', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/buchete-baloane-cand-se-potrivesc/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane personalizate pentru evenimente', 'hub_article'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/' AND p2.path = '/blog/baloane-personalizate-pentru-evenimente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/politica-cookies/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/politica-cookies/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'aranjamente baloane bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/aranjamente-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'buchete baloane bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane personalizate bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane cifre litere bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/baloane-cifre-litere-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'ghirlande baloane bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/ghirlande-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'stalpi baloane bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/stalpi-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'perete baloane bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/perete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decor baloane candy bar bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decor-baloane-candy-bar-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'livrare baloane bucuresti', 'all_services'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/livrare-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti', 'core_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane nunta bucuresti', 'core_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane sector 1', 'core_location'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-sector-1/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane ilfov', 'core_location'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie decor', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact rapid', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'prețuri decorațiuni', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'cere ofertă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'verifică prețurile', 'commercial'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'vezi galerie', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane botez', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane majorat', 'relevant_event'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă baloane', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'complementary_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-8-martie-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contactează-ne', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie evenimente', 'inspiration'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcadă foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni Ilfov', 'parent_location'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/decoratiuni-baloane-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni Ilfov', 'parent_location'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/decoratiuni-baloane-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane București', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'comandă acum', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade din baloane', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'heliu', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'core_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'înapoi la eveniment', 'parent_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'rezervă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade baloane', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'înapoi la eveniment', 'parent_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'rezervă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade baloane', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'înapoi la eveniment', 'parent_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'rezervă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcade baloane', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'înapoi la eveniment', 'parent_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'rezervă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'înapoi la eveniment', 'parent_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'rezervă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panouri foto', 'relevant_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'înapoi la eveniment', 'parent_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'rezervă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'înapoi la eveniment', 'parent_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'rezervă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'înapoi la eveniment', 'parent_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'rezervă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-roz-auriu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'rezervă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-roz-auriu-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decorațiuni baloane', 'pillar_link'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-alb-auriu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'rezervă', 'conversion'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-alb-auriu-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-decoratiunile-cu-baloane/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-decoratiunile-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-decoratiunile-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-o-arcada-de-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-o-arcada-de-baloane/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-o-arcada-de-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-baloanele-cu-heliu/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'buchete baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-baloanele-cu-heliu/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-baloanele-cu-heliu/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-baloanele-cu-heliu/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-panou-foto-cu-baloane/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-panou-foto-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-panou-foto-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane botez bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/' AND p2.path = '/arcada-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane nunta bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane nunta bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/' AND p2.path = '/arcada-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-include-un-pachet-decor-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-include-un-pachet-decor-baloane/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-include-un-pachet-decor-baloane/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-include-un-pachet-decor-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-arcada-de-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-arcada-de-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-arcada-de-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/arcada-baloane-organica-sau-clasica/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/arcada-baloane-organica-sau-clasica/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/arcada-baloane-organica-sau-clasica/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-rezista-o-arcada-de-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-rezista-o-arcada-de-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cat-rezista-o-arcada-de-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane nunta bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-arcada-baloane-pentru-evenimente/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-cat-rezista/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'buchete baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-cat-rezista/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-cat-rezista/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-latex-sau-folie/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane personalizate bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-latex-sau-folie/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-heliu-latex-sau-folie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'buchete baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-transporta-baloanele-cu-heliu/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'livrare baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-transporta-baloanele-cu-heliu/' AND p2.path = '/livrare-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-transporta-baloanele-cu-heliu/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-copii-idei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare copii bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-copii-idei/' AND p2.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-copii-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane majorat bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu majorat bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/' AND p2.path = '/baloane-heliu-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-cu-heliu-pentru-majorat-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-botez/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane botez bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-botez/' AND p2.path = '/arcada-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto baloane botez bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-botez/' AND p2.path = '/panou-foto-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-botez/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane mot bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-mot-si-turta/' AND p2.path = '/decoratiuni-baloane-mot-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane turta bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-mot-si-turta/' AND p2.path = '/decoratiuni-baloane-turta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-mot-si-turta/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-mot-si-turta/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane nunta bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-nunta/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane nunta bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-nunta/' AND p2.path = '/arcada-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-nunta/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-nunta/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane cununie bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-cununie/' AND p2.path = '/decoratiuni-baloane-cununie-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-cununie/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-cununie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane majorat bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-majorat/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane majorat bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-majorat/' AND p2.path = '/arcada-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu majorat bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-majorat/' AND p2.path = '/baloane-heliu-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-majorat/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare copii bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-copii/' AND p2.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-copii/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-copii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare adulti bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-adulti/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-adulti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-adulti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-aniversare-adulti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane baby shower bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-baby-shower/' AND p2.path = '/decoratiuni-baloane-baby-shower-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane personalizate bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-baby-shower/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-baby-shower/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane gender reveal bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-gender-reveal/' AND p2.path = '/decoratiuni-baloane-gender-reveal-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane personalizate bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-gender-reveal/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-gender-reveal/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-gender-reveal/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane corporate bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-corporate/' AND p2.path = '/decoratiuni-baloane-corporate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane deschidere magazin bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-corporate/' AND p2.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/idei-decor-baloane-corporate/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane roz auriu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-roz-auriu-idei/' AND p2.path = '/decoratiuni-baloane-roz-auriu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-roz-auriu-idei/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-roz-auriu-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane alb auriu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-alb-auriu-idei/' AND p2.path = '/decoratiuni-baloane-alb-auriu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-alb-auriu-idei/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-alb-auriu-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-pastel-idei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-pastel-idei/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-pastel-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-luxury-idei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-luxury-idei/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-luxury-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-minimalist-sau-spectaculos/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'galerie', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-minimalist-sau-spectaculos/' AND p2.path = '/galerie/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/decor-baloane-minimalist-sau-spectaculos/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-comanzi-decoratiuni-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-comanzi-decoratiuni-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-comanzi-decoratiuni-cu-baloane/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'intrebari frecvente', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/' AND p2.path = '/intrebari-frecvente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'preturi decoratiuni baloane', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'intrebari frecvente', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/' AND p2.path = '/intrebari-frecvente/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decor baloane candy bar bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/candy-bar-cu-decor-de-baloane-idei/' AND p2.path = '/decor-baloane-candy-bar-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane botez bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/candy-bar-cu-decor-de-baloane-idei/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare copii bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/candy-bar-cu-decor-de-baloane-idei/' AND p2.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/candy-bar-cu-decor-de-baloane-idei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'panou foto baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/foto-corner-cu-baloane-pentru-evenimente/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'arcada baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/foto-corner-cu-baloane-pentru-evenimente/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/foto-corner-cu-baloane-pentru-evenimente/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane cifre litere bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/' AND p2.path = '/baloane-cifre-litere-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane majorat bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'decoratiuni baloane aniversare copii bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/' AND p2.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'buchete baloane bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/buchete-baloane-cand-se-potrivesc/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/buchete-baloane-cand-se-potrivesc/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/buchete-baloane-cand-se-potrivesc/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane personalizate bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-personalizate-pentru-evenimente/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'baloane heliu bucuresti', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-personalizate-pentru-evenimente/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text, reason)
    SELECT p1.id, p2.id, 'contact', 'recommended_service'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/blog/baloane-personalizate-pentru-evenimente/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

END $$;
