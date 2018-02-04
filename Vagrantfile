Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  # config.vm.provision :shell, path: ""
  # config.vm.provision :shell, path: "", privileged: false

  # pre-install
  config.vm.provision :shell, inline: "yum -y update"
  # installing via OS package manager
  config.vm.provision :shell, path: "./script/install.sh"
  # installing manually : They are installed under /usr/local
  config.vm.provision :shell, path: "./script/install-docker-compose.sh"

  # testing
  config.vm.provision :shell, path: "./tests/command-exists.sh", privileged: false
end
