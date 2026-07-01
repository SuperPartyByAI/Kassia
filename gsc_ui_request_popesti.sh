#!/bin/bash

run_js() {
  osascript -e "tell application \"Google Chrome\" to execute active tab of front window javascript \"$1\""
}

osascript -e 'tell application "Google Chrome" to activate'
sleep 2

# Type URL into inspection bar
res=$(run_js "
const input = Array.from(document.querySelectorAll('input')).find(i => (i.placeholder || i.getAttribute('aria-label') || '').toLowerCase().includes('inspect'));
if (input) {
    input.focus();
    const nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
    nativeInputValueSetter.call(input, 'https://www.kassia.ro/animatori-petreceri-copii-popesti-leordeni/');
    input.dispatchEvent(new Event('input', { bubbles: true }));
    input.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', code: 'Enter', keyCode: 13, which: 13, bubbles: true }));
    'Input Success'
} else {
    'Input Not Found'
}
")
echo "Input result: $res"

echo "Waiting 25s for inspection to load from Google Index..."
sleep 25

# Attempt click on the RO button
click_res=$(run_js "
const els = Array.from(document.querySelectorAll('*'));
const btn = els.find(e => e.innerText && (e.innerText.trim() === 'SOLICITĂ INDEXAREA' || e.innerText.trim() === 'SOLICITAȚI INDEXAREA' || e.innerText.trim() === 'REQUEST INDEXING'));
if (btn && !btn.disabled) {
    btn.click();
    'Clicked'
} else {
    'Button not found or disabled'
}
")
echo "Result of click attempt: $click_res"

echo "Waiting for the success modal to appear (20s)..."
sleep 20

screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/popesti_real_indexing_proof_final_v2.png
echo "Screenshot saved."
