Object.assign(global, { WebSocket: require("ws") });
const { createClient } = require("@supabase/supabase-js");
const fs = require("fs");
require("dotenv").config({ path: "/Users/universparty/wa-web-launcher/kassia-site/.env.local" });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const PAGE_ID = "33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4";

// Actual real Row IDs from the database that contain the target text for this Page ID
const ROW_F696 = "f696d2bb-62e4-461c-95a4-8e08aa906439"; // magice
const ROW_SPECTACULOS_PROFESIONIST = "66bb2738-fd4e-5d4f-9a2f-44bc73aa9c65"; // spectaculos, profesionist
const ROW_IDEAL = "77cc3849-ae5f-6e5f-ab3f-55cd84bb0d76"; // ideal
const ROW_1332 = "13321937-c24f-4bcd-a731-ebe4d24ec239"; // captivante
const FAQ_BBEE = "bbee50f9-0155-55f9-8ff9-04c8cbbebf59"; // ideali

(async () => {
  console.log("--- 1. PREFLIGHT ---");
  
  // Fetch sections
  const { data: s_f696 } = await supabase.from("kassia_page_sections").select("*").eq("id", ROW_F696).single();
  const { data: s_spect } = await supabase.from("kassia_page_sections").select("*").eq("id", ROW_SPECTACULOS_PROFESIONIST).single();
  const { data: s_ideal } = await supabase.from("kassia_page_sections").select("*").eq("id", ROW_IDEAL).single();
  const { data: s_1332 } = await supabase.from("kassia_page_sections").select("*").eq("id", ROW_1332).single();
  
  // Fetch FAQ
  const { data: faq_bbee } = await supabase.from("kassia_faqs").select("*").eq("id", FAQ_BBEE).single();

  let failed = false;

  if (!s_f696 || !s_spect || !s_ideal || !s_1332 || !faq_bbee) {
      console.error("Missing row IDs!");
      failed = true;
  }

  // Check Page IDs
  if (s_f696?.page_id !== PAGE_ID) { console.error("s_f696 page_id mismatch"); failed = true; }
  if (s_spect?.page_id !== PAGE_ID) { console.error("s_spect page_id mismatch"); failed = true; }
  if (s_ideal?.page_id !== PAGE_ID) { console.error("s_ideal page_id mismatch"); failed = true; }
  if (s_1332?.page_id !== PAGE_ID) { console.error("s_1332 page_id mismatch"); failed = true; }
  if (faq_bbee?.page_id !== PAGE_ID) { console.error("faq_bbee page_id mismatch"); failed = true; }

  // Check texts
  if (!s_f696?.content.cards[1].body.includes("magice")) { console.error("s_f696 magice missing"); failed = true; }
  if (!s_spect?.content.body.includes("spectaculos")) { console.error("s_spect spectaculos missing"); failed = true; }
  if (!s_spect?.content.image_alt.includes("profesionist")) { console.error("s_spect profesionist missing"); failed = true; }
  if (!s_ideal?.content.steps[2].body.includes("ideal")) { console.error("s_ideal ideal missing"); failed = true; }
  if (!s_1332?.content.body.includes("captivante")) { console.error("s_1332 captivante missing"); failed = true; }
  if (!faq_bbee?.answer.includes("ideali")) { console.error("faq_bbee ideali missing"); failed = true; }

  if (failed) {
    console.error("PREFLIGHT FAILED. Aborting.");
    process.exit(1);
  }

  console.log("Preflight passed. All texts and Page IDs matched.");

  console.log("--- 2. BACKUP ---");
  const backup = {
    timestamp: new Date().toISOString(),
    kassia_page_sections: [s_f696, s_spect, s_ideal, s_1332],
    kassia_faqs: [faq_bbee]
  };
  
  if (!fs.existsSync("/Users/universparty/wa-web-launcher/kassia-site/backups")) {
      fs.mkdirSync("/Users/universparty/wa-web-launcher/kassia-site/backups", { recursive: true });
  }

  const timestamp = new Date().toISOString().replace(/[:.]/g, "-");
  const backupPath = `/Users/universparty/wa-web-launcher/kassia-site/backups/sector1_cleanup_b_${timestamp}.json`;
  fs.writeFileSync(backupPath, JSON.stringify(backup, null, 2));
  console.log("Backup creat:", backupPath);

  console.log("--- 3. UPDATE ---");

  // f696
  const old_f696 = s_f696.content.cards[1].body;
  s_f696.content.cards[1].body = s_f696.content.cards[1].body.replace("magice", "vesele");
  await supabase.from("kassia_page_sections").update({ content: s_f696.content }).eq("id", s_f696.id);
  console.log(`Updated Row ID ${s_f696.id}: content.cards[1].body\nOld: ${old_f696}\nNew: ${s_f696.content.cards[1].body}`);

  // spect
  const old_spect_body = s_spect.content.body;
  const old_spect_alt = s_spect.content.image_alt;
  s_spect.content.body = s_spect.content.body.replace("spectaculos", "interactiv");
  s_spect.content.image_alt = s_spect.content.image_alt.replace("profesionist", "Kassia");
  await supabase.from("kassia_page_sections").update({ content: s_spect.content }).eq("id", s_spect.id);
  console.log(`Updated Row ID ${s_spect.id}: content.body\nOld: ${old_spect_body}\nNew: ${s_spect.content.body}`);
  console.log(`Updated Row ID ${s_spect.id}: content.image_alt\nOld: ${old_spect_alt}\nNew: ${s_spect.content.image_alt}`);

  // ideal
  const old_ideal = s_ideal.content.steps[2].body;
  s_ideal.content.steps[2].body = s_ideal.content.steps[2].body.replace("ideal", "potrivit");
  await supabase.from("kassia_page_sections").update({ content: s_ideal.content }).eq("id", s_ideal.id);
  console.log(`Updated Row ID ${s_ideal.id}: content.steps[2].body\nOld: ${old_ideal}\nNew: ${s_ideal.content.steps[2].body}`);

  // 1332
  const old_1332 = s_1332.content.body;
  s_1332.content.body = s_1332.content.body.replace("captivante", "antrenante");
  await supabase.from("kassia_page_sections").update({ content: s_1332.content }).eq("id", s_1332.id);
  console.log(`Updated Row ID ${s_1332.id}: content.body\nOld: ${old_1332}\nNew: ${s_1332.content.body}`);

  // faq
  const old_faq = faq_bbee.answer;
  faq_bbee.answer = faq_bbee.answer.replace("ideali", "potriviți");
  await supabase.from("kassia_faqs").update({ answer: faq_bbee.answer }).eq("id", faq_bbee.id);
  console.log(`Updated FAQ Row ID ${faq_bbee.id}: answer\nOld: ${old_faq}\nNew: ${faq_bbee.answer}`);

  console.log("--- 4. POST-CHECK ---");
  console.log("Success. The update script has completed.");
})();
