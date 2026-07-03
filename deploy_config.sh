#!/bin/bash
IP="89.167.115.150"
KEY="~/.ssh/id_ed25519"
TARGET="/opt/kassia-site"

echo "Deploying astro.config.mjs..."

scp -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no ./astro.config.mjs root@$IP:$TARGET/astro.config.mjs
echo "File uploaded."

echo "Running build and PM2 restart on server..."
ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no root@$IP << 'EOF'
  cd /opt/kassia-site
  source /root/.nvm/nvm.sh
  nvm use 22
  npm run build
  
  if [ $? -eq 0 ]; then
    echo "Build success. Reloading PM2..."
    pm2 reload kassia-site --update-env
  else
    echo "Build failed!"
    exit 1
  fi
EOF

echo "Deployment complete."
