-- Seed Data for Kassia SEO Internal Links

DO $$
BEGIN

    -- A. Pilon to specific kassia_pages

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto cu baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'buchete de baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane personalizate'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/baloane-personalizate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane nuntă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane corporate'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-corporate-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane deschidere restaurant'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane Ilfov'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-ilfov/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    -- B. Service kassia_pages links

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/aranjamente-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-personalizate-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-cifre-litere-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/ghirlande-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/stalpi-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/perete-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decor-baloane-candy-bar-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/livrare-baloane-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    -- C. Event kassia_pages links

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-botez-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mot-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-turta-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-nunta-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cununie-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-copii-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-petrecere-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corporate-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-magazin-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-deschidere-restaurant-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-lansare-produs-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-showroom-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gradinita-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-scoala-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baby-shower-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-gender-reveal-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-craciun-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-revelion-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-paste-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-halloween-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-iunie-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panou foto'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'prețuri decorațiuni'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/preturi-decoratiuni-baloane/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'cere ofertă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-absolvire-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    -- D. Location kassia_pages links

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-1/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-2/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-3/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-4/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-5/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sector-6/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aviatiei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-baneasa/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domenii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-herastrau/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-victoriei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-colentina/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-obor/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefan-cel-mare/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dristor/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-titan/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-vitan/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-unirii/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dudesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tineretului/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-piata-sudului/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-aparatorii-patriei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-oltenitei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-rahova/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cotroceni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-13-septembrie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ferentari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-sebastian/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-drumul-taberei/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-militari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-crangasi/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-giulesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-grozavesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-ilfov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-voluntari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pipera/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-otopeni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-tunari/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-corbeanca/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-balotesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-mogosoaia/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chitila/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-chiajna/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-domnesti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-bragadiru/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-magurele/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-popesti-leordeni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-berceni-ilfov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-pantelimon-ilfov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-cernica/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-afumati/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-stefanestii-de-jos/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dascalu/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-snagov/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-clinceni/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-dragomiresti-vale/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-jilava/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcadă baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contactează-ne'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-1-decembrie/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    -- E. Satellite kassia_pages links

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'arcade baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni nuntă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/arcada-baloane-nunta-bucuresti/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-botez-bucuresti/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'panouri foto baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/panou-foto-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/panou-foto-baloane-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni majorat'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-majorat-bucuresti/' AND p2.path = '/decoratiuni-baloane-majorat-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane heliu București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni aniversare'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/baloane-heliu-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'buchete baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/buchete-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni aniversare'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/buchete-baloane-aniversare-bucuresti/' AND p2.path = '/decoratiuni-baloane-aniversare-adulti-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-roz-auriu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-roz-auriu-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-alb-auriu-bucuresti/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'contact'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/decoratiuni-baloane-alb-auriu-bucuresti/' AND p2.path = '/contact/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    -- F. Support kassia_pages links

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/preturi-decoratiuni-baloane/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preț arcadă baloane'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/preturi-decoratiuni-baloane/' AND p2.path = '/arcada-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'preț baloane cu heliu'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/preturi-decoratiuni-baloane/' AND p2.path = '/baloane-heliu-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decoruri baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/galerie/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane botez'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/galerie/' AND p2.path = '/decoratiuni-baloane-botez-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'baloane nuntă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/galerie/' AND p2.path = '/decoratiuni-baloane-nunta-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'înapoi acasă'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

    INSERT INTO kassia_internal_links (source_page_id, target_page_id, anchor_text)
    SELECT p1.id, p2.id, 'decorațiuni baloane București'
    FROM kassia_pages p1, kassia_pages p2
    WHERE p1.path = '/contact/' AND p2.path = '/decoratiuni-baloane-bucuresti/'
    ON CONFLICT (source_page_id, target_page_id, anchor_text) DO NOTHING;

END $$;
