#!/bin/bash
set -e

if [ -f /Quote/tmp/pids/server.pid ]; then
  rm /Quote/tmp/pids/server.pid
fi

if ! [bundle check]; then
  bundle install
fi

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

yarn install

exec bundle exec "$@"