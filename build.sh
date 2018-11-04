#!/bin/bash

cd -- "$(dirname "$(realpath "$0")")"

_version="$(git describe --exact-match --tags)"
if [ $? -ne 0 ]; then
   _version="0.0-g$(git describe --always)"
fi

echo "Using version $_version"

fpm -t deb -n plasma-awesome-session -v "$_version" \
   -d plasma-workspace -d awesome \
   -s dir ./usr=/
