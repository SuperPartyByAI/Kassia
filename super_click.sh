#!/bin/bash
osascript -e '
tell application "Google Chrome"
    set out to ""
    repeat with w in windows
        repeat with t in tabs of w
            if URL of t contains "search.google.com/search-console" then
                set res to execute t javascript "
                    let clicked = false;
                    const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, null, false);
                    let node;
                    while(node = walker.nextNode()) {
                        if(node.nodeValue.includes(\"SOLICITĂ INDEXAREA\")) {
                            let el = node.parentElement;
                            el.click();
                            if(el.parentElement) el.parentElement.click();
                            clicked = true;
                        }
                    }
                    clicked ? \"Clicked\" : \"Not found\";
                "
                set out to out & " " & res
            end if
        end repeat
    end repeat
    return out
end tell
'
