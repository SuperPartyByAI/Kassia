#!/bin/bash

echo "Waiting up to 2 minutes for the success modal..."
for i in {1..60}; do
  res=$(osascript -e 'tell application "Google Chrome" to execute active tab of front window javascript "document.body.innerText"')
  if [[ "$res" == *"Indexarea a fost solicitată"* ]] || [[ "$res" == *"Indexing requested"* ]]; then
    echo "Modal found!"
    osascript -e 'tell application "Google Chrome" to activate'
    sleep 2
    screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/homepage_indexing_proof.png
    exit 0
  fi
  sleep 2
done
echo "Timeout waiting for modal."
osascript -e 'tell application "Google Chrome" to activate'
screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/homepage_indexing_proof.png
