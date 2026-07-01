const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const FOLDER_PATH = '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze-seo';

let local_folder_exists = false;
let local_files = [];
let local_invalid_files = [];
let local_duplicate_names = [];
let local_files_count = 0;

if (fs.existsSync(FOLDER_PATH)) {
    local_folder_exists = true;
    const files = fs.readdirSync(FOLDER_PATH).filter(f => !f.startsWith('.'));
    local_files_count = files.length;
    let names = new Set();
    files.forEach(f => {
        local_files.push(f);
        if (names.has(f)) { local_duplicate_names.push(f); }
        names.add(f);
        const ext = path.extname(f).toLowerCase();
        if (!['.jpg', '.jpeg', '.png', '.webp', '.heic'].includes(ext)) {
            local_invalid_files.push(f);
        }
    });
}

const appleScriptPath = '/tmp/extract_photo_status_fast.scpt';
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
                    
                    let upload_modal_detected = dom.includes('selectează fotografii') || dom.includes('fotografii din computer');
                    let upload_in_progress_detected = dom.includes('se încarcă') || dom.includes('se incarca') || dom.includes('uploading') || dom.includes('încărcare');
                    let upload_completed_detected = dom.includes('uploaded') || dom.includes('încărcate') || dom.includes('incarcate') || dom.includes('finalizat') || dom.includes('done');
                    let upload_failed_detected = dom.includes('failed') || dom.includes('error') || dom.includes('nu s-au putut') || dom.includes('respins') || dom.includes('duplicate');
                    let upload_pending_review_detected = dom.includes('pending') || dom.includes('în curs de examinare') || dom.includes('in curs de examinare') || dom.includes('processing');
                    let upload_not_approved_detected = dom.includes('not approved') || dom.includes('respins');
                    
                    let raw = [];
                    const textContent = document.body.innerText;
                    const keywords = ['se incarca', 'se încarcă', 'încărcare', 'uploading', 'uploaded', 'încărcate', 'incarcate', 'pending', 'în curs de examinare', 'in curs de examinare', 'processing', 'live', 'not approved', 'respins', 'failed', 'error', 'duplicate', 'nu s-au putut', 'finalizat', 'done', 'selectează fotografii', 'fotografii din computer'];
                    
                    textContent.split(/(?<=\\.)|(?<=\\n)/).forEach(sentence => {
                        let s = sentence.trim();
                        if (s.length > 5 && s.length < 300) {
                            if (keywords.some(k => s.toLowerCase().includes(k))) {
                                if (!raw.includes(s)) raw.push(s);
                            }
                        }
                    });

                    return JSON.stringify({
                        upload_modal_detected,
                        upload_in_progress_detected,
                        upload_completed_detected,
                        upload_failed_detected,
                        upload_pending_review_detected,
                        upload_not_approved_detected,
                        raw_relevant_lines: raw
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
    local_72_files_ok: local_files_count >= 72,
    upload_started_ok: extractedData.upload_modal_detected || extractedData.upload_in_progress_detected || extractedData.upload_completed_detected || extractedData.upload_pending_review_detected || false,
    upload_completed_or_pending_ok: extractedData.upload_completed_detected || extractedData.upload_pending_review_detected || false,
    no_failed_uploads_ok: !extractedData.upload_failed_detected,
    no_not_approved_ok: !extractedData.upload_not_approved_detected,
    google_photos_visible_or_pending_ok: extractedData.upload_completed_detected || extractedData.upload_pending_review_detected || false
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
} else {
    hold_reasons.push("Nu s-au putut detecta texte clare despre statusul de upload sau live în DOM.");
}

const result = {
  source_context,
  url,
  title,
  extracted_at: new Date().toISOString(),
  local_folder: FOLDER_PATH,
  local_folder_exists,
  local_files_count,
  local_files,
  local_invalid_files,
  local_duplicate_names,
  expected_upload_count: 72,
  upload_modal_detected: !!extractedData.upload_modal_detected,
  upload_in_progress_detected: !!extractedData.upload_in_progress_detected,
  upload_completed_detected: !!extractedData.upload_completed_detected,
  upload_failed_detected: !!extractedData.upload_failed_detected,
  upload_pending_review_detected: !!extractedData.upload_pending_review_detected,
  upload_not_approved_detected: !!extractedData.upload_not_approved_detected,
  google_ui_photo_count_detected: null,
  google_ui_thumbnail_count_detected: null,
  google_ui_live_count_detected: null,
  google_ui_pending_count_detected: null,
  google_ui_not_approved_count_detected: null,
  google_ui_failed_count_detected: null,
  photo_status_lines: extractedData.raw_relevant_lines || [],
  raw_relevant_lines: extractedData.raw_relevant_lines || [],
  pass_checks,
  final_status,
  hold_reasons
};

fs.writeFileSync('/tmp/gbp_photo_upload_proof.json', JSON.stringify(result, null, 2));
console.log("JSON saved to /tmp/gbp_photo_upload_proof.json");
