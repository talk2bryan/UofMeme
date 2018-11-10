#!/bin/bash
set -x

cd /var/www/UofMeme/deployment && whoami && pwd && RAILS_ENV=production ./bin/bundle install --binstubs /var/www/UofMeme/shared/bin --gemfile ./Gemfile --path /var/www/UofMeme/shared/bundle --without development test --deployment --quiet

# Bundle location: /var/www/UofMeme/shared/bundle
# Binary location: /var/www/UofMeme/shared/bin
