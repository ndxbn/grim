#!/bin/bash
set -eu

version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | \
  jq  -r '.name'
)

# see https://docs.docker.com/compose/install/
curl -L https://github.com/docker/compose/releases/download/${version}/docker-compose-`uname -s`-`uname -m` \
  -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
