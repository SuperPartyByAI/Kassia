#!/bin/bash
IP="89.167.115.150"

echo "Step 1: npm run build local"
npm run build
if [ $? -ne 0 ]; then
  echo "Local build failed!"
  exit 1
fi

echo "Step 2: rsync complet (exclude node_modules and dist)"
rsync -avz --exclude 'node_modules' --exclude 'dist' --exclude '.git' --exclude '.env.local' -e "ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no" ./ root@$IP:/opt/kassia-site/

echo "Step 3 & 4: build on server & pm2 reload"
ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no root@$IP << 'EOF'
  cd /opt/kassia-site
  source /root/.nvm/nvm.sh
  nvm use 22
  npm install
  npm run build
  
  if [ $? -eq 0 ]; then
    echo "Build success. Reloading PM2 with --update-env..."
    pm2 reload kassia-site --update-env
  else
    echo "Build failed on server!"
    exit 1
  fi
EOF

echo "Deploy P0 Complete."
