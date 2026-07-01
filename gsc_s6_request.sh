#!/bin/bash

# Find the window with GSC and inject JS to navigate to the S6 URL via the UI search bar
osascript -e '
tell application "Google Chrome"
    set foundTab to false
    repeat with w in windows
        repeat with t in tabs of w
            if URL of t contains "search.google.com" then
                set active tab index of w to index of t
                set index of w to 1
                tell application "System Events" to tell process "Google Chrome" to set frontmost to true
                delay 1
                execute t javascript "
                    const input = Array.from(document.querySelectorAll(\"input\")).find(i => (i.placeholder || i.getAttribute(\"aria-label\") || \"\").includes(\"Inspect\"));
                    if (input) {
                        input.focus();
                        const setter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, \"value\").set;
                        setter.call(input, \"https://www.kassia.ro/animatori-petreceri-copii-sector-6/\");
                        input.dispatchEvent(new Event(\"input\", { bubbles: true }));
                        input.dispatchEvent(new KeyboardEvent(\"keydown\", { key: \"Enter\", code: \"Enter\", keyCode: 13, which: 13, bubbles: true }));
                    }
                "
                set foundTab to true
                exit repeat
            end if
        end repeat
        if foundTab then exit repeat
    end repeat
end tell
'

echo "Waiting 30s for the live URL inspection to load..."
sleep 30

# Inject the click
osascript -e '
tell application "Google Chrome"
    set foundTab to false
    repeat with w in windows
        repeat with t in tabs of w
            if URL of t contains "search.google.com" then
                execute t javascript "
                    const els = Array.from(document.querySelectorAll(\"span\"));
                    const btn = els.find(e => e.textContent && e.textContent.includes(\"SOLICITĂ INDEXAREA\"));
                    if (btn) {
                        btn.click();
                        if(btn.parentElement) btn.parentElement.click();
                        if(btn.parentElement && btn.parentElement.parentElement) btn.parentElement.parentElement.click();
                    }
                "
                set foundTab to true
                exit repeat
            end if
        end repeat
        if foundTab then exit repeat
    end repeat
end tell
'

echo "Waiting 45s for the modal 'Indexarea a fost solicitată' to appear..."
sleep 45

screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/sector6_real_indexing_proof.png
echo "Screenshot saved."
