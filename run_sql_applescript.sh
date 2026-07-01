#!/bin/bash

# 1. Put SQL into clipboard
cat /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/scratch/pricing_schema.sql | pbcopy

# 2. Execute AppleScript
osascript << 'APPLESCRIPT'
tell application "Google Chrome"
    activate
    set newTab to make new tab at end of tabs of window 1
    set URL of newTab to "https://supabase.com/dashboard/project/jrfhprnuxxfwkwjwdsez/sql/new"
    
    delay 6
end tell

tell application "System Events"
    -- Make sure Chrome is frontmost
    set frontmost of process "Google Chrome" to true
    delay 1
    
    -- Paste from clipboard
    keystroke "v" using command down
    delay 1
    
    -- Run Query (Cmd + Enter)
    keystroke return using command down
    delay 3
end tell
APPLESCRIPT
