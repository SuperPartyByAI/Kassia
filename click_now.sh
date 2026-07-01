#!/bin/bash
osascript -e 'tell application "Google Chrome" to activate'
sleep 1
osascript -e "tell application \"Google Chrome\" to execute active tab of front window javascript \"
const els = Array.from(document.querySelectorAll('*'));
const btn = els.find(e => e.innerText && e.innerText.trim() === 'SOLICITĂ INDEXAREA');
if (btn && !btn.disabled) {
    btn.click();
    'Clicked'
} else {
    'Button not found'
}
\""
