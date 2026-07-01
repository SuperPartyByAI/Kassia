-- ============================================================================
-- 2. CREATE CORRECT FUNCTIONS (Cu prefix 'kassia_' și care scriu în 'kassia_pages')
-- ============================================================================
-- Function to generate sitemap entries (Only published & indexed)
CREATE OR REPLACE FUNCTION kassia_get_sitemap_entries(domain_url TEXT DEFAULT 'https://www.kassia.ro')
RETURNS TABLE (
    url TEXT,
    lastmod TIMESTAMP WITH TIME ZONE,
    priority DECIMAL(2,1)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        CASE 
            WHEN path = '/' THEN domain_url
            ELSE domain_url || path
        END as url,
        updated_at as lastmod,
        p.priority
    FROM kassia_pages p
    WHERE status = 'published'
      AND index_status = 'index'
      AND include_in_sitemap = true;
END;
$$ LANGUAGE plpgsql;

-- Function to get robots meta tag for a page
CREATE OR REPLACE FUNCTION kassia_get_robots_meta(page_id UUID)
RETURNS TEXT AS $$
DECLARE
    idx_status TEXT;
BEGIN
    SELECT index_status::TEXT INTO idx_status FROM kassia_pages WHERE id = page_id;
    IF idx_status = 'index' THEN
        RETURN 'index, follow';
    ELSE
        RETURN 'noindex, follow';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Function to get canonical URL
CREATE OR REPLACE FUNCTION kassia_get_canonical_url(page_id UUID, domain_url TEXT DEFAULT 'https://www.kassia.ro')
RETURNS TEXT AS $$
DECLARE
    can_url TEXT;
    page_path TEXT;
BEGIN
    SELECT canonical_url, path INTO can_url, page_path FROM kassia_pages WHERE id = page_id;
    IF can_url IS NOT NULL AND can_url != '' THEN
        RETURN can_url;
    END IF;
    
    IF page_path = '/' THEN
        RETURN domain_url;
    ELSE
        RETURN domain_url || page_path;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Function to publish a page
CREATE OR REPLACE FUNCTION kassia_publish_page(target_page_id UUID)
RETURNS VOID AS $$
DECLARE
    sections_count INT;
    has_cta BOOLEAN;
    has_faq BOOLEAN;
    p_type VARCHAR;
BEGIN
    -- Validation: check if page exists and get type
    SELECT page_type INTO p_type FROM kassia_pages WHERE id = target_page_id;
    
    IF p_type IS NULL THEN
        RAISE EXCEPTION 'Page not found';
    END IF;

    -- Validation: h1, meta_title, meta_description
    IF EXISTS (
        SELECT 1 FROM kassia_pages 
        WHERE id = target_page_id 
          AND (h1 IS NULL OR h1 = '' OR meta_title IS NULL OR meta_title = '' OR meta_description IS NULL OR meta_description = '')
    ) THEN
        RAISE EXCEPTION 'Page is missing required SEO fields (h1, meta_title, meta_description)';
    END IF;

    -- Validation: minimum 5 active sections
    SELECT COUNT(*) INTO sections_count FROM kassia_page_sections WHERE page_id = target_page_id AND is_active = true;
    IF sections_count < 5 AND p_type != 'support' THEN
        RAISE EXCEPTION 'Page must have at least 5 active sections';
    END IF;

    -- Validation: at least one CTA section
    SELECT EXISTS (SELECT 1 FROM kassia_page_sections WHERE page_id = target_page_id AND is_active = true AND section_key ILIKE '%cta%') INTO has_cta;
    IF NOT has_cta AND p_type != 'support' THEN
        RAISE EXCEPTION 'Page must have at least one active CTA section';
    END IF;

    -- Validation: FAQ for service/event/location/satellite
    IF p_type IN ('service', 'event', 'location', 'satellite') THEN
        SELECT EXISTS (SELECT 1 FROM kassia_faqs WHERE page_id = target_page_id) INTO has_faq;
        IF NOT has_faq THEN
            RAISE EXCEPTION 'Service, Event, Satellite, and Location kassia_pages must have at least one FAQ item';
        END IF;
    END IF;

    -- Update the page (trigger will handle updated_at automatically)
    UPDATE kassia_pages
    SET status = 'published',
        index_status = 'index',
        include_in_sitemap = true,
        published_at = NOW()
    WHERE id = target_page_id;
END;
$$ LANGUAGE plpgsql;

-- Function to unpublish / remove from index
CREATE OR REPLACE FUNCTION kassia_unpublish_page(target_page_id UUID)
RETURNS VOID AS $$
BEGIN
    -- trigger handles updated_at
    UPDATE kassia_pages
    SET index_status = 'noindex',
        include_in_sitemap = false
    WHERE id = target_page_id;
END;
$$ LANGUAGE plpgsql;
