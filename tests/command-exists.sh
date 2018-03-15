#!/bin/bash
set -eu

type git
type hub
hub --version

type jq

type docker
type dockerd
type docker-compose
docker-compose version

type stow
stow --version

type php
type composer
type node
type npm
type ruby
type gem
type python
type pip