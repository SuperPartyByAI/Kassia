BEGIN;
DO $$
DECLARE
    v_page_id UUID;
    v_hub_id UUID;
    v_src UUID;
    v_tgt UUID;
BEGIN
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-6/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-6/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-6/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-6/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aviatiei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aviatiei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aviatiei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aviatiei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aviatiei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baneasa/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baneasa/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baneasa/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baneasa/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baneasa/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-domenii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-domenii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-domenii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-domenii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-domenii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-herastrau/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-herastrau/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-herastrau/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-herastrau/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-herastrau/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-victoriei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-victoriei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-victoriei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-victoriei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-victoriei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-colentina/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-colentina/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-colentina/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-colentina/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-colentina/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-obor/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-obor/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-obor/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-obor/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-obor/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefan-cel-mare/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefan-cel-mare/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefan-cel-mare/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefan-cel-mare/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefan-cel-mare/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dristor/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dristor/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dristor/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dristor/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dristor/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-titan/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-titan/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-titan/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-titan/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-titan/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-vitan/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-vitan/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-vitan/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-vitan/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-vitan/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-unirii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-unirii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-unirii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-unirii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-unirii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dudesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dudesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dudesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dudesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dudesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tineretului/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tineretului/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tineretului/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tineretului/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tineretului/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-piata-sudului/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-piata-sudului/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-piata-sudului/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-piata-sudului/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-piata-sudului/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aparatorii-patriei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aparatorii-patriei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aparatorii-patriei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aparatorii-patriei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aparatorii-patriei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-oltenitei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-oltenitei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-oltenitei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-oltenitei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-oltenitei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-rahova/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-rahova/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-rahova/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-rahova/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-rahova/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cotroceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cotroceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cotroceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cotroceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cotroceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-13-septembrie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-13-septembrie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-13-septembrie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-13-septembrie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-13-septembrie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-ferentari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-ferentari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-ferentari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-ferentari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-ferentari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sebastian/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sebastian/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sebastian/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sebastian/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sebastian/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-drumul-taberei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-drumul-taberei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-drumul-taberei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-drumul-taberei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-drumul-taberei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-militari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-militari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-militari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-militari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-militari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-crangasi/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-crangasi/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-crangasi/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-crangasi/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-crangasi/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-giulesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-giulesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-giulesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-giulesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-giulesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-grozavesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-grozavesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-grozavesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-grozavesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-grozavesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-voluntari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-voluntari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-voluntari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-voluntari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-voluntari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pipera/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pipera/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pipera/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pipera/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pipera/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-otopeni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-otopeni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-otopeni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-otopeni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-otopeni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tunari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tunari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tunari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tunari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-tunari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corbeanca/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corbeanca/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corbeanca/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corbeanca/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corbeanca/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-balotesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-balotesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-balotesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-balotesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-balotesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mogosoaia/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mogosoaia/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mogosoaia/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mogosoaia/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mogosoaia/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-chitila/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-chitila/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-chitila/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-chitila/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-chitila/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-chiajna/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-chiajna/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-chiajna/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-chiajna/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-chiajna/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-domnesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-domnesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-domnesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-domnesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-domnesti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bragadiru/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bragadiru/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bragadiru/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bragadiru/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bragadiru/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-magurele/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-magurele/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-magurele/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-magurele/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-magurele/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-popesti-leordeni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-popesti-leordeni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-popesti-leordeni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-popesti-leordeni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-popesti-leordeni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-berceni-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-ilfov/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni Ilfov') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni Ilfov');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-pantelimon-ilfov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-ilfov/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni Ilfov') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni Ilfov');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cernica/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cernica/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cernica/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cernica/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cernica/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-afumati/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-afumati/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-afumati/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-afumati/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-afumati/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefanestii-de-jos/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefanestii-de-jos/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefanestii-de-jos/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefanestii-de-jos/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-stefanestii-de-jos/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dascalu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dascalu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dascalu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dascalu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dascalu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-snagov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-snagov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-snagov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-snagov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-snagov/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-clinceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-clinceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-clinceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-clinceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-clinceni/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dragomiresti-vale/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dragomiresti-vale/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dragomiresti-vale/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dragomiresti-vale/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;

END $$;
COMMIT;
