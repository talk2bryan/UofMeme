#!/bin/bash
set -x

cd /var/www/UofMeme/deployment && source ~/.rvm/scripts/rvm && RAILS_ENV=production bundle install --binstubs /var/www/UofMeme/shared/bin --gemfile ./Gemfile --path /var/www/UofMeme/shared/bundle --without development test --deployment --quiet

# Bundle location: /var/www/UofMeme/shared/bundle
# Binary location: /var/www/UofMeme/shared/bin
