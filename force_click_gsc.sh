#!/bin/bash

run_js() {
  osascript -e "tell application \"Google Chrome\" to execute active tab of front window javascript \"$1\""
}

osascript -e 'tell application "Google Chrome" to activate'
sleep 2

res=$(run_js "
function findDeep(text) {
  function traverse(root) {
    const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT, null, false);
    let n;
    while ((n = walker.nextNode())) {
      if (n.nodeValue.includes(text)) return n.parentElement;
    }
    const els = root.querySelectorAll('*');
    for (let i = 0; i < els.length; i++) {
      if (els[i].shadowRoot) {
        const found = traverse(els[i].shadowRoot);
        if (found) return found;
      }
    }
    return null;
  }
  const el = traverse(document);
  if (el) {
    el.click();
    let p = el.parentElement;
    for(let i=0; i<3; i++) {
        if(p) { p.click(); p = p.parentElement; }
    }
    return 'Clicked deep element';
  }
  return 'Not found';
}
findDeep('SOLICITĂ INDEXAREA');
")

echo "Result of JS: $res"

echo "Waiting 45s for the modal..."
sleep 45

screencapture -x /Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/sector5_real_indexing_proof2.png
echo "Done"
