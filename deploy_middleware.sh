#!/bin/bash
IP="89.167.115.150"
KEY="~/.ssh/id_ed25519"
TARGET="/opt/kassia-site"

echo "Deploying middleware.ts safely..."

# 1. Checksum local
LOCAL_MD5=$(md5 -q src/middleware.ts)
echo "Local checksum: $LOCAL_MD5"

# 2. Backup on server
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
ssh -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no root@$IP "cp $TARGET/src/middleware.ts $TARGET/src/middleware.ts.backup-$TIMESTAMP"
echo "Backup created: /opt/kassia-site/src/middleware.ts.backup-$TIMESTAMP"

# 3. Upload file
scp -i ~/.ssh/id_ed25519 -o StrictHostKeyChecking=no ./src/middleware.ts root@$IP:$TARGET/src/middleware.ts
echo "File uploaded."

# 4. Build and Restart on Server
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
