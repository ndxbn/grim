#!/bin/bash
set -eu
work_dir=`mktemp -dp /var/tmp`
pushd ${work_dir}

# download latest hub binary tarball
src_url=$(curl -s https://api.github.com/repos/github/hub/releases/latest |\
  jq  -r '.assets[] | select (.label | contains("Linux 64-bit")) | .browser_download_url'
)
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
