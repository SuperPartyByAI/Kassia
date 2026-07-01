CREATE TABLE IF NOT EXISTS kassia_seo_map (
  page_id UUID PRIMARY KEY REFERENCES kassia_pages(id) ON DELETE CASCADE,
  main_keyword VARCHAR(255),
  search_intent VARCHAR(50),
  parent_path VARCHAR(255),
  commercial_target VARCHAR(255),
  forbidden_primary_keywords TEXT,
  canonical_strategy VARCHAR(50)
);

ALTER TABLE kassia_page_sections DROP CONSTRAINT IF EXISTS check_section_type;
NOTIFY pgrst, 'reload schema';
