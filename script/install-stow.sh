#!/bin/bash
set -eu

work_dir=`mktemp -dp /var/tmp`
pushd ${work_dir}

# import GNU's gpg
wget https://ftp.gnu.org/gnu/gnu-keyring.gpg
gpg --import gnu-keyring.gpg
# download and verify
wget https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
wget https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz.sig
gpg --verify stow-latest.tar.gz.sig stow-latest.tar.gz

# extract and installing
mkdir stow
tar -C stow -zxf stow-latest.tar.gz
mv stow/**/* stow/
./stow/configure && make install

# tear down
popd
rm -rf ${work_dir}