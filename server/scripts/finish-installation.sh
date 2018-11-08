#!/bin/bash

source /etc/profile

# Announce successful deployment with timestamp
DEPLOYMENT_TIME=$( date -u "+%Y/%m/%d %H:%M:%S" )
echo "Deployment finished at: "$DEPLOYMENT_TIME" UTC" > /var/www/UofMeme/deployment/public/deployment_time.txt

# Set permissions and restart nginx
chown -R nginx:nginx /var/www/UofMeme/deployment
chmod -R 755 /var/www/UofMeme/deployment


service nginx restart
