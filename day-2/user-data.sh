#!/bin/bash

sleep 15

cd /home/ubuntu

cd se-test-app/app
sudo npm install

export DB_HOST=mongodb://10.0.3.23:27017/posts
node seeds/seed.js

pm2 start app.js

