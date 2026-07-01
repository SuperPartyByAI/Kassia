#!/bin/bash
IP="89.167.115.150"
TARGET="/opt/kassia-site"

echo "Uploading files..."
scp -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no ./src/pages/\[...slug\].astro root@$IP:$TARGET/src/pages/
scp -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no ./src/components/PricingPreview.astro root@$IP:$TARGET/src/components/
scp -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no ./src/components/PricingFullTable.astro root@$IP:$TARGET/src/components/
scp -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no ./src/components/PricingProgramCard.astro root@$IP:$TARGET/src/components/

echo "Building on server..."
ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no root@$IP << 'INNEREOF'
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
INNEREOF
