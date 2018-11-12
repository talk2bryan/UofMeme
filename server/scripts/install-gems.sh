#!/bin/bash
set -x

cd /var/www/UofMeme/deployment
sudo gem install bundler
rvm use 2.4.1
# Bundle location: /var/www/UofMeme/shared/bundle
# Binary location: /var/www/UofMeme/shared/bin
RAILS_ENV=production /var/www/UofMeme/deployment/bin/bundle install --binstubs /var/www/UofMeme/shared/bin --gemfile /var/www/UofMeme/deployment/Gemfile --path /var/www/UofMeme/shared/bundle --without development test --deployment --quiet

