#!/bin/bash

set -e

if [ "$1" = "start" ]; then
  cd /app
  if [ ! -d "./node_modules" ]; then
    echo "fresh start - running npm install"
    sudo npm install --verbose --no-bin-link
  fi
  grunt
fi

if [ ! -d "./node_modules" ]; then
  echo "fresh start detected, run:"
  echo "sudo npm install --verbose --no-bin-link"
fi

exec "$@"
