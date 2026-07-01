#!/bin/bash

run_js() {
  osascript -e "tell application \"Google Chrome\" to execute active tab of front window javascript \"$1\""
}

osascript -e 'tell application "Google Chrome" to activate'
sleep 2

run_js "window.location.href = 'https://search.google.com/search-console';"
sleep 10

run_js "
const input = Array.from(document.querySelectorAll('input')).find(i => (i.placeholder || i.getAttribute('aria-label') || '').includes('Inspect'));
if (input) {
    input.focus();
    const setter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
    setter.call(input, 'https://www.kassia.ro/animatori-petreceri-copii-sector-4/');
    input.dispatchEvent(new Event('input', { bubbles: true }));
    input.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', code: 'Enter', keyCode: 13, which: 13, bubbles: true }));
    'Injected'
} else {
    'Input not found'
}
" > /dev/null

echo "Waiting 30s for inspection to finish..."
sleep 30

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

if [[ "$res" == *"Clicked"* ]]; then
    echo "Waiting for the success modal to appear (up to 60s)..."
    for i in {1..30}; do
        modal=$(run_js "document.body.innerText")
        if [[ "$modal" == *"Indexarea a fost solicitată"* ]] || [[ "$modal" == *"Indexing requested"* ]] || [[ "$modal" == *"Quota exceeded"* ]]; then
            echo "Modal found!"
            osascript -e 'tell application "Google Chrome" to activate'
            sleep 1
            screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/sector4_real_indexing_proof.png
            echo "Screenshot saved."
            exit 0
        fi
        sleep 2
    done
fi

osascript -e 'tell application "Google Chrome" to activate'
screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/sector4_real_indexing_proof.png
