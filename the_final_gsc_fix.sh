#!/bin/bash

run_js() {
  osascript -e "tell application \"Google Chrome\" to execute active tab of front window javascript \"$1\""
}

osascript -e 'tell application "Google Chrome" to activate'
sleep 2

res1=$(run_js "
const input = Array.from(document.querySelectorAll('input')).find(i => (i.placeholder || i.getAttribute('aria-label') || '').includes('Inspect'));
if (input) {
    input.focus();
    const setter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
    setter.call(input, 'https://www.kassia.ro/animatori-petreceri-copii-sector-5/');
    input.dispatchEvent(new Event('input', { bubbles: true }));
    input.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', code: 'Enter', keyCode: 13, which: 13, bubbles: true }));
    'Injected'
} else {
    'Input not found'
}
")
echo "Inject Result: $res1"

echo "Waiting 30s for the live URL inspection to load..."
sleep 30

res2=$(run_js "
const els = Array.from(document.querySelectorAll('div[role=\"button\"], span, button'));
const btn = els.find(e => e.textContent && e.textContent.includes('SOLICITĂ INDEXAREA'));
if (btn) {
    btn.click();
    if(btn.parentElement) btn.parentElement.click();
    'Clicked button'
} else {
    'Button not found'
}
")
echo "Click Result: $res2"

echo "Waiting 45s for the modal 'Indexarea a fost solicitată' to appear..."
sleep 45

screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/sector5_real_indexing_proof_final.png
echo "Screenshot saved."
