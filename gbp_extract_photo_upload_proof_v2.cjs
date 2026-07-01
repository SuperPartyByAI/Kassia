const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const FOLDER_PATH = '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze-seo';

let local_folder_exists = false;
let local_image_files = [];
let local_non_image_files = [];
let local_zero_byte_files = [];
let local_duplicate_names = [];
let local_files_over_5mb = [];
let local_files_under_10kb = [];
let local_image_files_count = 0;
let expected_upload_count = 73;

if (fs.existsSync(FOLDER_PATH)) {
    local_folder_exists = true;
    const files = fs.readdirSync(FOLDER_PATH).filter(f => !f.startsWith('.'));
    let names = new Set();
    files.forEach(f => {
        let fullPath = path.join(FOLDER_PATH, f);
        let stat = fs.statSync(fullPath);
        if (stat.isFile()) {
            if (names.has(f.toLowerCase())) {
                local_duplicate_names.push(f);
            }
            names.add(f.toLowerCase());

            const ext = path.extname(f).toLowerCase();
            if (['.jpg', '.jpeg', '.png', '.webp', '.heic'].includes(ext)) {
                local_image_files.push(f);
                if (stat.size === 0) local_zero_byte_files.push(f);
                if (stat.size > 5 * 1024 * 1024) local_files_over_5mb.push(f);
                if (stat.size > 0 && stat.size < 10 * 1024) local_files_under_10kb.push(f);
            } else {
                local_non_image_files.push(f);
            }
        }
    });
    local_image_files_count = local_image_files.length;
}

const appleScriptPath = '/tmp/extract_photo_status_v2.scpt';
const appleScriptContent = `
tell application "Google Chrome"
    set the_url to ""
    set the_title to ""
    set json_result to ""
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if (u contains "google.com") and (u does not contain "chatgpt.com") then
                set js to "
                (function() {
                    let dom = document.documentElement.outerHTML.toLowerCase();
                    if (!dom.includes('editează pro') && !dom.includes('compania ta')) return 'NO_NMX';
                    
                    let photos_panel_opened = dom.includes('fotografii') || dom.includes('photos') || dom.includes('adaugă fotografie') || dom.includes('vezi fotografiile') || dom.includes('pozele tale') || dom.includes('de la proprietar') || dom.includes('owner');
                    let upload_modal_detected = dom.includes('selectează fotografii') || dom.includes('fotografii din computer');
                    let upload_in_progress_detected = dom.includes('se încarcă') || dom.includes('se incarca') || dom.includes('uploading') || dom.includes('încărcare');
                    let upload_completed_detected = dom.includes('uploaded') || dom.includes('încărcate') || dom.includes('incarcate') || dom.includes('finalizat') || dom.includes('done');
                    let upload_failed_detected = dom.includes('failed') || dom.includes('error') || dom.includes('nu s-au putut') || dom.includes('respins') || dom.includes('duplicate');
                    let upload_pending_review_detected = dom.includes('pending') || dom.includes('în curs de examinare') || dom.includes('in curs de examinare') || dom.includes('processing');
                    let upload_not_approved_detected = dom.includes('not approved') || dom.includes('respins');
                    
                    let raw = [];
                    const textContent = document.body.innerText;
                    const keywords = ['fotografii', 'photos', 'adaugă fotografie', 'vezi fotografiile', 'pozele tale', 'proprietar', 'owner', 'se incarca', 'se încarcă', 'încărcare', 'uploading', 'uploaded', 'încărcate', 'incarcate', 'pending', 'în curs de examinare', 'in curs de examinare', 'processing', 'live', 'not approved', 'respins', 'failed', 'error', 'duplicate', 'nu s-au putut', 'finalizat', 'done'];
                    
                    textContent.split(/(?<=\\.)|(?<=\\n)/).forEach(sentence => {
                        let s = sentence.trim();
                        if (s.length > 3 && s.length < 300) {
                            if (keywords.some(k => s.toLowerCase().includes(k))) {
                                if (!raw.includes(s)) raw.push(s);
                            }
                        }
                    });

                    let google_ui_photo_count_detected = null;
                    let google_ui_thumbnail_count_detected = null;
                    let google_ui_owner_photo_count_detected = null;
                    let google_ui_pending_count_detected = null;
                    let google_ui_live_count_detected = null;
                    let google_ui_not_approved_count_detected = null;
                    let google_ui_failed_count_detected = null;

                    // Attempt to count thumbnails roughly
                    let thumbnails = document.querySelectorAll('div[data-photo-url], img[src*=\\"googleusercontent\\"]');
                    if (thumbnails.length > 0) {
                        google_ui_thumbnail_count_detected = thumbnails.length;
                    }

                    return JSON.stringify({
                        photos_panel_opened,
                        upload_modal_detected,
                        upload_in_progress_detected,
                        upload_completed_detected,
                        upload_failed_detected,
                        upload_pending_review_detected,
                        upload_not_approved_detected,
                        raw_relevant_lines: raw,
                        google_ui_photo_count_detected,
                        google_ui_thumbnail_count_detected,
                        google_ui_owner_photo_count_detected,
                        google_ui_pending_count_detected,
                        google_ui_live_count_detected,
                        google_ui_not_approved_count_detected,
                        google_ui_failed_count_detected
                    });
                })();
                "
                set res to execute t javascript js
                if res is not "NO_NMX" and res is not missing value then
                    set json_result to res
                    set the_url to u
                    set the_title to title of t
                    exit repeat
                end if
            end if
        end repeat
        if json_result is not "" then exit repeat
    end repeat
    return the_url & "|||" & the_title & "|||" & json_result
end tell
`;

