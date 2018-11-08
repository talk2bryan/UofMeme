#!/bin/bash

cd /var/www/UofMeme/deployment

# Load environment vars
source /etc/profile

# Run asset pre-compilation. Assets are compiled at the beginning for every 
# deployments
RAILS_ENV=production bundle exec rake assets:precompile
