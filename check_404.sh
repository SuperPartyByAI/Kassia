#!/bin/bash
source ~/.zshrc
nvm use 22
echo "== Checking PROD Mode 404 =="
# Ensure production server is running
npm run build > /dev/null 2>&1
export NODE_ENV=production
npm run preview > /dev/null 2>&1 &
SERVER_PID=$!
sleep 5 # Wait for server to start

URLS=(
  "http://localhost:4321/contact/"
  "http://localhost:4321/decoratiuni-baloane-bucuresti/"
  "http://localhost:4321/arcada-baloane-bucuresti/"
  "http://localhost:4321/baloane-heliu-bucuresti/"
  "http://localhost:4321/panou-foto-baloane-bucuresti/"
)

for URL in "${URLS[@]}"; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)
  echo "PROD $URL - Status: $STATUS"
done

kill -9 $SERVER_PID
