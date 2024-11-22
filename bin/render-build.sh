#!/usr/bin/env bash
apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libxml2-dev \
    libxslt-dev \
    zlib1g-dev

# Install Bundler and dependencies


set -o errexit

bundle install
gem install bundler
bundle install
bundle exec rails db:migrate