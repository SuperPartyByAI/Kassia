#!/bin/bash

run_js() {
  local js_code="$1"
  osascript -e "tell application \"Google Chrome\" to execute active tab of front window javascript \"${js_code}\""
}

echo "Activating Google Chrome to ensure it is in the front..."
osascript -e 'tell application "Google Chrome" to activate'
sleep 2

echo "Navigating to Kassia Homepage in GSC..."
run_js "window.location.href = 'https://search.google.com/search-console?resource_id=https%3A%2F%2Fwww.kassia.ro%2F';"
sleep 8

echo "Typing https://www.kassia.ro/ into the inspection bar..."
run_js "
const input = Array.from(document.querySelectorAll('input')).find(i => (i.placeholder || i.getAttribute('aria-label') || '').includes('Inspect'));
if (input) {
    input.focus();
    const setter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
    setter.call(input, 'https://www.kassia.ro/');
    input.dispatchEvent(new Event('input', { bubbles: true }));
    input.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', code: 'Enter', keyCode: 13, which: 13, bubbles: true }));
}
"

# Wait for inspection to complete
sleep 15

echo "Clicking Request Indexing..."
run_js "
const buttons = Array.from(document.querySelectorAll('div[role=button], span[role=button], button'));
const requestBtn = buttons.find(b => b.innerText && (b.innerText.toUpperCase().includes('REQUEST INDEXING') || b.innerText.toUpperCase().includes('SOLICITĂ INDEXAREA') || b.innerText.toUpperCase().includes('SOLICITAȚI INDEXAREA')));
if (requestBtn && !requestBtn.disabled && requestBtn.offsetParent !== null) {
    requestBtn.click();
}
"

echo "Waiting for the indexing queue to process..."
sleep 20

echo "Taking screenshot of Homepage confirmation..."
# Force Chrome to be active right before taking screenshot
osascript -e 'tell application "Google Chrome" to activate'
sleep 1
screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/homepage_indexing_proof.png

echo "Navigating to Kassia Sector 1 in GSC..."
run_js "window.location.href = 'https://search.google.com/search-console?resource_id=https%3A%2F%2Fwww.kassia.ro%2F';"
sleep 8

echo "Typing https://www.kassia.ro/animatori-petreceri-copii-sector-1/ into the inspection bar..."
run_js "
const input = Array.from(document.querySelectorAll('input')).find(i => (i.placeholder || i.getAttribute('aria-label') || '').includes('Inspect'));
if (input) {
    input.focus();
    const setter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
    setter.call(input, 'https://www.kassia.ro/animatori-petreceri-copii-sector-1/');
    input.dispatchEvent(new Event('input', { bubbles: true }));
    input.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', code: 'Enter', keyCode: 13, which: 13, bubbles: true }));
}
"

sleep 15

echo "Clicking Request Indexing..."
run_js "
const buttons = Array.from(document.querySelectorAll('div[role=button], span[role=button], button'));
const requestBtn = buttons.find(b => b.innerText && (b.innerText.toUpperCase().includes('REQUEST INDEXING') || b.innerText.toUpperCase().includes('SOLICITĂ INDEXAREA') || b.innerText.toUpperCase().includes('SOLICITAȚI INDEXAREA')));
if (requestBtn && !requestBtn.disabled && requestBtn.offsetParent !== null) {
    requestBtn.click();
}
"

sleep 20

echo "Taking screenshot of Sector 1 confirmation..."
osascript -e 'tell application "Google Chrome" to activate'
sleep 1
screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/sector1_indexing_proof.png

echo "Done!"
