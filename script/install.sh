#!/bin/bash
set -eu

yum -y install epel-release
yum -y install https://centos7.iuscommunity.org/ius-release.rpm

yum -y groupinstall "Development Tools"

yum -y install \
  bash-completion-extras \
  jq \
  wget

# `yum swap git`
# installed via "Development Tools" group,
# reinstall from IUS repository.
yum remove -y git
yum install -y git2u-all

# docker
## only docker-ce.
## docker-compose will be installed without package manager.
yum install -y \
  yum-utils \
  device-mapper-persistent-data \
  lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
systemctl start docker && systemctl enable docker

# PHP 7.x
yum -y install \
  bzip2-devel \
  libcurl-devel \
  libicu-devel \
  libjpeg-turbo-devel \
  libpng-devel \
  libtidy-devel \
  libxml2-devel \
  libxslt-devel \
  openssl-devel \
  re2c-devel \
  readline-devel
