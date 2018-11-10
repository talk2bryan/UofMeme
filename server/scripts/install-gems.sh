#!/bin/bash
set -x

cd /var/www/UofMeme/deployment
# Bundle location: /var/www/UofMeme/shared/bundle
# Binary location: /var/www/UofMeme/shared/bin
RAILS_ENV="production" /var/www/UofMeme/deployment/bin/bundle install --binstubs /var/www/UofMeme/shared/bin --gemfile ./Gemfile --path /var/www/UofMeme/shared/bundle --without development test --deployment --quiet

