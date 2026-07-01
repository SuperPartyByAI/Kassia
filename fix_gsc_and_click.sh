#!/bin/bash
osascript -e '
tell application "Google Chrome"
	activate
	set foundTab to false
	repeat with w in windows
		set i to 1
		repeat with t in tabs of w
			if URL of t contains "search.google.com/search-console" then
				set active tab index of w to i
				set index of w to 1
				set foundTab to true
				exit repeat
			end if
			set i to i + 1
		end repeat
		if foundTab then exit repeat
	end repeat
end tell
'

sleep 2

# Inject JS into the active tab of the front window (which is now guaranteed to be GSC)
osascript -e '
tell application "Google Chrome"
    execute active tab of front window javascript "
        const els = Array.from(document.querySelectorAll(\"div[role='button'], span, button\"));
        const btn = els.find(e => e.textContent && e.textContent.includes(\"SOLICITĂ INDEXAREA\"));
        if (btn) {
            btn.click();
            if(btn.parentElement) btn.parentElement.click();
        }
    "
end tell
'

# Just in case JS fails (e.g. Shadow DOM restrictions in GSC), hit TAB 15 times and press ENTER
# From the URL bar, pressing TAB repeatedly usually focuses elements. But clicking is better.
# We will use cliclick as a fallback since the window is now physically at the front.
# Let's take a screenshot BEFORE cliclick to prove it's in front
screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/s5_window_front.png

cliclick c:450,650
cliclick c:450,670

echo "Waiting for modal..."
sleep 45
screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/s5_real_indexing_proof.png
