#!/bin/bash
set -eu

version="1.19.0"

# see https://docs.docker.com/compose/install/
curl -L https://github.com/docker/compose/releases/download/${version}/docker-compose-`uname -s`-`uname -m` \
  -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
