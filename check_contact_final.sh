#!/bin/bash
source ~/.zshrc
nvm use 22

echo "=== DB Status ==="
node check_contact_status.mjs

echo "=== Server Setup ==="
npm install puppeteer --no-save > /dev/null 2>&1
export NODE_ENV=production
npm run build > /dev/null 2>&1
npm run preview > /dev/null 2>&1 &
SERVER_PID=$!
sleep 5

echo "=== 404 Check ==="
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:4321/contact/)
echo "Public /contact/ Status: $STATUS"

echo "=== Sitemap Check ==="
SITEMAP_CONTAINS=$(curl -s http://localhost:4321/sitemap-index.xml | grep -o "/contact/" || echo "NOT_FOUND")
echo "Sitemap contains /contact/: $SITEMAP_CONTAINS"

echo "=== Taking Screenshots ==="
node take_screenshot.js

kill -9 $SERVER_PID
echo "Done"
