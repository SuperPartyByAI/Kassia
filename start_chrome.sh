#!/bin/bash
pkill -f "Google Chrome"
mkdir -p /tmp/chrome_profile_kassia_3
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --user-data-dir=/tmp/chrome_profile_kassia_3 --headless=new --disable-gpu > chrome_log.txt 2>&1 &
sleep 3
WSPATH=$(grep -oE '/devtools/browser/[a-zA-Z0-9-]+' chrome_log.txt | head -1)
mkdir -p "/Users/universparty/Library/Application Support/Google/Chrome"
echo -e "9222\n$WSPATH" > "/Users/universparty/Library/Application Support/Google/Chrome/DevToolsActivePort"
cat "/Users/universparty/Library/Application Support/Google/Chrome/DevToolsActivePort"
