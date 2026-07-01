const fs = require('fs');
const { execSync } = require('child_process');

const appleScriptPath = '/tmp/open_photos_extract.scpt';
const appleScriptContent = `
tell application "Google Chrome"
    set the_url to ""
    set the_title to ""
    set json_result to ""
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if (u contains "google.com") and (u does not contain "chatgpt.com") then
                set has_nmx to execute t javascript "document.documentElement.outerHTML.toLowerCase().includes('compania ta') || document.documentElement.outerHTML.toLowerCase().includes('editează pro')"
                if has_nmx is true then
                    set js_extract to "
                    (function() {
                        let dom = document.documentElement.outerHTML.toLowerCase();
                        let photos_panel_opened = false;
                        
                        let thumbnails = document.querySelectorAll('div[data-photo-url], div[data-photo-id], img[src*=googleusercontent]');
                        let count = thumbnails.length;
                        
                        let pending_count = (dom.match(/pending|în curs de examinare|in curs de examinare|processing/g) || []).length;
                        let live_count = (dom.match(/live|vizibil|visible/g) || []).length;
                        let not_approved_count = (dom.match(/not approved|respins/g) || []).length;
                        let failed_count = (dom.match(/failed|error|duplicate|nu s-au putut/g) || []).length;
                        
                        return JSON.stringify({
                            photos_panel_opened,
                            google_ui_thumbnail_count_detected: count > 0 ? count : null,
                            google_ui_owner_photo_count_detected: count > 0 ? count : null,
                            google_ui_pending_count_detected: pending_count > 0 ? pending_count : null,
                            google_ui_live_count_detected: live_count > 0 ? live_count : null,
                            google_ui_not_approved_count_detected: not_approved_count > 0 ? not_approved_count : null,
                            google_ui_failed_count_detected: failed_count > 0 ? failed_count : null,
                            raw_relevant_lines: []
                        });
                    })();
                    "
                    set res to execute t javascript js_extract
                    if res is not missing value then
                        set json_result to res
                        set the_url to u
                        exit repeat
                    end if
                end if
            end if
        end repeat
        if json_result is not "" then exit repeat
    end repeat
    return json_result
end tell
`;

fs.writeFileSync(appleScriptPath, appleScriptContent);

let rawOutput = "";
try {
    rawOutput = execSync(`osascript ${appleScriptPath}`).toString().trim();
} catch (e) {
    console.error("Failed to get DOM", e);
}

let extractedData = {};
try {
    extractedData = JSON.parse(rawOutput);
} catch(e) {}

const result = {
  source_context: "GBP_NMX",
  photos_panel_opened: false,
  google_ui_thumbnail_count_detected: extractedData.google_ui_thumbnail_count_detected || null,
  google_ui_owner_photo_count_detected: extractedData.google_ui_owner_photo_count_detected || null,
  google_ui_pending_count_detected: extractedData.google_ui_pending_count_detected || null,
  google_ui_live_count_detected: extractedData.google_ui_live_count_detected || null,
  google_ui_not_approved_count_detected: extractedData.google_ui_not_approved_count_detected || null,
  google_ui_failed_count_detected: extractedData.google_ui_failed_count_detected || null,
  photo_status_lines: [],
  final_status: "HOLD",
  hold_reasons: [
    "Încercarea de a da click automat pe linkul Fotografii a cauzat blocarea/timeout-ul comenzii AppleScript.",
    "Fără confirmare clară în DOM, statusul rămâne HOLD."
  ]
};

fs.writeFileSync('/tmp/gbp_photo_panel_proof.json', JSON.stringify(result, null, 2));
console.log("JSON saved to /tmp/gbp_photo_panel_proof.json");
