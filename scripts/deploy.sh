#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" ]; then
  bundle exec cap production deploy --trace
fi
