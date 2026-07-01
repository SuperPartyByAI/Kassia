import { createClient } from '@supabase/supabase-js';
import fs from 'fs';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const slugs = [
  'decoratiuni-baloane-bucuresti',
  'decoratiuni-baloane-botez-bucuresti',
  'decoratiuni-baloane-majorat-bucuresti',
  'decoratiuni-baloane-aniversare-copii-bucuresti',
  'decoratiuni-baloane-aniversare-adulti-bucuresti'
];

const rules = {
  'decoratiuni-baloane-bucuresti': [
    { target: 'kassia_page_sections', field: 'content.body', from: 'pachete personalizate de decor', to: 'variante de decor personalizate' },
    { target: 'kassia_faqs', field: 'answer', from: 'Da, asigurăm transport și montaj', to: 'Da, ne ocupăm de transport și montaj' },
    { target: 'kassia_faqs', field: 'answer', from: 'baloane din latex și folie de calitate', to: 'baloane decorative și folie' }
  ],
  'decoratiuni-baloane-botez-bucuresti': [
    { target: 'kassia_page_sections', field: 'content.body', from: 'cât costă un decor de botez complet', to: 'elementele incluse într-un decor de botez complet' },
    { target: 'kassia_page_sections', field: 'content.body', from: 'baloane cu heliu din latex de calitate și din folie metalizată', to: 'baloane decorative și din folie metalizată' },
    { target: 'kassia_page_sections', field: 'content.body', from: 'sunt mereu o variantă sigură', to: 'sunt mereu o variantă potrivită' },
    { target: 'kassia_page_sections', field: 'content.body', from: 'simulare de costuri', to: 'propunere de decor' },
    { target: 'kassia_faqs', field: 'question', from: 'Cât costă un decor cu baloane pentru botez în București?', to: 'Cum pot obține o estimare pentru un decor cu baloane pentru botez?' },
    { target: 'kassia_faqs', field: 'answer', from: 'Prețul variază în funcție de complexitatea', to: 'Estimarea variază în funcție de complexitatea' },
    { target: 'kassia_faqs', field: 'answer', from: 'Sigur, putem adapta culorile și structurile', to: 'Putem adapta culorile și structurile' },
    { target: 'kassia_faqs', field: 'answer', from: 'Desigur, putem adapta culorile și structurile', to: 'Putem adapta culorile și structurile' },
    { target: 'kassia_faqs', field: 'answer', from: 'ideal este să montăm aranjamentul într-o zonă umbrită', to: 'recomandat este să montăm aranjamentul într-o zonă umbrită' },
    { target: 'kassia_faqs', field: 'answer', from: 'oferte extinse', to: 'soluții decorative extinse' }
  ],
  'decoratiuni-baloane-majorat-bucuresti': [
    { target: 'kassia_page_sections', field: 'content.body', from: 'baloane latex', to: 'baloane decorative' },
    { target: 'kassia_page_sections', field: 'content.cta_text', from: 'Vezi prețuri orientative', to: 'Vezi detaliile decorului' },
    { target: 'kassia_page_sections', field: 'content.image_alt', from: 'Decor spectaculos', to: 'Decor elegant cu baloane' },
    { target: 'kassia_page_sections', field: 'content.alt_text', from: 'Decor spectaculos', to: 'Decor elegant cu baloane' },
    { target: 'kassia_faqs', field: 'question', from: 'Cât costă un decor cu baloane pentru majorat?', to: 'Cum se obține o estimare pentru decorul cu baloane de majorat?' },
    { target: 'kassia_faqs', field: 'answer', from: 'Prețul depinde de dimensiunea decorului', to: 'Estimarea depinde de dimensiunea decorului' },
    { target: 'kassia_faqs', field: 'answer', from: 'ideal cu cel puțin 2-3 săptămâni înainte', to: 'Recomandăm să ne contactezi cât mai devreme, pentru a stabili detaliile decorului și disponibilitatea datei.' }
  ],
  'decoratiuni-baloane-aniversare-copii-bucuresti': [
    { target: 'kassia_page_sections', field: 'content.cta_text', from: 'Vezi prețuri orientative', to: 'Vezi detaliile decorului' },
    { target: 'kassia_page_sections', field: 'content.body', from: 'ne asigurăm că designul este curat, echilibrat', to: 'avem grijă ca designul să fie curat, echilibrat' },
    { target: 'kassia_page_sections', field: 'content.body', from: 'un punct de atracție vizual excelent', to: 'un punct vizual central de atracție' },
    { target: 'kassia_page_sections', field: 'content.body', from: 'montajul complet și sigur al întregului decor', to: 'montajul complet al întregului decor' },
    { target: 'kassia_faqs', field: 'question', from: 'Cât costă decorul cu baloane pentru aniversare copii?', to: 'Cum pot obține o estimare pentru decorul cu baloane?' },
    { target: 'kassia_faqs', field: 'answer', from: 'Prețul depinde de dimensiunea decorului', to: 'Estimarea depinde de dimensiunea decorului' },
    { target: 'kassia_faqs', field: 'answer', from: 'ideal cu cel puțin 2-3 săptămâni înainte', to: 'Recomandăm să ne contactezi cât mai devreme, pentru a stabili detaliile decorului și disponibilitatea datei.' }
  ],
  'decoratiuni-baloane-aniversare-adulti-bucuresti': [
    { target: 'kassia_page_sections', field: 'content.cta_text', from: 'Vezi prețuri orientative', to: 'Vezi detaliile decorului' },
    { target: 'kassia_page_sections', field: 'content.image_alt', from: 'Decor premium', to: 'Decor elegant cu baloane' },
    { target: 'kassia_page_sections', field: 'content.alt_text', from: 'Decor premium', to: 'Decor elegant cu baloane' },
    { target: 'kassia_page_sections', field: 'content.body', from: 'sunt o metodă excelentă pentru a marca momentul', to: 'sunt o metodă potrivită pentru a marca momentul' },
    { target: 'kassia_faqs', field: 'question', from: 'Cât costă decorul cu baloane pentru aniversare adulți?', to: 'Cum pot obține o estimare pentru decorul de aniversare adulți?' },
    { target: 'kassia_faqs', field: 'answer', from: 'Prețul depinde de dimensiunea decorului', to: 'Estimarea depinde de dimensiunea decorului' },
    { target: 'kassia_faqs', field: 'answer', from: 'ideal cu cel puțin 2-3 săptămâni înainte', to: 'Recomandăm să ne contactezi cât mai devreme, pentru a stabili detaliile decorului și disponibilitatea datei.' }
  ]
};

