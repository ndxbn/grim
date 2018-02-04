Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  # config.vm.provision :shell, path: ""
  # config.vm.provision :shell, path: "", privileged: false

  # pre-install
  config.vm.provision :shell, inline: "yum -y update"
  # installing via OS package manager
  config.vm.provision :shell, path: "./script/install.sh"

  # testing
  config.vm.provision :shell, path: "./tests/command-exists.sh"
end
