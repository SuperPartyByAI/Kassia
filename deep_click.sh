#!/bin/bash
osascript -e '
tell application "System Events"
    set chromeProcs to every process whose name contains "Chrome"
    repeat with p in chromeProcs
        tell p
            try
                set uiElems to (every UI element of entire contents of front window whose name contains "SOLICITĂ INDEXAREA" or title contains "SOLICITĂ INDEXAREA" or description contains "SOLICITĂ INDEXAREA" or value contains "SOLICITĂ INDEXAREA" or help contains "SOLICITĂ INDEXAREA")
                if length of uiElems > 0 then
                    set target to item 1 of uiElems
                    click target
                    return "Clicked in " & (name of p)
                end if
            end try
        end tell
    end repeat
    return "Not found via Accessibility API"
end tell
'
