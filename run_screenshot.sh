#!/bin/bash
source ~/.zshrc
nvm use 22
lsof -ti:4321 | xargs kill -9 > /dev/null 2>&1
export NODE_ENV=production
npm run preview > server.log 2>&1 &
SERVER_PID=$!
sleep 5
node take_screenshot.cjs
kill -9 $SERVER_PID
