BEGIN;
DO $$
DECLARE
    v_page_id UUID;
    v_hub_id UUID;
    v_src UUID;
    v_tgt UUID;
BEGIN
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-dragomiresti-vale/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-jilava/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-jilava/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-jilava/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-jilava/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-jilava/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-decembrie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane București') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane București');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-decembrie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'comandă acum') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'comandă acum');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-decembrie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade din baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade din baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-decembrie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-1-decembrie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'înapoi la eveniment') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'înapoi la eveniment');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'rezervă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'rezervă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'înapoi la eveniment') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'înapoi la eveniment');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'rezervă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'rezervă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'înapoi la eveniment') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'înapoi la eveniment');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-nunta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcadă baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcadă baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'rezervă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'rezervă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/arcada-baloane-nunta-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcade baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcade baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'înapoi la eveniment') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'înapoi la eveniment');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'rezervă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'rezervă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-botez-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'înapoi la eveniment') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'înapoi la eveniment');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'rezervă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'rezervă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/panou-foto-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panouri foto') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panouri foto');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'înapoi la eveniment') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'înapoi la eveniment');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'rezervă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'rezervă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-majorat-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-aniversare-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'înapoi la eveniment') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'înapoi la eveniment');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-aniversare-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-aniversare-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-aniversare-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'rezervă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'rezervă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/baloane-heliu-aniversare-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/buchete-baloane-aniversare-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'înapoi la eveniment') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'înapoi la eveniment');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-aniversare-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/buchete-baloane-aniversare-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/buchete-baloane-aniversare-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'rezervă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'rezervă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/buchete-baloane-aniversare-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-roz-auriu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-roz-auriu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'rezervă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'rezervă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-roz-auriu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/galerie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-roz-auriu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane roz auriu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane roz auriu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-alb-auriu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decorațiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decorațiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-alb-auriu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'rezervă') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'rezervă');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/decoratiuni-baloane-alb-auriu-bucuresti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/galerie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-alb-auriu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane alb auriu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane alb auriu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-decoratiunile-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'preturi decoratiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'preturi decoratiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-decoratiunile-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-decoratiunile-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'preturi decoratiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'preturi decoratiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-baloanele-cu-heliu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-baloanele-cu-heliu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-baloanele-cu-heliu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'preturi decoratiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'preturi decoratiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-baloanele-cu-heliu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-panou-foto-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-panou-foto-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-panou-foto-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane botez bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane botez bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane botez bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane botez bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'preturi decoratiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'preturi decoratiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-botez/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane nunta bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane nunta bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-nunta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane nunta bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane nunta bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'preturi decoratiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'preturi decoratiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-costa-un-decor-de-baloane-pentru-nunta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-include-un-pachet-decor-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-include-un-pachet-decor-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'preturi decoratiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'preturi decoratiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-include-un-pachet-decor-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-include-un-pachet-decor-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'preturi decoratiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'preturi decoratiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-alegi-pachetul-de-decoratiuni-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-alegi-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-alegi-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-alegi-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/arcada-baloane-organica-sau-clasica/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/arcada-baloane-organica-sau-clasica/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/arcada-baloane-organica-sau-clasica/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-dimensiune-trebuie-sa-aiba-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/unde-se-poate-monta-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-rezista-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-rezista-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cat-rezista-o-arcada-de-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-arcada-baloane-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-arcada-baloane-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-arcada-baloane-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane botez bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane botez bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-arcada-baloane-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane nunta bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane nunta bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-arcada-baloane-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-heliu-cat-rezista/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-heliu-cat-rezista/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-heliu-cat-rezista/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-heliu-latex-sau-folie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-heliu-latex-sau-folie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane personalizate bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane personalizate bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-heliu-latex-sau-folie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cate-baloane-cu-heliu-sunt-necesare-pentru-o-camera/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-se-transporta-baloanele-cu-heliu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-se-transporta-baloanele-cu-heliu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/livrare-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'livrare baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'livrare baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-se-transporta-baloanele-cu-heliu/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-cu-heliu-pentru-copii-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-cu-heliu-pentru-copii-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane aniversare copii bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane aniversare copii bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-cu-heliu-pentru-copii-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-cu-heliu-pentru-majorat-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-cu-heliu-pentru-majorat-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane majorat bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane majorat bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-cu-heliu-pentru-majorat-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu majorat bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu majorat bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-cu-heliu-pentru-majorat-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-botez/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane botez bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane botez bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-botez/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane botez bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane botez bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-botez/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto baloane botez bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto baloane botez bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-botez/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-mot-si-turta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-mot-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane mot bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane mot bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-mot-si-turta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-turta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane turta bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane turta bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-mot-si-turta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-mot-si-turta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-nunta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-nunta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane nunta bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane nunta bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-nunta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-nunta-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane nunta bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane nunta bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-nunta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-nunta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-cununie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-cununie-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane cununie bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane cununie bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-cununie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-cununie/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-majorat/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane majorat bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane majorat bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-majorat/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane majorat bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane majorat bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-majorat/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu majorat bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu majorat bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-majorat/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-copii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane aniversare copii bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane aniversare copii bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-copii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-copii/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-adulti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane aniversare adulti bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane aniversare adulti bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-adulti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-adulti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-adulti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-baby-shower/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-baby-shower-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane baby shower bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane baby shower bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-baby-shower/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane personalizate bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane personalizate bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-baby-shower/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-gender-reveal/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-gender-reveal-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane gender reveal bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane gender reveal bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-gender-reveal/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane personalizate bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane personalizate bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-gender-reveal/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-gender-reveal/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-corporate/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-corporate-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane corporate bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane corporate bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-corporate/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane deschidere magazin bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane deschidere magazin bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-corporate/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-alegi-culorile-pentru-decorul-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-roz-auriu-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-roz-auriu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane roz auriu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane roz auriu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-roz-auriu-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-roz-auriu-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-alb-auriu-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-alb-auriu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane alb auriu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane alb auriu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-alb-auriu-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-alb-auriu-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-pastel-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-pastel-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-pastel-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-luxury-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-luxury-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-luxury-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-minimalist-sau-spectaculos/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-minimalist-sau-spectaculos/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/galerie/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'galerie') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'galerie');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/decor-baloane-minimalist-sau-spectaculos/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-comanzi-decoratiuni-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-comanzi-decoratiuni-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-comanzi-decoratiuni-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'preturi decoratiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'preturi decoratiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cu-cat-timp-inainte-se-comanda-decorul-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/intrebari-frecvente/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'intrebari frecvente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'intrebari frecvente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/preturi-decoratiuni-baloane/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'preturi decoratiuni baloane') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'preturi decoratiuni baloane');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-informatii-trebuie-sa-trimiti-pentru-o-oferta/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cum-se-face-montajul-decoratiunilor-cu-baloane/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/se-pot-monta-decoratiuni-cu-baloane-in-exterior/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/intrebari-frecvente/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'intrebari frecvente') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'intrebari frecvente');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/ce-se-intampla-cu-decorul-dupa-eveniment/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/panou-foto-cu-baloane-idei-si-recomandari/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/candy-bar-cu-decor-de-baloane-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decor-baloane-candy-bar-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decor baloane candy bar bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decor baloane candy bar bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/candy-bar-cu-decor-de-baloane-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-botez-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane botez bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane botez bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/candy-bar-cu-decor-de-baloane-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane aniversare copii bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane aniversare copii bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/candy-bar-cu-decor-de-baloane-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/foto-corner-cu-baloane-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/foto-corner-cu-baloane-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/arcada-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'arcada baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'arcada baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/foto-corner-cu-baloane-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-cifre-litere-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane cifre litere bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane cifre litere bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane majorat bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane majorat bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/decoratiuni-baloane-aniversare-copii-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'decoratiuni baloane aniversare copii bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'decoratiuni baloane aniversare copii bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/cifre-si-litere-din-baloane-cand-se-folosesc/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/buchete-baloane-cand-se-potrivesc/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/buchete-baloane-cand-se-potrivesc/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/buchete-baloane-cand-se-potrivesc/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-personalizate-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-personalizate-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane personalizate bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane personalizate bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-personalizate-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu bucuresti') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu bucuresti');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-personalizate-pentru-evenimente/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/contact/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'contact') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'contact');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-majorat/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/panou-foto-baloane-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'panou foto majorat') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'panou foto majorat');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-adulti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-aniversare-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu aniversare') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu aniversare');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/idei-decor-baloane-aniversare-adulti/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/buchete-baloane-aniversare-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'buchete baloane aniversare') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'buchete baloane aniversare');
        END IF;
    END IF;
SELECT id INTO v_src FROM kassia_pages WHERE path = '/blog/baloane-heliu-pentru-majorat-idei/';
    SELECT id INTO v_tgt FROM kassia_pages WHERE path = '/baloane-heliu-majorat-bucuresti/';
    IF v_src IS NOT NULL AND v_tgt IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_internal_links WHERE source_page_id = v_src AND target_page_id = v_tgt AND anchor_text = 'baloane heliu majorat') THEN
            INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
            VALUES (v_src, v_tgt, 'baloane heliu majorat');
        END IF;
    END IF;



END $$;
COMMIT;
