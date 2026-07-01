#!/bin/bash

# 1. Activate Chrome and find the GSC tab, then navigate via JS
osascript -e '
tell application "Google Chrome"
    activate
    set foundTab to false
    repeat with w in windows
        set t_index to 1
        repeat with t in tabs of w
            if URL of t contains "search.google.com" then
                set active tab index of w to t_index
                set index of w to 1
                tell application "System Events" to tell process "Google Chrome" to set frontmost to true
                delay 1
                execute t javascript "window.location.href = \"https://search.google.com/search-console/inspect?resource_id=https%3A%2F%2Fwww.kassia.ro%2F&item=https%3A%2F%2Fwww.kassia.ro%2Fanimatori-petreceri-copii-sector-6%2F\";"
                set foundTab to true
                exit repeat
            end if
            set t_index to t_index + 1
        end repeat
        if foundTab then exit repeat
    end repeat
end tell
'

echo "Navigating to Sector 6 inspection. Waiting 30s..."
sleep 30

# 2. Carpet bomb the coordinates where "SOLICITĂ INDEXAREA" is
# 420-480 for X, and 530-570 for Y
cliclick c:420,530
sleep 0.1
cliclick c:440,530
sleep 0.1
cliclick c:460,530
sleep 0.1
cliclick c:480,530
sleep 0.1

cliclick c:420,550
sleep 0.1
cliclick c:440,550
sleep 0.1
cliclick c:460,550
sleep 0.1
cliclick c:480,550
sleep 0.1

cliclick c:420,570
sleep 0.1
cliclick c:440,570
sleep 0.1
cliclick c:460,570
sleep 0.1
cliclick c:480,570
sleep 0.1

# Let's add an extra row just in case it's higher
cliclick c:420,510
sleep 0.1
cliclick c:440,510
sleep 0.1
cliclick c:460,510
sleep 0.1
cliclick c:480,510
sleep 0.1

echo "Waiting 15 seconds for modal to appear..."
sleep 15

screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/s6_ultimate_proof.png
echo "Screenshot saved."
