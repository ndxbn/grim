#!/bin/bash
set -eu

yum -y install epel-release
yum -y install https://centos7.iuscommunity.org/ius-release.rpm

yum -y groupinstall "Development Tools"

yum -y install \
  bash-completion-extras
  jq

# `yum swap git`
# installed via "Development Tools" group,
# reinstall from IUS repository.
yum remove -y git
yum install -y git2u-all
