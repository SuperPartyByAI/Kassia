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
    setter.call(input, 'https://www.kassia.ro/animatori-petreceri-copii-sector-5/');
    input.dispatchEvent(new Event('input', { bubbles: true }));
    input.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', code: 'Enter', keyCode: 13, which: 13, bubbles: true }));
    'Injected'
} else {
    'Input not found'
}
" > /dev/null

echo "Waiting 20s for inspection to complete..."
sleep 20

res=$(run_js "
const txt = document.body.innerText;
if (txt.includes('Adresa URL este pe Google') || txt.includes('URL is on Google')) {
    'INDEXED';
} else if (txt.includes('Adresa URL nu este pe Google') || txt.includes('URL is not on Google')) {
    'NOT_INDEXED';
} else {
    'UNKNOWN';
}
")
echo "Index Status: $res"
