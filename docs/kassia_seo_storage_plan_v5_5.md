# Plan Stocare SEO Kassia V5.5

## 1. Audit Live Schema Types
Auditul live OpenAPI a returnat următoarele tipuri pentru coloanele problematice:
- `kassia_page_sections.content`: **jsonb**. Folosirea stringului gol `''` din V5.4 ar fi generat o eroare fatală de casting. În V5.5 vom folosi `'{}'::jsonb`.
- `kassia_gallery_items.url` și `alt_text`: **character varying**.
- `kassia_faqs.question` și `answer`: **text**.
- `kassia_pages` nu are `main_keyword` și `search_intent`.

## 2. Decizie Stocare SEO (Varianta B)
Pentru a nu atinge tabelul live `kassia_pages` cu `ALTER TABLE`, V5.5 va crea un tabel adițional, complet separat de frontend, pentru a păstra metadata-ul SEO.

```sql
CREATE TABLE IF NOT EXISTS kassia_seo_map (
  page_id UUID PRIMARY KEY REFERENCES kassia_pages(id) ON DELETE CASCADE,
  main_keyword VARCHAR(255),
  search_intent VARCHAR(50),
  parent_path VARCHAR(255)
);
```

Acest tabel se va popula automat în timpul rulării generatorului V5.5, făcând legătura prin `page_id`.

## 3. Validare Unique Constraints (ACȚIUNE NECESARĂ)
OpenAPI / REST nu expune constrângerile UNIQUE (`pg_constraint`). Astfel, nu pot confirma 100% din cod dacă `ON CONFLICT (page_id, section_type)` funcționează, deși e probabilitate mare să pice dacă baza live nu are constrângerea creată.

Pentru a ne asigura că `ON CONFLICT` funcționează sau dacă trebuie să recurgem la `INSERT ... WHERE NOT EXISTS`, te rog să rulezi următorul snippet în **Supabase SQL Editor** pentru a afla ce constrângeri unice există real:

```sql
SELECT
    tc.table_name, 
    tc.constraint_name, 
    string_agg(kcu.column_name, ', ') as columns
FROM 
    information_schema.table_constraints tc
JOIN 
    information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
WHERE 
    tc.constraint_type = 'UNIQUE' AND tc.table_name LIKE 'kassia_%'
GROUP BY 
    tc.table_name, tc.constraint_name;
```

Te rog dă-mi paste la rezultatul din Supabase. Dacă aceste constrângeri unice lipsesc din instanța live, voi adăuga în script instrucțiunile sigure pentru crearea lor SAU voi evita total `ON CONFLICT`.
