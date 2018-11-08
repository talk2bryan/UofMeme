#!/bin/bash

# Remove previous deployment if it exists
rm -rf /var/www/UofMeme/prev-deployment

# Create a backup from current version
mv /var/www/UofMeme/deployment /var/www/UofMeme/prev-deployment

# Create a deployment folder abd set the owner as ubuntu
mkdir /var/www/UofMeme/deployment
chown ubuntu:ubuntu /var/www/UofMeme/deployment
