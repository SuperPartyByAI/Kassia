#!/bin/bash

echo "Waiting 10 seconds for user to bring GSC window to the front..."
sleep 10

run_js() {
  osascript -e "tell application \"Google Chrome\" to execute active tab of front window javascript \"$1\""
}

# Navigate directly to the Sector 6 Inspection URL
run_js "window.location.href = 'https://search.google.com/search-console/inspect?resource_id=https%3A%2F%2Fwww.kassia.ro%2F&item=https%3A%2F%2Fwww.kassia.ro%2Fanimatori-petreceri-copii-sector-6%2F';" > /dev/null

echo "Waiting 25s for inspection to load from Google Index..."
sleep 25

# Attempt click
res=$(run_js "
const els = Array.from(document.querySelectorAll('*'));
const btn = els.find(e => e.innerText && e.innerText.trim() === 'SOLICITĂ INDEXAREA');
if (btn && !btn.disabled) {
    btn.click();
    'Clicked'
} else {
    'Button not found or disabled'
}
")
echo "Result of click attempt: $res"

# Fallback carpet bomb just in case Shadow DOM hides the button from JS
cliclick c:420,530
sleep 0.1
cliclick c:440,530
sleep 0.1
cliclick c:460,530
sleep 0.1
cliclick c:440,550
sleep 0.1
cliclick c:460,550
sleep 0.1
cliclick c:440,570

echo "Waiting for the success modal to appear (15s)..."
sleep 15

osascript -e 'tell application "Google Chrome" to activate'
screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/sector6_real_indexing_proof_final.png
echo "Screenshot saved."
