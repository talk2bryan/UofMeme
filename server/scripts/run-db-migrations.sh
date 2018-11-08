#!/bin/bash

source /etc/profile

# Go to the deployment dir
cd /var/www/UofMeme/deployment

RAILS_ENV=production bundle exec rake db:migrate
