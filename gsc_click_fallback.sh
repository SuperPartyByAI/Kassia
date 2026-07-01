#!/bin/bash

run_js() {
  osascript -e "tell application \"Google Chrome\" to execute active tab of front window javascript \"$1\""
}

osascript -e 'tell application "Google Chrome" to activate'
sleep 1

res=$(run_js "
let clicked = false;
try {
    // Try finding by textContent
    const els = Array.from(document.querySelectorAll('div[role=\"button\"], span, button, a'));
    const btn = els.find(e => e.textContent && e.textContent.toUpperCase().includes('SOLICITĂ INDEXAREA'));
    if (btn) {
        btn.click();
        clicked = true;
    }
} catch(e) {}

if (!clicked) {
    try {
        const xpath = \"//div[contains(text(), 'SOLICITĂ INDEXAREA')] | //span[contains(text(), 'SOLICITĂ INDEXAREA')]\";
        const matchingElement = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        if (matchingElement) {
            matchingElement.click();
            clicked = true;
        }
    } catch(e) {}
}

clicked ? 'Clicked via JS' : 'Not found via JS';
")
echo "JS Result: $res"

if [[ "$res" != *"Clicked"* ]]; then
    # Fallback to AppleScript keystrokes (Tab navigation) as absolute last resort
    echo "Falling back to Keystrokes..."
    osascript -e 'tell application "System Events"' -e 'keystroke "f" using command down' -e 'delay 0.5' -e 'keystroke "SOLICITĂ INDEXAREA"' -e 'delay 0.5' -e 'key code 53' -e 'delay 0.5' -e 'key code 36' -e 'end tell'
fi

echo "Waiting 20s for modal..."
sleep 20
screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/s5_force_click.png
