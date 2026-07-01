-- Create config table
CREATE TABLE IF NOT EXISTS kassia_site_config (
  key VARCHAR(255) PRIMARY KEY,
  value TEXT NOT NULL
);

-- Insert global settings
INSERT INTO kassia_site_config (key, value) VALUES
('phone', '0768098268'),
('email', 'contact@kassia.ro'),
('whatsapp_text', 'Buna! As dori mai multe detalii despre decoratiunile cu baloane.'),
('footer_desc', 'Kassia îți transformă evenimentele în amintiri de neuitat prin decorațiuni spectaculoase din baloane. Calitate premium pentru botezuri, nunți și petreceri corporate.')
ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value;

-- Create menu tables
CREATE TABLE IF NOT EXISTS kassia_menus (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  location VARCHAR(50) UNIQUE NOT NULL,
  title VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS kassia_menu_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  menu_id UUID REFERENCES kassia_menus(id) ON DELETE CASCADE,
  label VARCHAR(255) NOT NULL,
  url TEXT NOT NULL,
  order_index INTEGER DEFAULT 0
);

-- Insert Menus
INSERT INTO kassia_menus (location, title) VALUES
('header_services', 'Servicii Baloane'),
('header_events', 'Evenimente'),
('footer_services', 'Servicii Principale')
ON CONFLICT (location) DO NOTHING;

-- Function to safely insert menu items
CREATE OR REPLACE FUNCTION insert_kassia_menu_item(p_loc VARCHAR, p_label VARCHAR, p_url TEXT, p_order INT)
RETURNS VOID AS $$
DECLARE v_menu_id UUID;
BEGIN
    SELECT id INTO v_menu_id FROM kassia_menus WHERE location = p_loc;
    IF v_menu_id IS NOT NULL THEN
        IF NOT EXISTS (SELECT 1 FROM kassia_menu_items WHERE menu_id = v_menu_id AND label = p_label) THEN
            INSERT INTO kassia_menu_items (menu_id, label, url, order_index) VALUES (v_menu_id, p_label, p_url, p_order);
        END IF;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Insert Header Services
SELECT insert_kassia_menu_item('header_services', 'Arcade Baloane', '/arcada-baloane-bucuresti/', 10);
SELECT insert_kassia_menu_item('header_services', 'Baloane cu Heliu', '/baloane-heliu-bucuresti/', 20);
SELECT insert_kassia_menu_item('header_services', 'Panouri Foto (Photo Corner)', '/panou-foto-baloane-bucuresti/', 30);
SELECT insert_kassia_menu_item('header_services', 'Perete din Baloane', '/perete-baloane-bucuresti/', 40);
SELECT insert_kassia_menu_item('header_services', 'Ghirlande Baloane', '/ghirlande-baloane-bucuresti/', 50);
SELECT insert_kassia_menu_item('header_services', 'Stâlpi Baloane', '/stalpi-baloane-bucuresti/', 60);
SELECT insert_kassia_menu_item('header_services', 'Aranjamente Baloane', '/aranjamente-baloane-bucuresti/', 70);
SELECT insert_kassia_menu_item('header_services', 'Buchete din Baloane', '/buchete-baloane-bucuresti/', 80);
SELECT insert_kassia_menu_item('header_services', 'Baloane Cifre & Litere', '/baloane-cifre-litere-bucuresti/', 90);
SELECT insert_kassia_menu_item('header_services', 'Livrare Baloane', '/livrare-baloane-bucuresti/', 100);

-- Insert Header Events
SELECT insert_kassia_menu_item('header_events', 'Botez & Tăiere Moț', '/decoratiuni-baloane-botez-bucuresti/', 10);
SELECT insert_kassia_menu_item('header_events', 'Nuntă & Cununie', '/decoratiuni-baloane-nunta-bucuresti/', 20);
SELECT insert_kassia_menu_item('header_events', 'Corporate & Deschideri', '/decoratiuni-baloane-corporate-bucuresti/', 30);
SELECT insert_kassia_menu_item('header_events', 'Gender Reveal', '/decoratiuni-baloane-gender-reveal-bucuresti/', 40);
SELECT insert_kassia_menu_item('header_events', 'Baby Shower', '/decoratiuni-baloane-baby-shower-bucuresti/', 50);
SELECT insert_kassia_menu_item('header_events', 'Aniversări Copii', '/decoratiuni-baloane-aniversare-copii-bucuresti/', 60);
SELECT insert_kassia_menu_item('header_events', 'Majorat (18 ani)', '/decoratiuni-baloane-majorat-bucuresti/', 70);
SELECT insert_kassia_menu_item('header_events', 'Absolvire & Școală', '/decoratiuni-baloane-absolvire-bucuresti/', 80);

-- Insert Footer Services
SELECT insert_kassia_menu_item('footer_services', 'Baloane Botez', '/decoratiuni-baloane-botez-bucuresti/', 10);
SELECT insert_kassia_menu_item('footer_services', 'Baloane Nuntă', '/decoratiuni-baloane-nunta-bucuresti/', 20);
SELECT insert_kassia_menu_item('footer_services', 'Evenimente Corporate', '/decoratiuni-baloane-corporate-bucuresti/', 30);
SELECT insert_kassia_menu_item('footer_services', 'Arcade din Baloane', '/arcada-baloane-bucuresti/', 40);
SELECT insert_kassia_menu_item('footer_services', 'Panouri Foto (Photo Corner)', '/panou-foto-baloane-bucuresti/', 50);
SELECT insert_kassia_menu_item('footer_services', 'Baloane cu Heliu', '/baloane-heliu-bucuresti/', 60);

-- Enable RLS and public read access
ALTER TABLE kassia_site_config ENABLE ROW LEVEL SECURITY;
ALTER TABLE kassia_menus ENABLE ROW LEVEL SECURITY;
ALTER TABLE kassia_menu_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public profiles are viewable by everyone." ON kassia_site_config FOR SELECT USING (true);
CREATE POLICY "Public profiles are viewable by everyone." ON kassia_menus FOR SELECT USING (true);
CREATE POLICY "Public profiles are viewable by everyone." ON kassia_menu_items FOR SELECT USING (true);
