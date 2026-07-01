#!/bin/bash
osascript -e 'tell application "Google Chrome" to activate'
sleep 1
cliclick c:400,650
cliclick c:420,650
cliclick c:440,650
cliclick c:400,670
cliclick c:420,670
cliclick c:440,670
echo "Clicked coordinates"
sleep 45
screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/s5_coord_click.png
