-- Seed Data for Kassia SEO CMS

DO $$
DECLARE
    v_page_id UUID;
BEGIN

    -- Page: /
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('home', '/', 'support', 'Homepage', 'Decorațiuni Baloane București și Ilfov', 'Decorațiuni Baloane București | Botez, Nuntă, Majorat | Kassia', 'Kassia oferă cele mai frumoase decorațiuni cu baloane în București și Ilfov. Arcade, panouri foto, heliu și aranjamente personalizate. Cere o ofertă!', NULL, 1, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /despre-noi/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('despre-noi', '/despre-noi/', 'support', 'Despre Noi', 'Despre Noi', 'Despre Noi - Kassia Decorațiuni Baloane', 'Află mai multe despre despre noi la Kassia, echipa ta de decorațiuni cu baloane din București.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /contact/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('contact', '/contact/', 'support', 'Contact', 'Contact', 'Contact - Kassia Decorațiuni Baloane', 'Află mai multe despre contact la Kassia, echipa ta de decorațiuni cu baloane din București.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /galerie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('galerie', '/galerie/', 'support', 'Galerie', 'Galerie', 'Galerie - Kassia Decorațiuni Baloane', 'Află mai multe despre galerie la Kassia, echipa ta de decorațiuni cu baloane din București.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /preturi-decoratiuni-baloane/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('preturi-decoratiuni-baloane', '/preturi-decoratiuni-baloane/', 'support', 'Preturi Decoratiuni Baloane', 'Preturi Decoratiuni Baloane', 'Preturi Decoratiuni Baloane - Kassia Decorațiuni Baloane', 'Află mai multe despre preturi decoratiuni baloane la Kassia, echipa ta de decorațiuni cu baloane din București.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /intrebari-frecvente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('intrebari-frecvente', '/intrebari-frecvente/', 'support', 'Intrebari Frecvente', 'Intrebari Frecvente', 'Intrebari Frecvente - Kassia Decorațiuni Baloane', 'Află mai multe despre intrebari frecvente la Kassia, echipa ta de decorațiuni cu baloane din București.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /recenzii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('recenzii', '/recenzii/', 'support', 'Recenzii', 'Recenzii', 'Recenzii - Kassia Decorațiuni Baloane', 'Află mai multe despre recenzii la Kassia, echipa ta de decorațiuni cu baloane din București.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /portofoliu-evenimente/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('portofoliu-evenimente', '/portofoliu-evenimente/', 'support', 'Portofoliu Evenimente', 'Portofoliu Evenimente', 'Portofoliu Evenimente - Kassia Decorațiuni Baloane', 'Află mai multe despre portofoliu evenimente la Kassia, echipa ta de decorațiuni cu baloane din București.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /termeni-si-conditii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('termeni-si-conditii', '/termeni-si-conditii/', 'support', 'Termeni Si Conditii', 'Termeni Si Conditii', 'Termeni Si Conditii - Kassia Decorațiuni Baloane', 'Află mai multe despre termeni si conditii la Kassia, echipa ta de decorațiuni cu baloane din București.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /politica-de-confidentialitate/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('politica-de-confidentialitate', '/politica-de-confidentialitate/', 'support', 'Politica De Confidentialitate', 'Politica De Confidentialitate', 'Politica De Confidentialitate - Kassia Decorațiuni Baloane', 'Află mai multe despre politica de confidentialitate la Kassia, echipa ta de decorațiuni cu baloane din București.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /blog/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('blog', '/blog/', 'support', 'Blog', 'Blog', 'Blog - Kassia Decorațiuni Baloane', 'Află mai multe despre blog la Kassia, echipa ta de decorațiuni cu baloane din București.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'content', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 3);

    -- Page: /decoratiuni-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-bucuresti', '/decoratiuni-baloane-bucuresti/', 'service', 'Decoratiuni Baloane Bucuresti', 'Decoratiuni Baloane Bucuresti pentru Evenimente', 'Decoratiuni Baloane Bucuresti – Prețuri & Montaj', 'Realizăm decoratiuni baloane bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /aranjamente-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('aranjamente-baloane-bucuresti', '/aranjamente-baloane-bucuresti/', 'service', 'Aranjamente Baloane Bucuresti', 'Aranjamente Baloane Bucuresti pentru Evenimente', 'Aranjamente Baloane Bucuresti – Prețuri & Montaj', 'Realizăm aranjamente baloane bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /arcada-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-bucuresti', '/arcada-baloane-bucuresti/', 'service', 'Arcada Baloane Bucuresti', 'Arcada Baloane Bucuresti pentru Evenimente', 'Arcada Baloane Bucuresti – Prețuri & Montaj', 'Realizăm arcada baloane bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /baloane-heliu-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-bucuresti', '/baloane-heliu-bucuresti/', 'service', 'Baloane Heliu Bucuresti', 'Baloane Heliu Bucuresti pentru Evenimente', 'Baloane Heliu Bucuresti – Prețuri & Montaj', 'Realizăm baloane heliu bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /panou-foto-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('panou-foto-baloane-bucuresti', '/panou-foto-baloane-bucuresti/', 'service', 'Panou Foto Baloane Bucuresti', 'Panou Foto Baloane Bucuresti pentru Evenimente', 'Panou Foto Baloane Bucuresti – Prețuri & Montaj', 'Realizăm panou foto baloane bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /buchete-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('buchete-baloane-bucuresti', '/buchete-baloane-bucuresti/', 'service', 'Buchete Baloane Bucuresti', 'Buchete Baloane Bucuresti pentru Evenimente', 'Buchete Baloane Bucuresti – Prețuri & Montaj', 'Realizăm buchete baloane bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /baloane-personalizate-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-personalizate-bucuresti', '/baloane-personalizate-bucuresti/', 'service', 'Baloane Personalizate Bucuresti', 'Baloane Personalizate Bucuresti pentru Evenimente', 'Baloane Personalizate Bucuresti – Prețuri & Montaj', 'Realizăm baloane personalizate bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /baloane-cifre-litere-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-cifre-litere-bucuresti', '/baloane-cifre-litere-bucuresti/', 'service', 'Baloane Cifre Litere Bucuresti', 'Baloane Cifre Litere Bucuresti pentru Evenimente', 'Baloane Cifre Litere Bucuresti – Prețuri & Montaj', 'Realizăm baloane cifre litere bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /ghirlande-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('ghirlande-baloane-bucuresti', '/ghirlande-baloane-bucuresti/', 'service', 'Ghirlande Baloane Bucuresti', 'Ghirlande Baloane Bucuresti pentru Evenimente', 'Ghirlande Baloane Bucuresti – Prețuri & Montaj', 'Realizăm ghirlande baloane bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /stalpi-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('stalpi-baloane-bucuresti', '/stalpi-baloane-bucuresti/', 'service', 'Stalpi Baloane Bucuresti', 'Stalpi Baloane Bucuresti pentru Evenimente', 'Stalpi Baloane Bucuresti – Prețuri & Montaj', 'Realizăm stalpi baloane bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /perete-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('perete-baloane-bucuresti', '/perete-baloane-bucuresti/', 'service', 'Perete Baloane Bucuresti', 'Perete Baloane Bucuresti pentru Evenimente', 'Perete Baloane Bucuresti – Prețuri & Montaj', 'Realizăm perete baloane bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decor-baloane-candy-bar-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decor-baloane-candy-bar-bucuresti', '/decor-baloane-candy-bar-bucuresti/', 'service', 'Decor Baloane Candy Bar Bucuresti', 'Decor Baloane Candy Bar Bucuresti pentru Evenimente', 'Decor Baloane Candy Bar Bucuresti – Prețuri & Montaj', 'Realizăm decor baloane candy bar bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /livrare-baloane-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('livrare-baloane-bucuresti', '/livrare-baloane-bucuresti/', 'service', 'Livrare Baloane Bucuresti', 'Livrare Baloane Bucuresti pentru Evenimente', 'Livrare Baloane Bucuresti – Prețuri & Montaj', 'Realizăm livrare baloane bucuresti pentru botezuri, nunți, majorate și evenimente corporate în București și Ilfov. Ofertă rapidă și montaj inclus.', NULL, 0.9, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'service_features', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'event_use_cases', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-botez-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-botez-bucuresti', '/decoratiuni-baloane-botez-bucuresti/', 'event', 'Decoratiuni Baloane Botez Bucuresti', 'Decoratiuni Baloane Botez Bucuresti', 'Decoratiuni Baloane Botez Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane botez bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-mot-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-mot-bucuresti', '/decoratiuni-baloane-mot-bucuresti/', 'event', 'Decoratiuni Baloane Mot Bucuresti', 'Decoratiuni Baloane Mot Bucuresti', 'Decoratiuni Baloane Mot Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane mot bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-turta-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-turta-bucuresti', '/decoratiuni-baloane-turta-bucuresti/', 'event', 'Decoratiuni Baloane Turta Bucuresti', 'Decoratiuni Baloane Turta Bucuresti', 'Decoratiuni Baloane Turta Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane turta bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-nunta-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-nunta-bucuresti', '/decoratiuni-baloane-nunta-bucuresti/', 'event', 'Decoratiuni Baloane Nunta Bucuresti', 'Decoratiuni Baloane Nunta Bucuresti', 'Decoratiuni Baloane Nunta Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane nunta bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /arcada-baloane-nunta-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-nunta-bucuresti', '/arcada-baloane-nunta-bucuresti/', 'event', 'Arcada Baloane Nunta Bucuresti', 'Arcada Baloane Nunta Bucuresti', 'Arcada Baloane Nunta Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu arcada baloane nunta bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-cununie-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-cununie-bucuresti', '/decoratiuni-baloane-cununie-bucuresti/', 'event', 'Decoratiuni Baloane Cununie Bucuresti', 'Decoratiuni Baloane Cununie Bucuresti', 'Decoratiuni Baloane Cununie Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane cununie bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-majorat-bucuresti', '/decoratiuni-baloane-majorat-bucuresti/', 'event', 'Decoratiuni Baloane Majorat Bucuresti', 'Decoratiuni Baloane Majorat Bucuresti', 'Decoratiuni Baloane Majorat Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane majorat bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-aniversare-copii-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aniversare-copii-bucuresti', '/decoratiuni-baloane-aniversare-copii-bucuresti/', 'event', 'Decoratiuni Baloane Aniversare Copii Bucuresti', 'Decoratiuni Baloane Aniversare Copii Bucuresti', 'Decoratiuni Baloane Aniversare Copii Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane aniversare copii bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-aniversare-adulti-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aniversare-adulti-bucuresti', '/decoratiuni-baloane-aniversare-adulti-bucuresti/', 'event', 'Decoratiuni Baloane Aniversare Adulti Bucuresti', 'Decoratiuni Baloane Aniversare Adulti Bucuresti', 'Decoratiuni Baloane Aniversare Adulti Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane aniversare adulti bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-petrecere-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-petrecere-bucuresti', '/decoratiuni-baloane-petrecere-bucuresti/', 'event', 'Decoratiuni Baloane Petrecere Bucuresti', 'Decoratiuni Baloane Petrecere Bucuresti', 'Decoratiuni Baloane Petrecere Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane petrecere bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-corporate-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-corporate-bucuresti', '/decoratiuni-baloane-corporate-bucuresti/', 'event', 'Decoratiuni Baloane Corporate Bucuresti', 'Decoratiuni Baloane Corporate Bucuresti', 'Decoratiuni Baloane Corporate Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane corporate bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-deschidere-magazin-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-deschidere-magazin-bucuresti', '/decoratiuni-baloane-deschidere-magazin-bucuresti/', 'event', 'Decoratiuni Baloane Deschidere Magazin Bucuresti', 'Decoratiuni Baloane Deschidere Magazin Bucuresti', 'Decoratiuni Baloane Deschidere Magazin Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane deschidere magazin bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-deschidere-restaurant-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-deschidere-restaurant-bucuresti', '/decoratiuni-baloane-deschidere-restaurant-bucuresti/', 'event', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti', 'Decoratiuni Baloane Deschidere Restaurant Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane deschidere restaurant bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-lansare-produs-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-lansare-produs-bucuresti', '/decoratiuni-baloane-lansare-produs-bucuresti/', 'event', 'Decoratiuni Baloane Lansare Produs Bucuresti', 'Decoratiuni Baloane Lansare Produs Bucuresti', 'Decoratiuni Baloane Lansare Produs Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane lansare produs bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-showroom-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-showroom-bucuresti', '/decoratiuni-baloane-showroom-bucuresti/', 'event', 'Decoratiuni Baloane Showroom Bucuresti', 'Decoratiuni Baloane Showroom Bucuresti', 'Decoratiuni Baloane Showroom Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane showroom bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-gradinita-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-gradinita-bucuresti', '/decoratiuni-baloane-gradinita-bucuresti/', 'event', 'Decoratiuni Baloane Gradinita Bucuresti', 'Decoratiuni Baloane Gradinita Bucuresti', 'Decoratiuni Baloane Gradinita Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane gradinita bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-scoala-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-scoala-bucuresti', '/decoratiuni-baloane-scoala-bucuresti/', 'event', 'Decoratiuni Baloane Scoala Bucuresti', 'Decoratiuni Baloane Scoala Bucuresti', 'Decoratiuni Baloane Scoala Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane scoala bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-baby-shower-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-baby-shower-bucuresti', '/decoratiuni-baloane-baby-shower-bucuresti/', 'event', 'Decoratiuni Baloane Baby Shower Bucuresti', 'Decoratiuni Baloane Baby Shower Bucuresti', 'Decoratiuni Baloane Baby Shower Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane baby shower bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-gender-reveal-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-gender-reveal-bucuresti', '/decoratiuni-baloane-gender-reveal-bucuresti/', 'event', 'Decoratiuni Baloane Gender Reveal Bucuresti', 'Decoratiuni Baloane Gender Reveal Bucuresti', 'Decoratiuni Baloane Gender Reveal Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane gender reveal bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-craciun-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-craciun-bucuresti', '/decoratiuni-baloane-craciun-bucuresti/', 'event', 'Decoratiuni Baloane Craciun Bucuresti', 'Decoratiuni Baloane Craciun Bucuresti', 'Decoratiuni Baloane Craciun Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane craciun bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-revelion-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-revelion-bucuresti', '/decoratiuni-baloane-revelion-bucuresti/', 'event', 'Decoratiuni Baloane Revelion Bucuresti', 'Decoratiuni Baloane Revelion Bucuresti', 'Decoratiuni Baloane Revelion Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane revelion bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-paste-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-paste-bucuresti', '/decoratiuni-baloane-paste-bucuresti/', 'event', 'Decoratiuni Baloane Paste Bucuresti', 'Decoratiuni Baloane Paste Bucuresti', 'Decoratiuni Baloane Paste Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane paste bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-halloween-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-halloween-bucuresti', '/decoratiuni-baloane-halloween-bucuresti/', 'event', 'Decoratiuni Baloane Halloween Bucuresti', 'Decoratiuni Baloane Halloween Bucuresti', 'Decoratiuni Baloane Halloween Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane halloween bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-1-iunie-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-1-iunie-bucuresti', '/decoratiuni-baloane-1-iunie-bucuresti/', 'event', 'Decoratiuni Baloane 1 Iunie Bucuresti', 'Decoratiuni Baloane 1 Iunie Bucuresti', 'Decoratiuni Baloane 1 Iunie Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane 1 iunie bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-absolvire-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-absolvire-bucuresti', '/decoratiuni-baloane-absolvire-bucuresti/', 'event', 'Decoratiuni Baloane Absolvire Bucuresti', 'Decoratiuni Baloane Absolvire Bucuresti', 'Decoratiuni Baloane Absolvire Bucuresti – Pachete & Ofertă', 'Transformă evenimentul tău cu decoratiuni baloane absolvire bucuresti. Arcade, baloane cu heliu și panouri foto adaptate tematicii tale. Cere ofertă.', NULL, 0.8, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'decor_options', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'recommended_services', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'process', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'kassia_locations', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 10);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 11);

    -- Page: /decoratiuni-baloane-sector-1/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-1', '/decoratiuni-baloane-sector-1/', 'location', 'Decoratiuni Baloane Sector 1', 'Decoratiuni Baloane Sector 1', 'Decoratiuni Baloane Sector 1 – Montaj Rapid', 'Cauți decorațiuni cu baloane în Sector 1? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-sector-2/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-2', '/decoratiuni-baloane-sector-2/', 'location', 'Decoratiuni Baloane Sector 2', 'Decoratiuni Baloane Sector 2', 'Decoratiuni Baloane Sector 2 – Montaj Rapid', 'Cauți decorațiuni cu baloane în Sector 2? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-sector-3/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-3', '/decoratiuni-baloane-sector-3/', 'location', 'Decoratiuni Baloane Sector 3', 'Decoratiuni Baloane Sector 3', 'Decoratiuni Baloane Sector 3 – Montaj Rapid', 'Cauți decorațiuni cu baloane în Sector 3? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-sector-4/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-4', '/decoratiuni-baloane-sector-4/', 'location', 'Decoratiuni Baloane Sector 4', 'Decoratiuni Baloane Sector 4', 'Decoratiuni Baloane Sector 4 – Montaj Rapid', 'Cauți decorațiuni cu baloane în Sector 4? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-sector-5/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-5', '/decoratiuni-baloane-sector-5/', 'location', 'Decoratiuni Baloane Sector 5', 'Decoratiuni Baloane Sector 5', 'Decoratiuni Baloane Sector 5 – Montaj Rapid', 'Cauți decorațiuni cu baloane în Sector 5? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-sector-6/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sector-6', '/decoratiuni-baloane-sector-6/', 'location', 'Decoratiuni Baloane Sector 6', 'Decoratiuni Baloane Sector 6', 'Decoratiuni Baloane Sector 6 – Montaj Rapid', 'Cauți decorațiuni cu baloane în Sector 6? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-aviatiei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aviatiei', '/decoratiuni-baloane-aviatiei/', 'location', 'Decoratiuni Baloane Aviatiei', 'Decoratiuni Baloane Aviatiei', 'Decoratiuni Baloane Aviatiei – Montaj Rapid', 'Cauți decorațiuni cu baloane în Aviatiei? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-baneasa/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-baneasa', '/decoratiuni-baloane-baneasa/', 'location', 'Decoratiuni Baloane Baneasa', 'Decoratiuni Baloane Baneasa', 'Decoratiuni Baloane Baneasa – Montaj Rapid', 'Cauți decorațiuni cu baloane în Baneasa? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-domenii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-domenii', '/decoratiuni-baloane-domenii/', 'location', 'Decoratiuni Baloane Domenii', 'Decoratiuni Baloane Domenii', 'Decoratiuni Baloane Domenii – Montaj Rapid', 'Cauți decorațiuni cu baloane în Domenii? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-herastrau/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-herastrau', '/decoratiuni-baloane-herastrau/', 'location', 'Decoratiuni Baloane Herastrau', 'Decoratiuni Baloane Herastrau', 'Decoratiuni Baloane Herastrau – Montaj Rapid', 'Cauți decorațiuni cu baloane în Herastrau? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-victoriei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-victoriei', '/decoratiuni-baloane-victoriei/', 'location', 'Decoratiuni Baloane Victoriei', 'Decoratiuni Baloane Victoriei', 'Decoratiuni Baloane Victoriei – Montaj Rapid', 'Cauți decorațiuni cu baloane în Victoriei? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-colentina/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-colentina', '/decoratiuni-baloane-colentina/', 'location', 'Decoratiuni Baloane Colentina', 'Decoratiuni Baloane Colentina', 'Decoratiuni Baloane Colentina – Montaj Rapid', 'Cauți decorațiuni cu baloane în Colentina? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-obor/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-obor', '/decoratiuni-baloane-obor/', 'location', 'Decoratiuni Baloane Obor', 'Decoratiuni Baloane Obor', 'Decoratiuni Baloane Obor – Montaj Rapid', 'Cauți decorațiuni cu baloane în Obor? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-pantelimon/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-pantelimon', '/decoratiuni-baloane-pantelimon/', 'location', 'Decoratiuni Baloane Pantelimon', 'Decoratiuni Baloane Pantelimon', 'Decoratiuni Baloane Pantelimon – Montaj Rapid', 'Cauți decorațiuni cu baloane în Pantelimon? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-tei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-tei', '/decoratiuni-baloane-tei/', 'location', 'Decoratiuni Baloane Tei', 'Decoratiuni Baloane Tei', 'Decoratiuni Baloane Tei – Montaj Rapid', 'Cauți decorațiuni cu baloane în Tei? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-stefan-cel-mare/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-stefan-cel-mare', '/decoratiuni-baloane-stefan-cel-mare/', 'location', 'Decoratiuni Baloane Stefan Cel Mare', 'Decoratiuni Baloane Stefan Cel Mare', 'Decoratiuni Baloane Stefan Cel Mare – Montaj Rapid', 'Cauți decorațiuni cu baloane în Stefan Cel Mare? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-dristor/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dristor', '/decoratiuni-baloane-dristor/', 'location', 'Decoratiuni Baloane Dristor', 'Decoratiuni Baloane Dristor', 'Decoratiuni Baloane Dristor – Montaj Rapid', 'Cauți decorațiuni cu baloane în Dristor? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-titan/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-titan', '/decoratiuni-baloane-titan/', 'location', 'Decoratiuni Baloane Titan', 'Decoratiuni Baloane Titan', 'Decoratiuni Baloane Titan – Montaj Rapid', 'Cauți decorațiuni cu baloane în Titan? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-vitan/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-vitan', '/decoratiuni-baloane-vitan/', 'location', 'Decoratiuni Baloane Vitan', 'Decoratiuni Baloane Vitan', 'Decoratiuni Baloane Vitan – Montaj Rapid', 'Cauți decorațiuni cu baloane în Vitan? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-unirii/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-unirii', '/decoratiuni-baloane-unirii/', 'location', 'Decoratiuni Baloane Unirii', 'Decoratiuni Baloane Unirii', 'Decoratiuni Baloane Unirii – Montaj Rapid', 'Cauți decorațiuni cu baloane în Unirii? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-dudesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dudesti', '/decoratiuni-baloane-dudesti/', 'location', 'Decoratiuni Baloane Dudesti', 'Decoratiuni Baloane Dudesti', 'Decoratiuni Baloane Dudesti – Montaj Rapid', 'Cauți decorațiuni cu baloane în Dudesti? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-berceni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-berceni', '/decoratiuni-baloane-berceni/', 'location', 'Decoratiuni Baloane Berceni', 'Decoratiuni Baloane Berceni', 'Decoratiuni Baloane Berceni – Montaj Rapid', 'Cauți decorațiuni cu baloane în Berceni? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-tineretului/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-tineretului', '/decoratiuni-baloane-tineretului/', 'location', 'Decoratiuni Baloane Tineretului', 'Decoratiuni Baloane Tineretului', 'Decoratiuni Baloane Tineretului – Montaj Rapid', 'Cauți decorațiuni cu baloane în Tineretului? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-piata-sudului/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-piata-sudului', '/decoratiuni-baloane-piata-sudului/', 'location', 'Decoratiuni Baloane Piata Sudului', 'Decoratiuni Baloane Piata Sudului', 'Decoratiuni Baloane Piata Sudului – Montaj Rapid', 'Cauți decorațiuni cu baloane în Piata Sudului? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-aparatorii-patriei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-aparatorii-patriei', '/decoratiuni-baloane-aparatorii-patriei/', 'location', 'Decoratiuni Baloane Aparatorii Patriei', 'Decoratiuni Baloane Aparatorii Patriei', 'Decoratiuni Baloane Aparatorii Patriei – Montaj Rapid', 'Cauți decorațiuni cu baloane în Aparatorii Patriei? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-oltenitei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-oltenitei', '/decoratiuni-baloane-oltenitei/', 'location', 'Decoratiuni Baloane Oltenitei', 'Decoratiuni Baloane Oltenitei', 'Decoratiuni Baloane Oltenitei – Montaj Rapid', 'Cauți decorațiuni cu baloane în Oltenitei? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-rahova/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-rahova', '/decoratiuni-baloane-rahova/', 'location', 'Decoratiuni Baloane Rahova', 'Decoratiuni Baloane Rahova', 'Decoratiuni Baloane Rahova – Montaj Rapid', 'Cauți decorațiuni cu baloane în Rahova? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-cotroceni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-cotroceni', '/decoratiuni-baloane-cotroceni/', 'location', 'Decoratiuni Baloane Cotroceni', 'Decoratiuni Baloane Cotroceni', 'Decoratiuni Baloane Cotroceni – Montaj Rapid', 'Cauți decorațiuni cu baloane în Cotroceni? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-13-septembrie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-13-septembrie', '/decoratiuni-baloane-13-septembrie/', 'location', 'Decoratiuni Baloane 13 Septembrie', 'Decoratiuni Baloane 13 Septembrie', 'Decoratiuni Baloane 13 Septembrie – Montaj Rapid', 'Cauți decorațiuni cu baloane în 13 Septembrie? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-ferentari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-ferentari', '/decoratiuni-baloane-ferentari/', 'location', 'Decoratiuni Baloane Ferentari', 'Decoratiuni Baloane Ferentari', 'Decoratiuni Baloane Ferentari – Montaj Rapid', 'Cauți decorațiuni cu baloane în Ferentari? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-sebastian/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-sebastian', '/decoratiuni-baloane-sebastian/', 'location', 'Decoratiuni Baloane Sebastian', 'Decoratiuni Baloane Sebastian', 'Decoratiuni Baloane Sebastian – Montaj Rapid', 'Cauți decorațiuni cu baloane în Sebastian? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-drumul-taberei/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-drumul-taberei', '/decoratiuni-baloane-drumul-taberei/', 'location', 'Decoratiuni Baloane Drumul Taberei', 'Decoratiuni Baloane Drumul Taberei', 'Decoratiuni Baloane Drumul Taberei – Montaj Rapid', 'Cauți decorațiuni cu baloane în Drumul Taberei? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-militari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-militari', '/decoratiuni-baloane-militari/', 'location', 'Decoratiuni Baloane Militari', 'Decoratiuni Baloane Militari', 'Decoratiuni Baloane Militari – Montaj Rapid', 'Cauți decorațiuni cu baloane în Militari? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-crangasi/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-crangasi', '/decoratiuni-baloane-crangasi/', 'location', 'Decoratiuni Baloane Crangasi', 'Decoratiuni Baloane Crangasi', 'Decoratiuni Baloane Crangasi – Montaj Rapid', 'Cauți decorațiuni cu baloane în Crangasi? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-giulesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-giulesti', '/decoratiuni-baloane-giulesti/', 'location', 'Decoratiuni Baloane Giulesti', 'Decoratiuni Baloane Giulesti', 'Decoratiuni Baloane Giulesti – Montaj Rapid', 'Cauți decorațiuni cu baloane în Giulesti? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-grozavesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-grozavesti', '/decoratiuni-baloane-grozavesti/', 'location', 'Decoratiuni Baloane Grozavesti', 'Decoratiuni Baloane Grozavesti', 'Decoratiuni Baloane Grozavesti – Montaj Rapid', 'Cauți decorațiuni cu baloane în Grozavesti? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-ilfov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-ilfov', '/decoratiuni-baloane-ilfov/', 'location', 'Decoratiuni Baloane Ilfov', 'Decoratiuni Baloane Ilfov', 'Decoratiuni Baloane Ilfov – Montaj Rapid', 'Cauți decorațiuni cu baloane în Ilfov? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-voluntari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-voluntari', '/decoratiuni-baloane-voluntari/', 'location', 'Decoratiuni Baloane Voluntari', 'Decoratiuni Baloane Voluntari', 'Decoratiuni Baloane Voluntari – Montaj Rapid', 'Cauți decorațiuni cu baloane în Voluntari? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-pipera/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-pipera', '/decoratiuni-baloane-pipera/', 'location', 'Decoratiuni Baloane Pipera', 'Decoratiuni Baloane Pipera', 'Decoratiuni Baloane Pipera – Montaj Rapid', 'Cauți decorațiuni cu baloane în Pipera? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-otopeni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-otopeni', '/decoratiuni-baloane-otopeni/', 'location', 'Decoratiuni Baloane Otopeni', 'Decoratiuni Baloane Otopeni', 'Decoratiuni Baloane Otopeni – Montaj Rapid', 'Cauți decorațiuni cu baloane în Otopeni? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-tunari/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-tunari', '/decoratiuni-baloane-tunari/', 'location', 'Decoratiuni Baloane Tunari', 'Decoratiuni Baloane Tunari', 'Decoratiuni Baloane Tunari – Montaj Rapid', 'Cauți decorațiuni cu baloane în Tunari? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-corbeanca/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-corbeanca', '/decoratiuni-baloane-corbeanca/', 'location', 'Decoratiuni Baloane Corbeanca', 'Decoratiuni Baloane Corbeanca', 'Decoratiuni Baloane Corbeanca – Montaj Rapid', 'Cauți decorațiuni cu baloane în Corbeanca? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-balotesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-balotesti', '/decoratiuni-baloane-balotesti/', 'location', 'Decoratiuni Baloane Balotesti', 'Decoratiuni Baloane Balotesti', 'Decoratiuni Baloane Balotesti – Montaj Rapid', 'Cauți decorațiuni cu baloane în Balotesti? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-mogosoaia/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-mogosoaia', '/decoratiuni-baloane-mogosoaia/', 'location', 'Decoratiuni Baloane Mogosoaia', 'Decoratiuni Baloane Mogosoaia', 'Decoratiuni Baloane Mogosoaia – Montaj Rapid', 'Cauți decorațiuni cu baloane în Mogosoaia? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-chitila/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-chitila', '/decoratiuni-baloane-chitila/', 'location', 'Decoratiuni Baloane Chitila', 'Decoratiuni Baloane Chitila', 'Decoratiuni Baloane Chitila – Montaj Rapid', 'Cauți decorațiuni cu baloane în Chitila? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-chiajna/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-chiajna', '/decoratiuni-baloane-chiajna/', 'location', 'Decoratiuni Baloane Chiajna', 'Decoratiuni Baloane Chiajna', 'Decoratiuni Baloane Chiajna – Montaj Rapid', 'Cauți decorațiuni cu baloane în Chiajna? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-domnesti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-domnesti', '/decoratiuni-baloane-domnesti/', 'location', 'Decoratiuni Baloane Domnesti', 'Decoratiuni Baloane Domnesti', 'Decoratiuni Baloane Domnesti – Montaj Rapid', 'Cauți decorațiuni cu baloane în Domnesti? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-bragadiru/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-bragadiru', '/decoratiuni-baloane-bragadiru/', 'location', 'Decoratiuni Baloane Bragadiru', 'Decoratiuni Baloane Bragadiru', 'Decoratiuni Baloane Bragadiru – Montaj Rapid', 'Cauți decorațiuni cu baloane în Bragadiru? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-magurele/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-magurele', '/decoratiuni-baloane-magurele/', 'location', 'Decoratiuni Baloane Magurele', 'Decoratiuni Baloane Magurele', 'Decoratiuni Baloane Magurele – Montaj Rapid', 'Cauți decorațiuni cu baloane în Magurele? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-popesti-leordeni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-popesti-leordeni', '/decoratiuni-baloane-popesti-leordeni/', 'location', 'Decoratiuni Baloane Popesti Leordeni', 'Decoratiuni Baloane Popesti Leordeni', 'Decoratiuni Baloane Popesti Leordeni – Montaj Rapid', 'Cauți decorațiuni cu baloane în Popesti Leordeni? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-berceni-ilfov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-berceni-ilfov', '/decoratiuni-baloane-berceni-ilfov/', 'location', 'Decoratiuni Baloane Berceni Ilfov', 'Decoratiuni Baloane Berceni Ilfov', 'Decoratiuni Baloane Berceni Ilfov – Montaj Rapid', 'Cauți decorațiuni cu baloane în Berceni Ilfov? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-pantelimon-ilfov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-pantelimon-ilfov', '/decoratiuni-baloane-pantelimon-ilfov/', 'location', 'Decoratiuni Baloane Pantelimon Ilfov', 'Decoratiuni Baloane Pantelimon Ilfov', 'Decoratiuni Baloane Pantelimon Ilfov – Montaj Rapid', 'Cauți decorațiuni cu baloane în Pantelimon Ilfov? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-cernica/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-cernica', '/decoratiuni-baloane-cernica/', 'location', 'Decoratiuni Baloane Cernica', 'Decoratiuni Baloane Cernica', 'Decoratiuni Baloane Cernica – Montaj Rapid', 'Cauți decorațiuni cu baloane în Cernica? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-afumati/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-afumati', '/decoratiuni-baloane-afumati/', 'location', 'Decoratiuni Baloane Afumati', 'Decoratiuni Baloane Afumati', 'Decoratiuni Baloane Afumati – Montaj Rapid', 'Cauți decorațiuni cu baloane în Afumati? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-stefanestii-de-jos/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-stefanestii-de-jos', '/decoratiuni-baloane-stefanestii-de-jos/', 'location', 'Decoratiuni Baloane Stefanestii De Jos', 'Decoratiuni Baloane Stefanestii De Jos', 'Decoratiuni Baloane Stefanestii De Jos – Montaj Rapid', 'Cauți decorațiuni cu baloane în Stefanestii De Jos? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-dascalu/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dascalu', '/decoratiuni-baloane-dascalu/', 'location', 'Decoratiuni Baloane Dascalu', 'Decoratiuni Baloane Dascalu', 'Decoratiuni Baloane Dascalu – Montaj Rapid', 'Cauți decorațiuni cu baloane în Dascalu? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-snagov/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-snagov', '/decoratiuni-baloane-snagov/', 'location', 'Decoratiuni Baloane Snagov', 'Decoratiuni Baloane Snagov', 'Decoratiuni Baloane Snagov – Montaj Rapid', 'Cauți decorațiuni cu baloane în Snagov? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-clinceni/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-clinceni', '/decoratiuni-baloane-clinceni/', 'location', 'Decoratiuni Baloane Clinceni', 'Decoratiuni Baloane Clinceni', 'Decoratiuni Baloane Clinceni – Montaj Rapid', 'Cauți decorațiuni cu baloane în Clinceni? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-dragomiresti-vale/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-dragomiresti-vale', '/decoratiuni-baloane-dragomiresti-vale/', 'location', 'Decoratiuni Baloane Dragomiresti Vale', 'Decoratiuni Baloane Dragomiresti Vale', 'Decoratiuni Baloane Dragomiresti Vale – Montaj Rapid', 'Cauți decorațiuni cu baloane în Dragomiresti Vale? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-jilava/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-jilava', '/decoratiuni-baloane-jilava/', 'location', 'Decoratiuni Baloane Jilava', 'Decoratiuni Baloane Jilava', 'Decoratiuni Baloane Jilava – Montaj Rapid', 'Cauți decorațiuni cu baloane în Jilava? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /decoratiuni-baloane-1-decembrie/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-1-decembrie', '/decoratiuni-baloane-1-decembrie/', 'location', 'Decoratiuni Baloane 1 Decembrie', 'Decoratiuni Baloane 1 Decembrie', 'Decoratiuni Baloane 1 Decembrie – Montaj Rapid', 'Cauți decorațiuni cu baloane în 1 Decembrie? Oferim arcade, baloane cu heliu, panouri foto și montaj la locație.', NULL, 0.7, 'draft', 'noindex', false)
    RETURNING id INTO v_page_id;

    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'hero', 1);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'intro', 2);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'available_services', 3);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'nearby_areas', 4);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'gallery', 5);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'pricing', 6);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'transport_info', 7);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'faq', 8);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'related_pages', 9);
    INSERT INTO kassia_page_sections (page_id, section_key, sort_order)
    VALUES (v_page_id, 'final_cta', 10);

    -- Page: /arcada-baloane-botez-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-botez-bucuresti', '/arcada-baloane-botez-bucuresti/', 'satellite', 'Arcada Baloane Botez Bucuresti', 'Arcada Baloane Botez Bucuresti', 'Arcada Baloane Botez Bucuresti – Kassia Decor', 'Oferim arcada baloane botez bucuresti cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.', NULL, 0.6, 'draft', 'noindex', false)
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

    -- Page: /arcada-baloane-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-majorat-bucuresti', '/arcada-baloane-majorat-bucuresti/', 'satellite', 'Arcada Baloane Majorat Bucuresti', 'Arcada Baloane Majorat Bucuresti', 'Arcada Baloane Majorat Bucuresti – Kassia Decor', 'Oferim arcada baloane majorat bucuresti cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.', NULL, 0.6, 'draft', 'noindex', false)
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

    -- Page: /arcada-baloane-nunta-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('arcada-baloane-nunta-bucuresti', '/arcada-baloane-nunta-bucuresti/', 'satellite', 'Arcada Baloane Nunta Bucuresti', 'Arcada Baloane Nunta Bucuresti', 'Arcada Baloane Nunta Bucuresti – Kassia Decor', 'Oferim arcada baloane nunta bucuresti cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.', NULL, 0.6, 'draft', 'noindex', false)
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

    -- Page: /panou-foto-baloane-botez-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('panou-foto-baloane-botez-bucuresti', '/panou-foto-baloane-botez-bucuresti/', 'satellite', 'Panou Foto Baloane Botez Bucuresti', 'Panou Foto Baloane Botez Bucuresti', 'Panou Foto Baloane Botez Bucuresti – Kassia Decor', 'Oferim panou foto baloane botez bucuresti cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.', NULL, 0.6, 'draft', 'noindex', false)
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

    -- Page: /panou-foto-baloane-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('panou-foto-baloane-majorat-bucuresti', '/panou-foto-baloane-majorat-bucuresti/', 'satellite', 'Panou Foto Baloane Majorat Bucuresti', 'Panou Foto Baloane Majorat Bucuresti', 'Panou Foto Baloane Majorat Bucuresti – Kassia Decor', 'Oferim panou foto baloane majorat bucuresti cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.', NULL, 0.6, 'draft', 'noindex', false)
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

    -- Page: /baloane-heliu-majorat-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-majorat-bucuresti', '/baloane-heliu-majorat-bucuresti/', 'satellite', 'Baloane Heliu Majorat Bucuresti', 'Baloane Heliu Majorat Bucuresti', 'Baloane Heliu Majorat Bucuresti – Kassia Decor', 'Oferim baloane heliu majorat bucuresti cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.', NULL, 0.6, 'draft', 'noindex', false)
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

    -- Page: /baloane-heliu-aniversare-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('baloane-heliu-aniversare-bucuresti', '/baloane-heliu-aniversare-bucuresti/', 'satellite', 'Baloane Heliu Aniversare Bucuresti', 'Baloane Heliu Aniversare Bucuresti', 'Baloane Heliu Aniversare Bucuresti – Kassia Decor', 'Oferim baloane heliu aniversare bucuresti cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.', NULL, 0.6, 'draft', 'noindex', false)
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

    -- Page: /buchete-baloane-aniversare-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('buchete-baloane-aniversare-bucuresti', '/buchete-baloane-aniversare-bucuresti/', 'satellite', 'Buchete Baloane Aniversare Bucuresti', 'Buchete Baloane Aniversare Bucuresti', 'Buchete Baloane Aniversare Bucuresti – Kassia Decor', 'Oferim buchete baloane aniversare bucuresti cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.', NULL, 0.6, 'draft', 'noindex', false)
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

    -- Page: /decoratiuni-baloane-roz-auriu-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-roz-auriu-bucuresti', '/decoratiuni-baloane-roz-auriu-bucuresti/', 'satellite', 'Decoratiuni Baloane Roz Auriu Bucuresti', 'Decoratiuni Baloane Roz Auriu Bucuresti', 'Decoratiuni Baloane Roz Auriu Bucuresti – Kassia Decor', 'Oferim decoratiuni baloane roz auriu bucuresti cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.', NULL, 0.6, 'draft', 'noindex', false)
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

    -- Page: /decoratiuni-baloane-alb-auriu-bucuresti/
    INSERT INTO kassia_pages (slug, path, page_type, title, h1, meta_title, meta_description, canonical_url, priority, status, index_status, include_in_sitemap)
    VALUES ('decoratiuni-baloane-alb-auriu-bucuresti', '/decoratiuni-baloane-alb-auriu-bucuresti/', 'satellite', 'Decoratiuni Baloane Alb Auriu Bucuresti', 'Decoratiuni Baloane Alb Auriu Bucuresti', 'Decoratiuni Baloane Alb Auriu Bucuresti – Kassia Decor', 'Oferim decoratiuni baloane alb auriu bucuresti cu montaj inclus în București. Pachete personalizate pentru evenimentul tău.', NULL, 0.6, 'draft', 'noindex', false)
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

END $$;
