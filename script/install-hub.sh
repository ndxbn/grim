#!/bin/bash
set -eu
work_dir=`mktemp -dp /var/tmp`
pushd ${work_dir}

# download latest hub binary tarball
src_url="https://github.com/github/hub/releases/download/v2.2.9/hub-linux-amd64-2.2.9.tgz"
wget -q -O hub-latest.tgz ${src_url}

# extract and installing
mkdir hub
tar -C hub -xzf hub-latest.tgz
mv hub/**/* hub/
./hub/install
# bash completion
cp hub/etc/hub.bash_completion.sh /etc/profile.d/

# tear down
popd
rm -rf ${work_dir}
