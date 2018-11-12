#!/bin/bash

set -x # For debugging
gem install selenium-webdriver
openssl aes-256-cbc -K $encrypted_9f87cb6b292a_key -iv $encrypted_9f87cb6b292a_iv -in config/id_rsa.enc -out config/id_rsa -d
chmod 600 config/id_rsa
mv config/id_rsa ~/.ssh/id_rsa

cd ..
