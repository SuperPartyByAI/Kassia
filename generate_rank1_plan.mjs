import fs from 'fs';
import path from 'path';

const outDir = path.join(process.cwd(), 'audit_animatori_rank1_v1');

const currentPillar = {
  url: "https://www.kassia.ro/animatori-petreceri-copii/",
  wordCount: 4003,
  structure: [
    "Hero (H1, text introductiv lung)",
    "Pachete (280, 490, 830 lei)",
    "Catalog preview limitat",
    "Secțiuni ghid lungi (Ce evităm, Pas cu pas, 1 sau 2 personaje, Cum alegi corect)",
    "FAQ, Review-uri, Zone București"
  ],
  commercial_intent_score: 6,
  informational_intent_score: 9
};

const top10Competitor = {
  average_wordCount: 1100,
  structure: [
    "Hero clar (Ofertă/Preț)",
    "Grilă pachete/prețuri clar diferențiate",
    "Galerie Personaje / Mascote mari",
    "Buton WhatsApp / Contact rapid",
    "Trust signals (Recenzii scurte, Vechime)",
    "Informații limitate/esențiale"
  ],
  commercial_intent_score: 9,
  informational_intent_score: 4
};

fs.writeFileSync(path.join(outDir, 'current_pillar_structure.json'), JSON.stringify(currentPillar, null, 2));
fs.writeFileSync(path.join(outDir, 'top10_competitor_structure.json'), JSON.stringify(top10Competitor, null, 2));

const intentGap = `# Intent Gap Analysis\n\n## Problema Curentă\nPagina Kassia are 4000+ cuvinte și este orientată puternic spre educație (cum decurge petrecerea, ce să evite părinții). \nTop 10 SERP (ex: Cool Events, Ursulla, Paradisul Personajelor) sunt pagini de conversie imediată: afișează prețul, personajele și telefonul în primele ecrane.\n\n## Impact\nUn utilizator care caută "animatori petreceri copii București" este deja în faza de decizie. Vrea să știe costul, ce personaje există și disponibilitatea. Textul lung teoretic acționează ca o barieră vizuală.\n\n## Soluția\nInversarea ierarhiei:\n1. Sales / Ofertă directă\n2. Catalog / Personaje\n3. Dovezi / Recenzii\n4. Informațional / Ghid (ascuns vizual, dar prezent semantic în HTML).\n`;
fs.writeFileSync(path.join(outDir, 'intent_gap_analysis.md'), intentGap);

const proposedSales = `# Proposed Sales-First Structure\n\n1. **Hero Section:**\n   - H1: Animatori petreceri copii București și Ilfov\n   - Subtitlu: De la 280 lei / 1 oră.\n   - CTA-uri: "Sună Acum" / "WhatsApp".\n\n2. **Grile de Prețuri (Afișate imediat):**\n   - Pachete reale trase din sistem (280 lei, 490 lei, 830 lei).\n   - Beneficii clare sub formă de listă. Fără discounturi inventate.\n   - Link clar spre "Vezi toate prețurile".\n\n3. **Galerie Personaje:**\n   - Grilă vizuală cu top 8-12 personaje reale din catalog (Elsa, Mickey, Spiderman etc.).\n   - CTA: "Vezi catalogul complet cu 73 de costume și mascote" care trimite spre /catalog-costume/.\n\n4. **Beneficii Rapide:**\n   - Ce include: jocuri, baloane, pictură, muzică, tort.\n\n5. **Social Proof:**\n   - Recenzii REALE din GMB. 4.9 Stele. \n\n6. **Zone de acoperire:**\n   - Sectoare București și Ilfov.\n\n7. **Educație (Coborâtă la baza paginii):**\n   - Mutăm textul despre "Ce evităm" și "Cum decurge programul" la final.\n   - FAQ acordeon pentru restul textului informativ (pastram relevanța SEO fără a bloca UX-ul).\n`;
fs.writeFileSync(path.join(outDir, 'proposed_sales_first_structure.md'), proposedSales);

const internalLinking = `# Internal Linking Plan\n\n1. **Evitarea Canibalizării:**\n   - Pilonul: \`/animatori-petreceri-copii/\` (țintește general + București/Ilfov).\n   - Verificăm \`/animatori-petreceri-copii-bucuresti/\` - dacă există și concurează, folosim rel="canonical" sau redirecționare, ori le separăm clar (ex. Pilonul = România/General, București = Local). Vom analiza traficul GSC înainte de a lua decizia.\n\n2. **Inbound Spre Pilon:**\n   - Paginile locale (Sector 1, Sector 2, Popești, etc.) vor face link intern natural către Pilon folosind ancore variate ("programe animatori", "animatori petreceri copii").\n\n3. **Outbound Din Pilon:**\n   - Către \`/catalog-costume/\` (pentru personaje).\n   - Către paginile de prețuri detaliate.\n`;
fs.writeFileSync(path.join(outDir, 'internal_linking_plan.md'), internalLinking);

const schemaPlan = `# Schema.org Plan\n\nVom folosi DOAR entități legitime, fără steluțe false:\n\n1. **Service:** Pentru serviciul de animatori.\n2. **Offer:** Legat strict de pachetele de 280, 490, 830 lei afișate pe pagină.\n3. **FAQPage:** Legat exclusiv de întrebările frecvente aflate în structura paginii.\n4. **LocalBusiness / Organization:** Pentru conectarea cu brandul Kassia.\n5. **ImageObject:** Pentru personajele afișate cu descrieri clare (ex. "Animatoare Elsa").\n`;
fs.writeFileSync(path.join(outDir, 'schema_plan.md'), schemaPlan);

const authorityPlan = `# Authority Gap Plan\n\nTopul SERP este dominat de domenii vechi și branduri consolidate (ClownParty, Cool Events).\n\n1. **Backlinks Locale:**\n   - Obținerea de link-uri de pe site-uri de parenting locale, grădinițe, restaurante cu spații de joacă.\n2. **Google Business Profile (GMB):**\n   - Menținerea recenziilor proaspete și postări locale pentru a valida entitatea "Kassia" în aria București/Ilfov.\n3. **Semnale Sociale & CTR:**\n   - Promovarea paginii pentru a aduce trafic relevant care stă mult pe pagină, validând noul UX comercial pentru RankBrain-ul Google.\n`;
fs.writeFileSync(path.join(outDir, 'authority_gap_plan.md'), authorityPlan);

console.log("Plan generated successfully.");
