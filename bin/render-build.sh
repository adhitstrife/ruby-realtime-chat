#!/usr/bin/env bash
apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libxml2-dev \
    libxslt-dev \
    zlib1g-dev

# Install Bundler and dependencies
gem install bundler
bundle install

set -o errexit

bundle install