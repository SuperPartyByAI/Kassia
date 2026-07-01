#!/bin/bash
osascript -e 'tell application "Google Chrome" to activate'
sleep 1
osascript -e "tell application \"Google Chrome\" to execute active tab of front window javascript \"
const els = Array.from(document.querySelectorAll('span, div[role=\\\"button\\\"], button, a'));
const btn = els.find(e => e.textContent && e.textContent.includes('SOLICITĂ INDEXAREA'));
if (btn) {
    btn.click();
    if(btn.parentElement) btn.parentElement.click();
    'Clicked'
} else {
    'Button not found'
}
\""
