#!/bin/bash
IP="89.167.115.150"

echo "Deploying full src/components..."

# Use rsync or scp
scp -r -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no ./src/components root@$IP:/opt/kassia-site/src/
echo "Files uploaded."

echo "Running build and PM2 restart on server..."
ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no root@$IP << 'EOF'
  cd /opt/kassia-site
  source /root/.nvm/nvm.sh
  nvm use 22
  npm run build
  
  if [ $? -eq 0 ]; then
    echo "Build success. Reloading PM2..."
    pm2 reload kassia-site
  else
    echo "Build failed!"
    exit 1
  fi
EOF

echo "Deployment complete."
