#!/bin/bash
sleep 15

export DATABASE_IP="${DATABASE_IP}"
export DB_HOST="mongodb://${DATABASE_IP}:27017/posts"

cd /home/ubuntu
cd se-test-app/nodejs20-se-test-app-2025/app

sudo npm install
node seeds/seed.js

pm2 start app.js
