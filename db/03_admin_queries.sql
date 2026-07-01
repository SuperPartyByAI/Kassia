-- Pagini draft
SELECT slug, path, page_type, title FROM pages WHERE status = 'draft';

-- Pagini publicate
SELECT slug, path, page_type, title, published_at FROM pages WHERE status = 'published';

-- Pagini noindex
SELECT slug, path, page_type, title FROM pages WHERE index_status = 'noindex';

-- Pagini fără meta_description
SELECT slug, path, page_type, title FROM pages WHERE meta_description IS NULL OR meta_description = '';

-- Pagini fără H1
SELECT slug, path, page_type, title FROM pages WHERE h1 IS NULL OR h1 = '';

-- Pagini fără FAQ (pentru service, event, location, satellite)
SELECT p.slug, p.path, p.page_type 
FROM pages p
LEFT JOIN faqs f ON p.id = f.page_id
WHERE p.page_type IN ('service', 'event', 'location', 'satellite')
  AND f.id IS NULL;

-- Pagini incluse în sitemap
SELECT slug, path, updated_at, priority FROM pages WHERE include_in_sitemap = true;

-- Pagini pregătite de publicare (draft dar cu toate cerințele SEO)
SELECT p.slug, p.path, p.page_type, p.title
FROM pages p
WHERE p.status = 'draft'
  AND p.h1 IS NOT NULL AND p.h1 != ''
  AND p.meta_title IS NOT NULL AND p.meta_title != ''
  AND p.meta_description IS NOT NULL AND p.meta_description != ''
  AND (
      SELECT COUNT(*) FROM page_sections ps WHERE ps.page_id = p.id AND ps.is_active = true
  ) >= 5
  AND EXISTS (
      SELECT 1 FROM page_sections ps WHERE ps.page_id = p.id AND ps.is_active = true AND ps.section_key ILIKE '%cta%'
  )
  AND (
      p.page_type = 'support' OR EXISTS (SELECT 1 FROM faqs f WHERE f.page_id = p.id)
  );

-- Linkuri interne care pornesc dintr-o anumită pagină (modifică '/decoratiuni-baloane-bucuresti/' cu path-ul dorit)
SELECT 
    p1.path as source_path, 
    p2.path as target_path, 
    il.anchor_text, 
    il.link_type, 
    p2.status as target_status
FROM internal_links il
JOIN pages p1 ON il.source_page_id = p1.id
JOIN pages p2 ON il.target_page_id = p2.id
WHERE p1.path = '/decoratiuni-baloane-bucuresti/';
