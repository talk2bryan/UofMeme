#!/bin/bash

set -x # For debugging

openssl aes-256-cbc -K $encrypted_a8f8c3a53860_key -iv $encrypted_a8f8c3a53860_iv -in id_rsa.enc -out id_rsa -d
chmod 600 id_rsa
mv id_rsa ~/.ssh/id_rsa

cd ..
