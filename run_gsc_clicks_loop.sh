#!/bin/bash

run_js() {
  local js_code="$1"
  osascript -e "tell application \"Google Chrome\" to execute active tab of front window javascript \"${js_code}\""
}

wait_and_click() {
  for i in {1..30}; do
    res=$(run_js "
    const buttons = Array.from(document.querySelectorAll('div[role=button], span[role=button], button'));
    const requestBtn = buttons.find(b => b.innerText && (b.innerText.toUpperCase().includes('REQUEST INDEXING') || b.innerText.toUpperCase().includes('SOLICITĂ INDEXAREA') || b.innerText.toUpperCase().includes('SOLICITAȚI INDEXAREA')));
    if (requestBtn && !requestBtn.disabled && requestBtn.offsetParent !== null) {
        requestBtn.click();
        'CLICKED'
    } else {
        'WAITING'
    }
    ")
    if [[ "$res" == *"CLICKED"* ]]; then
      echo "Clicked Request Indexing!"
      return 0
    fi
    sleep 2
  done
  echo "Failed to click."
}

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
wait_and_click
sleep 20
echo "Taking screenshot of Homepage confirmation..."
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
wait_and_click
sleep 20
echo "Taking screenshot of Sector 1 confirmation..."
screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/sector1_indexing_proof.png

echo "Done!"