fs.writeFileSync(appleScriptPath, appleScriptContent);

let rawOutput = "";
try {
    rawOutput = execSync(`osascript ${appleScriptPath}`).toString().trim();
} catch (e) {
    console.error("Failed to get DOM", e);
}

let source_context = "NOT_FOUND";
let url = "";
let title = "";
let extractedData = {};

if (rawOutput && rawOutput.includes("|||")) {
    let parts = rawOutput.split("|||");
    url = parts[0];
    title = parts[1];
    let jsonStr = parts.slice(2).join("|||");
    try {
        extractedData = JSON.parse(jsonStr);
        source_context = "GBP_NMX";
    } catch(e) {}
}

let pass_checks = {
    local_files_count_ok: local_image_files_count === expected_upload_count,
    local_files_technical_ok: local_zero_byte_files.length === 0 && local_duplicate_names.length === 0 && local_files_over_5mb.length === 0,
    photos_panel_opened_ok: !!extractedData.photos_panel_opened,
    upload_submitted_or_visible_ok: extractedData.upload_completed_detected || extractedData.upload_pending_review_detected || false,
    no_failed_uploads_ok: !extractedData.upload_failed_detected,
    no_not_approved_ok: !extractedData.upload_not_approved_detected
};

let hold_reasons = [];
let final_status = "HOLD";

if (extractedData.upload_in_progress_detected) {
    final_status = "UPLOAD_IN_PROGRESS";
} else if (extractedData.upload_failed_detected || extractedData.upload_not_approved_detected) {
    final_status = "FAIL";
    hold_reasons.push("Erori sau poze respinse/duplicate detectate în UI.");
} else if (extractedData.upload_completed_detected || extractedData.upload_pending_review_detected) {
    final_status = "UPLOAD_SUBMITTED_PENDING";
} else if (extractedData.photos_panel_opened) {
    if (extractedData.google_ui_thumbnail_count_detected >= 73) {
        final_status = "LIVE_ALL";
    } else if (extractedData.google_ui_thumbnail_count_detected > 0) {
        final_status = "LIVE_PARTIAL";
        hold_reasons.push("Doar câteva poze vizibile momentan, Google s-ar putea să proceseze restul.");
    } else {
        hold_reasons.push("Panoul Fotografii a fost deschis, dar nu s-a putut confirma statusul imaginilor noi sau nu au apărut thumbnails.");
    }
} else {
    hold_reasons.push("Nu s-au putut detecta texte clare despre statusul de upload sau live în DOM, și nici panoul de fotografii nu pare să fie focusul curent.");
}

const result = {
  source_context,
  url,
  title,
  extracted_at: new Date().toISOString(),
  local_folder: FOLDER_PATH,
  local_folder_exists,
  local_image_files_count,
  local_image_files,
  local_non_image_files,
  local_zero_byte_files,
  local_duplicate_names,
  local_files_over_5mb,
  local_files_under_10kb,
  expected_upload_count,
  photos_panel_opened: !!extractedData.photos_panel_opened,
  google_ui_photo_count_detected: extractedData.google_ui_photo_count_detected || null,
  google_ui_thumbnail_count_detected: extractedData.google_ui_thumbnail_count_detected || null,
  google_ui_owner_photo_count_detected: extractedData.google_ui_owner_photo_count_detected || null,
  google_ui_pending_count_detected: extractedData.google_ui_pending_count_detected || null,
  google_ui_live_count_detected: extractedData.google_ui_live_count_detected || null,
  google_ui_not_approved_count_detected: extractedData.google_ui_not_approved_count_detected || null,
  google_ui_failed_count_detected: extractedData.google_ui_failed_count_detected || null,
  upload_modal_detected: !!extractedData.upload_modal_detected,
  upload_in_progress_detected: !!extractedData.upload_in_progress_detected,
  upload_completed_detected: !!extractedData.upload_completed_detected,
  upload_failed_detected: !!extractedData.upload_failed_detected,
  upload_pending_review_detected: !!extractedData.upload_pending_review_detected,
  upload_not_approved_detected: !!extractedData.upload_not_approved_detected,
  photo_status_lines: extractedData.raw_relevant_lines || [],
  raw_relevant_lines: extractedData.raw_relevant_lines || [],
  pass_checks,
  final_status,
  hold_reasons
};

fs.writeFileSync('/tmp/gbp_photo_upload_proof_v2.json', JSON.stringify(result, null, 2));
console.log("JSON saved to /tmp/gbp_photo_upload_proof_v2.json");