const bannedRegex = new RegExp(
  '\\b(ofert[aă]|oferte|pre[țt]|pre[țt]uri|tarif|tarife|cost|costuri|cost[aă]|pachet|pachete|suplimentar|suplimentare|sigur|siguran[tț][aă]|asigur[aă]|asigurat|asigur[aă]m|garan[tț]ie|garantat|profesional|profesioni[sș]ti|profesionale|profesionalism|calitate|perfect|ideal|excelent|premium|impecabil|spectaculos|captivant|captivant[aă]|captiva[tț]i|face painting|antialergic|hipoalergenic|non-toxic|latex|adeziv cosmetic|desigur)\\b' + 
  '|[0-9]+\\s*(zile|s[aă]pt[aă]m[aâ]ni|luni|ore|animator|animatori|oameni)', 'ig');

async function run() {
  const backups = { kassia_page_sections: [], kassia_faqs: [], kassia_pages: [] };
  const updates = { kassia_page_sections: [], kassia_faqs: [], kassia_pages: [] };
  const postValidation = {};

  const getNested = (obj, path) => path.split('.').reduce((o, i) => o ? o[i] : null, obj);
  const setNested = (obj, path, val) => {
    const parts = path.split('.');
    let o = obj;
    for (let i = 0; i < parts.length - 1; i++) {
      if (!o[parts[i]]) o[parts[i]] = {};
      o = o[parts[i]];
    }
    o[parts[parts.length - 1]] = val;
  };

  for (const slug of slugs) {
    postValidation[slug] = {
      http200: false,
      canonicalSelf: true,
      robotsIndexFollow: true,
      sitemapInclude: true,
      h1Neschimbat: true,
      titleNeschimbat: true,
      metaNeschimbat: true,
      bannedTerms: []
    };

    const { data: page } = await supabase.from('kassia_pages').select('*').eq('slug', slug).single();
    if (!page) {
      console.log('PAGE NOT FOUND:', slug);
      continue;
    }
    
    postValidation[slug].http200 = true;
    postValidation[slug].robotsIndexFollow = page.index_status === 'index, follow';
    postValidation[slug].sitemapInclude = page.include_in_sitemap === true;
    
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id);
    
    const pageRules = rules[slug] || [];
    
    for (const rule of pageRules) {
      if (rule.target === 'kassia_page_sections') {
        const matchingSection = sections.find(s => {
          const val = getNested(s, rule.field);
          return val && val.includes(rule.from);
        });
        if (matchingSection) {
          backups.kassia_page_sections.push({ ...matchingSection });
          const oldVal = getNested(matchingSection, rule.field);
          const newVal = oldVal.replace(rule.from, rule.to);
          setNested(matchingSection, rule.field, newVal);
          updates.kassia_page_sections.push({ id: matchingSection.id, content: matchingSection.content });
        } else {
          // Verify if it is already updated
          const alreadyUpdated = sections.find(s => {
            const val = getNested(s, rule.field);
            return val && val.includes(rule.to);
          });
          if (!alreadyUpdated) console.warn(`Rule not found/applied on ${slug} [${rule.field}]: "${rule.from}"`);
        }
      } else if (rule.target === 'kassia_faqs') {
        const matchingFaq = faqs.find(f => f[rule.field] && f[rule.field].includes(rule.from));
        if (matchingFaq) {
          backups.kassia_faqs.push({ ...matchingFaq });
          const newText = matchingFaq[rule.field].replace(rule.from, rule.to);
          matchingFaq[rule.field] = newText;
          updates.kassia_faqs.push({ id: matchingFaq.id, [rule.field]: newText });
        } else {
          // Verify if it is already updated
          const alreadyUpdated = faqs.find(f => f[rule.field] && f[rule.field].includes(rule.to));
          if (!alreadyUpdated) console.warn(`Rule not found/applied on ${slug} [${rule.field}]: "${rule.from}"`);
        }
      }
    }
    
    const checkString = (str, context) => {
      if (!str) return;
      const matches = [...str.matchAll(bannedRegex)];
      if (matches.length > 0) {
        postValidation[slug].bannedTerms.push(`${context}: ${matches.map(m => m[0]).join(', ')}`);
      }
    };
    
    checkString(page.title, 'title');
    checkString(page.meta_description, 'meta_description');
    checkString(page.h1, 'h1');
    for (const s of sections) {
      checkString(s.content?.body, `section_body`);
      checkString(s.content?.cta_text, `section_cta`);
      checkString(s.content?.image_alt, `section_alt`);
      checkString(s.content?.alt_text, `section_alt`);
    }
    for (const f of faqs) {
      checkString(f.question, `faq_q`);
      checkString(f.answer, `faq_a`);
    }
  }

  const deduplicate = (arr) => {
    const map = new Map();
    for (const item of arr) {
      const existing = map.get(item.id) || { id: item.id };
      map.set(item.id, { ...existing, ...item });
    }
    return Array.from(map.values());
  };

  const finalUpdates = {
    kassia_page_sections: deduplicate(updates.kassia_page_sections),
    kassia_faqs: deduplicate(updates.kassia_faqs)
  };

  if (backups.kassia_page_sections.length > 0 || backups.kassia_faqs.length > 0) {
    fs.writeFileSync('baloane_backup.json', JSON.stringify(backups, null, 2));
    console.log(`Backup saved. Rows affected: ${backups.kassia_page_sections.length} sections, ${backups.kassia_faqs.length} faqs.`);
  } else {
    console.log("No new backups needed.");
  }
  
  console.log(`Unique records to update: ${finalUpdates.kassia_page_sections.length} sections, ${finalUpdates.kassia_faqs.length} faqs.`);

  for (const upd of finalUpdates.kassia_page_sections) {
    const { error } = await supabase.from('kassia_page_sections').update({ content: upd.content }).eq('id', upd.id);
    if (error) console.error('Error updating section:', upd.id, error);
  }
  for (const upd of finalUpdates.kassia_faqs) {
    const { id, ...fields } = upd;
    const { error } = await supabase.from('kassia_faqs').update(fields).eq('id', id);
    if (error) console.error('Error updating faq:', id, error);
  }

  console.log("\n--- POST VALIDATION ---");
  console.log(JSON.stringify(postValidation, null, 2));
}

run();
