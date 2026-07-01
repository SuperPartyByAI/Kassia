#!/bin/bash
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
source ~/.zshrc
nvm use 22

echo "== Measuring Dev Mode =="
npm run dev > /dev/null 2>&1 &
DEV_PID=$!
sleep 5

URLS=(
  "http://localhost:4321/contact/"
  "http://localhost:4321/decoratiuni-baloane-bucuresti/"
  "http://localhost:4321/arcada-baloane-bucuresti/"
  "http://localhost:4321/baloane-heliu-bucuresti/"
  "http://localhost:4321/panou-foto-baloane-bucuresti/"
)

for URL in "${URLS[@]}"; do
  # Warmup
  curl -s $URL > /dev/null
  # Measure TTFB
  TTFB=$(curl -s -o /dev/null -w "%{time_starttransfer}\n" $URL)
  TOTAL=$(curl -s -o /dev/null -w "%{time_total}\n" $URL)
  echo "DEV $URL - TTFB: $TTFB s, Total: $TOTAL s"
done

lsof -i tcp:4321 -t | xargs kill -9 2>/dev/null
kill -9 $DEV_PID 2>/dev/null
sleep 2

echo "== Measuring Prod Mode =="
cat << 'JS' > start_prod.mjs
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
process.env.PORT = '4321';
process.env.HOST = '127.0.0.1';
import('./dist/server/entry.mjs');
JS
node start_prod.mjs > /dev/null 2>&1 &
PROD_PID=$!
sleep 5

for URL in "${URLS[@]}"; do
  curl -s $URL > /dev/null
  TTFB=$(curl -s -o /dev/null -w "%{time_starttransfer}\n" $URL)
  TOTAL=$(curl -s -o /dev/null -w "%{time_total}\n" $URL)
  SIZE=$(curl -s -o /dev/null -w "%{size_download}\n" $URL)
  echo "PROD $URL - TTFB: $TTFB s, Total: $TOTAL s, Size: $SIZE bytes"
done

lsof -i tcp:4321 -t | xargs kill -9 2>/dev/null
kill -9 $PROD_PID 2>/dev/null
