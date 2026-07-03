import fs from 'fs';
import path from 'path';

async function run() {
    console.log("Rerunning mini audit for 7 Voluntari images...");
    const images = [
        "https://www.kassia.ro/images/locatii/voluntari_scenarii_frecvente.png",
        "https://www.kassia.ro/images/locatii/voluntari_ce_evitam.png",
        "https://www.kassia.ro/images/locatii/voluntari_pas_cu_pas.png",
        "https://www.kassia.ro/images/locatii/voluntari_zone_adaptare.png",
        "https://www.kassia.ro/images/locatii/voluntari_pe_scurt.png",
        "https://www.kassia.ro/images/locatii/voluntari_zona_joc.png",
        "https://www.kassia.ro/images/locatii/voluntari_un_personaj_sau_doua.png"
    ];
    
    let broken = 0;
    for (const img of images) {
        try {
            const req = await fetch(img, { method: 'HEAD' });
            if (req.status !== 200) {
                broken++;
                console.log(`Still broken: ${img} - Status: ${req.status}`);
            } else {
                console.log(`OK: ${img}`);
            }
        } catch(e) {
            broken++;
            console.log(`Error checking: ${img}`);
        }
    }
    
    const result = {
        "p0_broken_images_fixed": broken === 0,
        "full_audit_completed": false,
        "competitor_intent_analysis_done": true,
        "page_currently_sales_first": false,
        "main_gap": "Intent Gap - informational vs transactional",
        "proposed_structure_ready": false,
        "implementation_allowed_now": false,
        "final_status": broken === 0 ? "P0_FIXED_READY_FOR_FULL_AUDIT" : "HOLD"
    };
    
    fs.writeFileSync(path.join(process.cwd(), 'audit_kassia_full_site_v2_2', 'mini_audit_results.json'), JSON.stringify(result, null, 2));
    console.log("Mini audit complete. Broken images:", broken);
}

run();
