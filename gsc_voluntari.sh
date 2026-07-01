#!/bin/bash
URL="https://www.kassia.ro/animatori-petreceri-copii-voluntari/"

echo "Navigating to GSC home for: $URL"
osascript -e "tell application \"Google Chrome\" to execute front window's active tab javascript \"window.location.href = 'https://search.google.com/search-console?resource_id=https%3A%2F%2Fwww.kassia.ro%2F';\""

sleep 6

echo "Typing URL into inspection bar..."
osascript <<EOF
tell application "Google Chrome"
    execute front window's active tab javascript "
        const input = Array.from(document.querySelectorAll('input')).find(i => (i.placeholder || i.getAttribute('aria-label') || '').includes('Inspect'));
        if (input) {
            input.focus();
            const nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
            nativeInputValueSetter.call(input, '$URL');
            input.dispatchEvent(new Event('input', { bubbles: true }));
            input.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', code: 'Enter', keyCode: 13, which: 13, bubbles: true }));
            'SUCCESS_INPUT'
        } else {
            'NOT_FOUND'
        }
    "
end tell
EOF

echo "Waiting 6 seconds for inspection..."
sleep 6

echo "Clicking Request Indexing button..."
osascript <<EOF
tell application "Google Chrome"
    execute front window's active tab javascript "
        const buttons = Array.from(document.querySelectorAll('div[role=button], span[role=button], button'));
        const requestBtn = buttons.find(b => b.innerText && (
            b.innerText.toUpperCase().includes('REQUEST INDEXING') || 
            b.innerText.toUpperCase().includes('SOLICITĂ INDEXAREA') ||
            b.innerText.toUpperCase().includes('SOLICITAȚI INDEXAREA')
        ));
        if (requestBtn && !requestBtn.disabled && requestBtn.offsetParent !== null) {
            requestBtn.click();
            'CLICKED'
        } else {
            'NOT_FOUND'
        }
    "
end tell
EOF

echo "Waiting 18 seconds for the queue confirmation modal..."
sleep 18

echo "Taking screenshot..."
screencapture -x screenshot_voluntari_gsc.png
echo "Screenshot saved as screenshot_voluntari_gsc.png"
