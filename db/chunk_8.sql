BEGIN;
DO $$
DECLARE
    v_page_id UUID;
    v_hub_id UUID;
    v_src UUID;
    v_tgt UUID;
BEGIN
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/aranjamente-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'aranjamente baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'aranjamente baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane personalizate bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane personalizate bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-cifre-litere-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane cifre litere bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane cifre litere bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/ghirlande-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'ghirlande baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'ghirlande baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/stalpi-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'stalpi baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'stalpi baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/perete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'perete baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'perete baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decor-baloane-candy-bar-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decor baloane candy bar bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decor baloane candy bar bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/livrare-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'livrare baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'livrare baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane botez bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane botez bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane nunta bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane nunta bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-1/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane sector 1') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane sector 1');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-ilfov/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane ilfov') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane ilfov');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie decor') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie decor');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact rapid') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact rapid');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/aranjamente-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/aranjamente-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/aranjamente-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/aranjamente-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/aranjamente-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/aranjamente-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-cifre-litere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-cifre-litere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-cifre-litere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-cifre-litere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-cifre-litere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-cifre-litere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/ghirlande-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/ghirlande-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/ghirlande-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/ghirlande-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/ghirlande-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/ghirlande-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/stalpi-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/stalpi-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/stalpi-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/stalpi-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/stalpi-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/stalpi-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/perete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/perete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/perete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/perete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/perete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/perete-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decor-baloane-candy-bar-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decor-baloane-candy-bar-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decor-baloane-candy-bar-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decor-baloane-candy-bar-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decor-baloane-candy-bar-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decor-baloane-candy-bar-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/livrare-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/livrare-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'cere ofertă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'cere ofertă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/livrare-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'verifică prețurile') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'verifică prețurile');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/livrare-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'vezi galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'vezi galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/livrare-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/livrare-baloane-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mot-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mot-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mot-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mot-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mot-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-mot-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-turta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-turta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-turta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-turta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-turta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-turta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-8-martie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-8-martie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-8-martie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-8-martie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-8-martie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-8-martie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cununie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cununie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cununie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cununie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cununie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-cununie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-petrecere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-petrecere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-petrecere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-petrecere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-petrecere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-petrecere-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corporate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corporate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corporate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corporate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corporate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-corporate-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-lansare-produs-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-lansare-produs-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-lansare-produs-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-lansare-produs-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-lansare-produs-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-lansare-produs-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-showroom-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-showroom-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-showroom-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-showroom-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-showroom-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-showroom-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gradinita-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gradinita-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gradinita-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gradinita-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gradinita-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gradinita-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-scoala-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-scoala-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-scoala-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-scoala-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-scoala-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-scoala-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baby-shower-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baby-shower-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baby-shower-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baby-shower-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baby-shower-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-baby-shower-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gender-reveal-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gender-reveal-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gender-reveal-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gender-reveal-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gender-reveal-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-gender-reveal-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-craciun-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-craciun-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-craciun-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-craciun-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-craciun-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-craciun-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-revelion-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-revelion-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-revelion-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-revelion-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-revelion-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-revelion-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-paste-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-paste-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-paste-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-paste-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-paste-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-paste-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-halloween-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-halloween-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-halloween-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-halloween-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-halloween-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-halloween-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-iunie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-iunie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-iunie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-iunie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-iunie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-iunie-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-absolvire-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-absolvire-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contactează-ne') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contactează-ne');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-absolvire-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie evenimente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie evenimente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-absolvire-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-absolvire-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-absolvire-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-1/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-1/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-1/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-1/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-1/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-2/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-2/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-2/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-2/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-2/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-3/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-3/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-3/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-3/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-3/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-4/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-4/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-4/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-4/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-4/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-5/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-5/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-5/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-5/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-5/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-sector-6/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;

END $$;
COMMIT;
