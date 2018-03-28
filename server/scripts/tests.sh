#!/bin/bash

set -x # For debugging
bundle exec rails test # Run non-rspec tests
bundle exec rake # Run rspec tests