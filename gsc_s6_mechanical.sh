#!/bin/bash

# Bring Chrome to front and inject keystrokes
osascript -e '
tell application "Google Chrome" to activate
delay 1
tell application "System Events"
    keystroke "/"
    delay 1
    keystroke "https://www.kassia.ro/animatori-petreceri-copii-sector-6/"
    delay 0.5
    key code 36
end tell
'

echo "Waiting 30 seconds for GSC live inspection to finish..."
sleep 30

# Carpet bomb the button coordinates
cliclick c:420,530
sleep 0.1
cliclick c:440,530
sleep 0.1
cliclick c:460,530
sleep 0.1
cliclick c:420,550
sleep 0.1
cliclick c:440,550
sleep 0.1
cliclick c:460,550
sleep 0.1
cliclick c:420,570
sleep 0.1
cliclick c:440,570
sleep 0.1
cliclick c:460,570
sleep 0.1
cliclick c:480,530
sleep 0.1
cliclick c:480,550
sleep 0.1
cliclick c:480,570
sleep 0.1
cliclick c:440,550
echo "Clicked"

echo "Waiting 15 seconds for modal..."
sleep 15

screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/s6_final_indexing_proof.png
echo "Screenshot saved."
