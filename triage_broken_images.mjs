import fs from 'fs';
import path from 'path';
import { globSync } from 'glob';

const outDir = path.join(process.cwd(), 'audit_kassia_full_site_v2_2');
const brokenImagesPath = path.join(outDir, 'broken_images_full.json');

async function runTriage() {
    console.log('Reading broken images list...');
    let brokenImages = [];
    try {
        brokenImages = JSON.parse(fs.readFileSync(brokenImagesPath, 'utf8'));
    } catch(e) {
        console.error("Failed to read broken_images_full.json", e);
        return;
    }
    
    console.log(`Found ${brokenImages.length} instances.`);
    
    // PAS 1 - GRUPARE DUPĂ IMAGE SRC
    const groupsMap = new Map();
    for (const inst of brokenImages) {
        const src = inst.image_src || "MISSING_SRC";
        if (!groupsMap.has(src)) {
            groupsMap.set(src, {
                image_src: src,
                resolved_url: inst.resolved_url || src,
                http_status: inst.http_status,
                affected_pages_count: 0,
                sample_affected_pages: new Set(),
                sample_alt_texts: new Set(),
                section_hints: new Set(),
                likely_root_cause: "",
                priority: "P2"
            });
        }
        const g = groupsMap.get(src);
        g.affected_pages_count++;
        if (g.sample_affected_pages.size < 5) g.sample_affected_pages.add(inst.source_page);
        if (inst.alt && g.sample_alt_texts.size < 5) g.sample_alt_texts.add(inst.alt);
        if (inst.section_hint) g.section_hints.add(inst.section_hint);
    }
    
    const groups = Array.from(groupsMap.values()).map(g => ({
        ...g,
        sample_affected_pages: Array.from(g.sample_affected_pages),
        sample_alt_texts: Array.from(g.sample_alt_texts),
        section_hints: Array.from(g.section_hints)
    }));
    
    groups.sort((a, b) => b.affected_pages_count - a.affected_pages_count);
    
    const pas1 = {
        total_broken_instances: brokenImages.length,
        unique_broken_image_src_count: groups.length,
        groups: groups
    };
    fs.writeFileSync(path.join(outDir, 'broken_images_grouped_by_src.json'), JSON.stringify(pas1, null, 2));
    
    // PAS 2 & 4 - ROOT CAUSE & FILE EXISTENCE
    const root_cause_summary = {
        asset_missing_physically: 0,
        wrong_folder_path: 0,
        old_renamed_filename: 0,
        external_remote_broken: 0,
        lazy_srcset_issue: 0,
        generated_invalid_url: 0,
        db_content_issue: 0,
        code_component_issue: 0
    };
    
    const fileExistenceChecks = [];
    const publicDir = path.join(process.cwd(), 'public');
    
    // Quick helper to search similar files
    // Preload all public files to avoid thousands of glob calls? Actually globSync is fast if targeted.
    
    console.log(`Checking ${groups.length} unique sources...`);
    
    for (let i = 0; i < groups.length; i++) {
        const g = groups[i];
        let rootCause = "asset_missing_physically";
        
        let localPath = "";
        let expectedServerPath = "";
        let exists = false;
        let similar = [];
        
        if (!g.image_src || g.image_src === "MISSING_SRC" || g.image_src === "undefined" || g.image_src.includes('[object Object]')) {
            rootCause = "generated_invalid_url";
            root_cause_summary.generated_invalid_url++;
        } else if (!g.image_src.includes('kassia.ro') && g.image_src.startsWith('http')) {
            // External
            rootCause = "external_remote_broken";
            root_cause_summary.external_remote_broken++;
        } else {
            // Try to map to local path
            let urlPath = g.image_src;
            if (urlPath.startsWith('http')) {
                try { urlPath = new URL(urlPath).pathname; } catch(e) {}
            }
            if (urlPath.startsWith('/_astro')) {
                // Built file
                rootCause = "lazy_srcset_issue";
                root_cause_summary.lazy_srcset_issue++;
                expectedServerPath = urlPath;
            } else {
                localPath = path.join(publicDir, urlPath);
                expectedServerPath = localPath;
                if (fs.existsSync(localPath)) {
                    exists = true;
                    // If it exists but puppeteer said broken, it's lazy load issue
                    rootCause = "lazy_srcset_issue";
                    root_cause_summary.lazy_srcset_issue++;
                } else {
                    // Search for similar
                    const filename = path.basename(urlPath);
                    const nameWithoutExt = path.parse(filename).name;
                    
                    // Is it in a different folder?
                    try {
                        const allFiles = globSync(`public/**/${nameWithoutExt}.*`, { nodir: true });
                        if (allFiles.length > 0) {
                            similar = allFiles;
                            rootCause = "wrong_folder_path";
                            root_cause_summary.wrong_folder_path++;
                        } else {
                            // physically missing
                            rootCause = "asset_missing_physically";
                            root_cause_summary.asset_missing_physically++;
                        }
                    } catch(e) {
                        rootCause = "asset_missing_physically";
                        root_cause_summary.asset_missing_physically++;
                    }
                }
            }
        }
        
        // refine root cause based on counts
        if (g.affected_pages_count > 50) {
             if (rootCause === "asset_missing_physically") {
                 rootCause = "code_component_issue";
                 root_cause_summary.asset_missing_physically--;
                 root_cause_summary.code_component_issue++;
             }
        } else if (rootCause === "asset_missing_physically" && g.affected_pages_count < 10) {
             rootCause = "db_content_issue";
             root_cause_summary.asset_missing_physically--;
             root_cause_summary.db_content_issue++;
        }
        
        g.likely_root_cause = rootCause;
        g.priority = g.affected_pages_count > 50 ? "P0" : (g.affected_pages_count > 10 ? "P1" : "P2");
        
        fileExistenceChecks.push({
            broken_src: g.image_src,
            expected_server_path: expectedServerPath,
            exists_at_expected_path: exists,
            similar_files_found: similar,
            candidate_fix: exists ? "None (lazy load false positive)" : (similar.length > 0 ? `Update path to ${similar[0]}` : "Need to upload/replace asset")
        });
    }
    
    fs.writeFileSync(path.join(outDir, 'broken_image_file_existence_check.json'), JSON.stringify(fileExistenceChecks, null, 2));
    
    // PAS 3 - TOP 20
    const top20 = groups.slice(0, 20).map((g, idx) => {
        const check = fileExistenceChecks.find(c => c.broken_src === g.image_src);
        let strategy = "restore_asset";
        if (check?.exists_at_expected_path) strategy = "hold";
        else if (check?.similar_files_found?.length > 0) strategy = "correct_path";
        else if (g.likely_root_cause === "db_content_issue") strategy = "update_db";
        else if (g.likely_root_cause === "code_component_issue") strategy = "update_component";
        
        return {
            rank: idx + 1,
            image_src: g.image_src,
            affected_pages_count: g.affected_pages_count,
            http_status: g.http_status,
            likely_root_cause: g.likely_root_cause,
            existing_candidate_replacement: check?.similar_files_found?.[0] || "",
            fix_strategy: strategy,
            safe_to_fix_automatically: ["correct_path", "update_component"].includes(strategy),
            owner_review_needed: ["restore_asset", "update_db", "replace_with_existing_asset"].includes(strategy)
        };
    });
    
    let md = "# Top 20 Broken Image Groups\n\n";
    top20.forEach(t => {
        md += `## ${t.rank}. ${t.image_src}\n`;
        md += `- **Affected Pages**: ${t.affected_pages_count}\n`;
        md += `- **Likely Root Cause**: ${t.likely_root_cause}\n`;
        md += `- **Fix Strategy**: ${t.fix_strategy}\n`;
        md += `- **Candidate**: ${t.existing_candidate_replacement}\n\n`;
    });
    fs.writeFileSync(path.join(outDir, 'top_broken_image_groups.md'), md);
    
    // PAS 5 - RAPORT FINAL
    const sum = {
        broken_images_instances: pas1.total_broken_instances,
        unique_broken_image_src_count: pas1.unique_broken_image_src_count,
        top_root_causes: Object.entries(root_cause_summary).filter(([k,v]) => v > 0).map(([k,v]) => ({ cause: k, count: v })),
        top_20_groups_generated: true,
        file_existence_check_done: true,
        estimated_fixes_needed: top20.length,
        safe_auto_fix_count: top20.filter(t => t.safe_to_fix_automatically).length,
        owner_review_needed_count: top20.filter(t => t.owner_review_needed).length,
        recommended_fix_order: ["code_component_issue", "wrong_folder_path", "db_content_issue", "asset_missing_physically"],
        implementation_allowed_now: false,
        final_status: "BROKEN_IMAGES_TRIAGE_READY"
    };
    
    fs.writeFileSync(path.join(outDir, 'triage_summary.json'), JSON.stringify(sum, null, 2));
    console.log('FINAL_SUMMARY_JSON:', JSON.stringify(sum));
}
runTriage();
