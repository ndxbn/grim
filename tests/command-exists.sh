#!/bin/bash
set -eu

type git
git --version # display git version only

type jq

type docker
type dockerd
type docker-compose
docker-compose version
