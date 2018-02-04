#!/bin/bash
set -eu
CWD=`pwd`

# get latest hub binary archive URL for Linux 64-bit machine
src_url=$(curl -s https://api.github.com/repos/github/hub/releases/latest |\
  jq  -r '.assets[] | select (.label | contains("Linux 64-bit")) | .browser_download_url'
)

# download latest hub binary tar ball
HUB_TGZ_FILE_NAME="${CWD}/hub.tgz"
wget -q -O ${HUB_TGZ_FILE_NAME} ${src_url}

# run install script
work_dir=`mktemp -dp /var/tmp`
tar -C ${work_dir} -xzf ${HUB_TGZ_FILE_NAME}
mv ${work_dir}/**/* ${work_dir}
${work_dir}/install
# bash completion
cp ${work_dir}/etc/hub.bash_completion.sh /etc/profile.d/

# tear down
rm -rf ${work_dir}
rm -f ${HUB_TGZ_FILE_NAME}
