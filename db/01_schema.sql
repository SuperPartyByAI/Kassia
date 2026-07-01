-- Schema Supabase Kassia SEO CMS

CREATE TYPE kassia_page_status AS ENUM ('draft', 'published', 'archived');
CREATE TYPE kassia_index_status_type AS ENUM ('noindex', 'index');

-- Trigger function for updated_at
CREATE OR REPLACE FUNCTION kassia_update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TABLE kassia_pages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug VARCHAR(255) UNIQUE NOT NULL,
    path VARCHAR(255) UNIQUE NOT NULL,
    page_type VARCHAR(50) NOT NULL, -- 'support', 'service', 'event', 'location', 'satellite'
    status kassia_page_status DEFAULT 'draft' NOT NULL,
    index_status kassia_index_status_type DEFAULT 'noindex' NOT NULL,
    include_in_sitemap BOOLEAN DEFAULT false NOT NULL,
    
    title VARCHAR(255) NOT NULL,
    h1 VARCHAR(255) NOT NULL,
    meta_title VARCHAR(100) NOT NULL,
    meta_description VARCHAR(255) NOT NULL,
    canonical_url VARCHAR(255),
    
    parent_page_id UUID REFERENCES kassia_pages(id) ON DELETE SET NULL,
    
    service_type VARCHAR(100),
    event_type VARCHAR(100),
    location_type VARCHAR(50), -- 'sector', 'cartier', 'ilfov'
    city VARCHAR(100),
    sector VARCHAR(50),
    neighborhood VARCHAR(100),
    
    priority DECIMAL(2,1) DEFAULT 0.5 NOT NULL,
    
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    published_at TIMESTAMP WITH TIME ZONE,
    
    CONSTRAINT check_slug CHECK (slug ~ '^[a-z0-9-]+$' OR slug = 'home'),
    CONSTRAINT check_path CHECK ((path LIKE '/%/' AND path != '//') OR path = '/')
);

CREATE TRIGGER update_pages_modtime
BEFORE UPDATE ON kassia_pages
FOR EACH ROW EXECUTE PROCEDURE kassia_update_updated_at_column();

CREATE TABLE kassia_page_sections (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    page_id UUID NOT NULL REFERENCES kassia_pages(id) ON DELETE CASCADE,
    section_key VARCHAR(50) NOT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    heading VARCHAR(255),
    subheading VARCHAR(255),
    body TEXT,
    cta_text VARCHAR(100),
    cta_url VARCHAR(255),
    is_active BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TRIGGER update_page_sections_modtime
BEFORE UPDATE ON kassia_page_sections
FOR EACH ROW EXECUTE PROCEDURE kassia_update_updated_at_column();

CREATE TABLE kassia_faqs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    page_id UUID NOT NULL REFERENCES kassia_pages(id) ON DELETE CASCADE,
    question VARCHAR(255) NOT NULL,
    answer TEXT NOT NULL,
    sort_order INT DEFAULT 0,
    include_in_schema BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TRIGGER update_faqs_modtime
BEFORE UPDATE ON kassia_faqs
FOR EACH ROW EXECUTE PROCEDURE kassia_update_updated_at_column();

CREATE TABLE kassia_gallery_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    page_id UUID NOT NULL REFERENCES kassia_pages(id) ON DELETE CASCADE,
    image_url TEXT NOT NULL,
    alt_text VARCHAR(255) NOT NULL,
    sort_order INT DEFAULT 0,
    is_featured BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TRIGGER update_gallery_items_modtime
BEFORE UPDATE ON kassia_gallery_items
FOR EACH ROW EXECUTE PROCEDURE kassia_update_updated_at_column();

CREATE TABLE kassia_internal_links (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    source_page_id UUID NOT NULL,
    target_page_id UUID NOT NULL,
    anchor_text VARCHAR(255) NOT NULL,
    link_type VARCHAR(50) DEFAULT 'contextual',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    CONSTRAINT internal_links_source_page_id_fkey 
        FOREIGN KEY (source_page_id) REFERENCES kassia_pages(id) ON DELETE CASCADE,
    CONSTRAINT internal_links_target_page_id_fkey 
        FOREIGN KEY (target_page_id) REFERENCES kassia_pages(id) ON DELETE CASCADE,
        
    CONSTRAINT no_self_link CHECK (source_page_id <> target_page_id),
    UNIQUE(source_page_id, target_page_id, anchor_text)
);

CREATE TRIGGER update_internal_links_modtime
BEFORE UPDATE ON kassia_internal_links
FOR EACH ROW EXECUTE PROCEDURE kassia_update_updated_at_column();

CREATE TABLE kassia_services (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TRIGGER update_services_modtime
BEFORE UPDATE ON kassia_services
FOR EACH ROW EXECUTE PROCEDURE kassia_update_updated_at_column();

CREATE TABLE kassia_events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TRIGGER update_events_modtime
BEFORE UPDATE ON kassia_events
FOR EACH ROW EXECUTE PROCEDURE kassia_update_updated_at_column();

CREATE TABLE kassia_locations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TRIGGER update_locations_modtime
BEFORE UPDATE ON kassia_locations
FOR EACH ROW EXECUTE PROCEDURE kassia_update_updated_at_column();

CREATE TABLE kassia_pricing_packages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    page_id UUID NOT NULL REFERENCES kassia_pages(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    features JSONB NOT NULL DEFAULT '[]',
    is_popular BOOLEAN DEFAULT false,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TRIGGER update_pricing_packages_modtime
BEFORE UPDATE ON kassia_pricing_packages
FOR EACH ROW EXECUTE PROCEDURE kassia_update_updated_at_column();

-- Indexes
CREATE INDEX idx_pages_slug ON kassia_pages(slug);
CREATE INDEX idx_pages_path ON kassia_pages(path);
CREATE INDEX idx_pages_seo_status ON kassia_pages(status, index_status, include_in_sitemap);
CREATE INDEX idx_pages_type ON kassia_pages(page_type);
CREATE INDEX idx_page_sections_page_order ON kassia_page_sections(page_id, sort_order);
CREATE INDEX idx_faqs_page ON kassia_faqs(page_id);
CREATE INDEX idx_gallery_items_page ON kassia_gallery_items(page_id);
CREATE INDEX idx_internal_links_source ON kassia_internal_links(source_page_id);
CREATE INDEX idx_internal_links_target ON kassia_internal_links(target_page_id);
