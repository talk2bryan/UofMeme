#!/bin/bash
cd /home/deploy/apps/UofMeme
pwd
echo $PWD
RAILS_ENV=production bin/bundle install
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake assets:clobber
RAILS_ENV=production bundle exec rake assets:precompile
