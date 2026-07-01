#!/bin/bash
res=$(osascript -e '
tell application "Google Chrome"
    set foundTab to false
    repeat with w in windows
        repeat with t in tabs of w
            if URL of t contains "search.google.com/search-console" then
                set active tab index of w to index of t
                set index of w to 1
                tell application "System Events" to tell process "Google Chrome" to set frontmost to true
                
                set jsResult to execute t javascript "
                    let clicked = false;
                    const els = Array.from(document.querySelectorAll(\"div[role='button'], span, button, a\"));
                    const btn = els.find(e => e.textContent && e.textContent.includes(\"SOLICITĂ INDEXAREA\"));
                    if (btn) {
                        btn.click();
                        if(btn.parentElement) btn.parentElement.click();
                        clicked = true;
                    }
                    clicked ? \"Clicked\" : \"Not found\";
                "
                set foundTab to true
                return jsResult
            end if
        end repeat
        if foundTab then exit repeat
    end repeat
    if not foundTab then return "GSC tab not found"
end tell
')

echo "Result: $res"
if [[ "$res" == *"Clicked"* ]]; then
    echo "Waiting 45s for modal..."
    sleep 45
    screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/s5_real_click_proof.png
fi
