#!/bin/bash
source ~/.zshrc
nvm use 22
lsof -ti:4321 | xargs kill -9 > /dev/null 2>&1
export NODE_ENV=development
npm run dev > server.log 2>&1 &
echo "Server started..."
sleep 5
node open_contact.mjs
