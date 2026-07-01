Object.assign(global, { WebSocket: require("ws") });
const { createClient } = require("@supabase/supabase-js");
const fs = require("fs");
require("dotenv").config({ path: "/Users/universparty/wa-web-launcher/kassia-site/.env.local" });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const PAGE_ID = "33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4";

(async () => {
  console.log("--- 1. PREFLIGHT ---");
  
  // Fetch sections
  const { data: s_f696 } = await supabase.from("kassia_page_sections").select("*").eq("id", "f696d2bb-62e4-461c-95a4-8e08aa906439").single();
  const { data: s_1e95 } = await supabase.from("kassia_page_sections").select("*").eq("id", "1e9569b7-b08e-4a4b-afc3-565507b949ab").single();
  const { data: s_9d14 } = await supabase.from("kassia_page_sections").select("*").eq("id", "9d1469e7-4f96-4876-9d33-4f056345d1d6").single();
  const { data: s_1332 } = await supabase.from("kassia_page_sections").select("*").eq("id", "13321937-c24f-4bcd-a731-ebe4d24ec239").single();
  
  // Fetch FAQ
  const { data: faq_bbee } = await supabase.from("kassia_faqs").select("*").eq("id", "bbee50f9-0155-55f9-8ff9-04c8cbbebf59").single();

  let failed = false;

  // Check Page IDs
  if (s_f696.page_id !== PAGE_ID) { console.error("s_f696 page_id mismatch"); failed = true; }
  if (s_1e95.page_id !== PAGE_ID) { console.error("s_1e95 page_id mismatch"); failed = true; }
  if (s_9d14.page_id !== PAGE_ID) { console.error("s_9d14 page_id mismatch"); failed = true; }
  if (s_1332.page_id !== PAGE_ID) { console.error("s_1332 page_id mismatch"); failed = true; }
  if (faq_bbee.page_id !== PAGE_ID) { console.error("faq_bbee page_id mismatch"); failed = true; }

  // Check texts
  if (!s_f696.content.cards[1].body.includes("magice")) { console.error("s_f696 magice missing"); failed = true; }
  if (!s_1e95.content.body.includes("spectaculos")) { console.error("s_1e95 spectaculos missing"); failed = true; }
  if (!s_1e95.content.image_alt.includes("profesionist")) { console.error("s_1e95 profesionist missing"); failed = true; }
  if (!s_9d14.content.steps[2].body.includes("ideal")) { console.error("s_9d14 ideal missing"); failed = true; }
  if (!s_1332.content.body.includes("captivante")) { console.error("s_1332 captivante missing"); failed = true; }
  if (!faq_bbee.answer.includes("ideali")) { console.error("faq_bbee ideali missing"); failed = true; }

  if (failed) {
    console.error("PREFLIGHT FAILED. Aborting.");
    process.exit(1);
  }

  console.log("Preflight passed. All texts and Page IDs matched.");

  console.log("--- 2. BACKUP ---");
  const backup = {
    timestamp: new Date().toISOString(),
    kassia_page_sections: [s_f696, s_1e95, s_9d14, s_1332],
    kassia_faqs: [faq_bbee]
  };
  
  const timestamp = new Date().toISOString().replace(/[:.]/g, "-");
  const backupPath = `/Users/universparty/wa-web-launcher/kassia-site/backups/sector1_cleanup_b_${timestamp}.json`;
  fs.writeFileSync(backupPath, JSON.stringify(backup, null, 2));
  console.log("Backup creat:", backupPath);

  console.log("--- 3. UPDATE ---");

  // s_f696
  s_f696.content.cards[1].body = s_f696.content.cards[1].body.replace("magice", "vesele");
  await supabase.from("kassia_page_sections").update({ content: s_f696.content }).eq("id", s_f696.id);
  console.log("Updated f696");

  // s_1e95
  s_1e95.content.body = s_1e95.content.body.replace("spectaculos", "interactiv");
  s_1e95.content.image_alt = s_1e95.content.image_alt.replace("profesionist", "Kassia");
  await supabase.from("kassia_page_sections").update({ content: s_1e95.content }).eq("id", s_1e95.id);
  console.log("Updated 1e95");

  // s_9d14
  s_9d14.content.steps[2].body = s_9d14.content.steps[2].body.replace("ideal", "potrivit");
  await supabase.from("kassia_page_sections").update({ content: s_9d14.content }).eq("id", s_9d14.id);
  console.log("Updated 9d14");

  // s_1332
  s_1332.content.body = s_1332.content.body.replace("captivante", "antrenante");
  await supabase.from("kassia_page_sections").update({ content: s_1332.content }).eq("id", s_1332.id);
  console.log("Updated 1332");

  // faq_bbee
  faq_bbee.answer = faq_bbee.answer.replace("ideali", "potriviți");
  await supabase.from("kassia_faqs").update({ answer: faq_bbee.answer }).eq("id", faq_bbee.id);
  console.log("Updated faq_bbee");

  console.log("--- 4. POST-CHECK ---");
  const { data: verify_s_f696 } = await supabase.from("kassia_page_sections").select("*").eq("id", "f696d2bb-62e4-461c-95a4-8e08aa906439").single();
  console.log("f696 body:", verify_s_f696.content.cards[1].body);

})();
