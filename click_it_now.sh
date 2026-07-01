#!/bin/bash
osascript -e '
tell application "Google Chrome"
    execute active tab of front window javascript "
        const els = Array.from(document.querySelectorAll(\"span\"));
        const btn = els.find(e => e.textContent && e.textContent.includes(\"SOLICITĂ INDEXAREA\"));
        if (btn) {
            btn.click();
            if(btn.parentElement) btn.parentElement.click();
            if(btn.parentElement && btn.parentElement.parentElement) btn.parentElement.parentElement.click();
        }
    "
end tell
'
