#!/bin/bash
#set -eu
## /etc/bashrc will import, but it throws "/etc/bashrc: line 12: PS1: unbound variable"

git clone https://github.com/ndxbn/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
. ~/.bash_profile

anyenv install phpenv
anyenv install nodenv
anyenv install rbenv
anyenv install pyenv
. ~/.bash_profile


# install latest
PHP_VERSION="7.2.3"
NODE_VERSION="8.9.6"
RUBY_VERSION="2.5.0"
PYTHON_VERSION="3.6.4"

PHP_BUILD_EXTRA_MAKE_ARGUMENTS=-j4 phpenv install ${PHP_VERSION}
phpenv global ${PHP_VERSION}
nodenv install ${NODE_VERSION}
nodenv global ${NODE_VERSION}
rbenv install ${RUBY_VERSION}
rbenv global ${RUBY_VERSION}
pyenv install ${PYTHON_VERSION}
pyenv global ${PYTHON_VERSION}
