-- KASSIA SCHEMA SYNC V5.4
-- PREPARES LIVE DB COLUMNS FOR SEEDING.

BEGIN;

DO $$
BEGIN
    -- kassia_pages columns
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='kassia_pages' AND column_name='main_keyword') THEN
        ALTER TABLE kassia_pages ADD COLUMN main_keyword VARCHAR(255);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='kassia_pages' AND column_name='search_intent') THEN
        ALTER TABLE kassia_pages ADD COLUMN search_intent VARCHAR(50);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='kassia_pages' AND column_name='parent_page_id') THEN
        ALTER TABLE kassia_pages ADD COLUMN parent_page_id UUID REFERENCES kassia_pages(id) ON DELETE SET NULL;
    END IF;

    -- kassia_faqs columns
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='kassia_faqs' AND column_name='include_in_schema') THEN
        ALTER TABLE kassia_faqs ADD COLUMN include_in_schema BOOLEAN DEFAULT true;
    END IF;

    -- kassia_gallery_items columns
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='kassia_gallery_items' AND column_name='slot_key') THEN
        ALTER TABLE kassia_gallery_items ADD COLUMN slot_key VARCHAR(50);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='kassia_gallery_items' AND column_name='label_owner') THEN
        ALTER TABLE kassia_gallery_items ADD COLUMN label_owner VARCHAR(50);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='kassia_gallery_items' AND column_name='is_required') THEN
        ALTER TABLE kassia_gallery_items ADD COLUMN is_required BOOLEAN DEFAULT false;
    END IF;

    -- kassia_internal_links columns
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='kassia_internal_links' AND column_name='link_type') THEN
        ALTER TABLE kassia_internal_links ADD COLUMN link_type VARCHAR(50) DEFAULT 'contextual';
    END IF;

    -- PREFLIGHT UNIQUE CONSTRAINTS
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'unique_kassia_pages_path' OR conname = 'kassia_pages_path_key') THEN
        IF EXISTS (SELECT path FROM kassia_pages GROUP BY path HAVING COUNT(*) > 1) THEN
            RAISE EXCEPTION 'Duplicates found in kassia_pages(path). Cannot add constraint.';
        END IF;
        ALTER TABLE kassia_pages ADD CONSTRAINT unique_kassia_pages_path UNIQUE(path);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'unique_page_section') THEN
        IF EXISTS (SELECT page_id, section_type FROM kassia_page_sections GROUP BY page_id, section_type HAVING COUNT(*) > 1) THEN
            RAISE EXCEPTION 'Duplicates found in kassia_page_sections. Cannot add constraint.';
        END IF;
        ALTER TABLE kassia_page_sections ADD CONSTRAINT unique_page_section UNIQUE(page_id, section_type);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'unique_page_faq') THEN
        IF EXISTS (SELECT page_id, order_index FROM kassia_faqs GROUP BY page_id, order_index HAVING COUNT(*) > 1) THEN
            RAISE EXCEPTION 'Duplicates found in kassia_faqs. Cannot add constraint.';
        END IF;
        ALTER TABLE kassia_faqs ADD CONSTRAINT unique_page_faq UNIQUE(page_id, order_index);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'unique_page_slot') THEN
        IF EXISTS (SELECT page_id, slot_key FROM kassia_gallery_items GROUP BY page_id, slot_key HAVING COUNT(*) > 1) THEN
            RAISE EXCEPTION 'Duplicates found in kassia_gallery_items. Cannot add constraint.';
        END IF;
        ALTER TABLE kassia_gallery_items ADD CONSTRAINT unique_page_slot UNIQUE(page_id, slot_key);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'unique_internal_links' OR conname = 'kassia_internal_links_source_page_id_target_page_id_anchor__key') THEN
        IF EXISTS (SELECT source_page_id, target_page_id, anchor_text FROM kassia_internal_links GROUP BY source_page_id, target_page_id, anchor_text HAVING COUNT(*) > 1) THEN
            RAISE EXCEPTION 'Duplicates found in kassia_internal_links. Cannot add constraint.';
        END IF;
        ALTER TABLE kassia_internal_links ADD CONSTRAINT unique_internal_links UNIQUE(source_page_id, target_page_id, anchor_text);
    END IF;
END $$;

COMMIT;
