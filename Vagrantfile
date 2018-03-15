Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  # config.vm.provision :shell, path: ""
  # config.vm.provision :shell, path: "", privileged: false

  config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 4
  end

  # pre-install
  config.vm.provision :shell, inline: "yum -y update"
  # installing via OS package manager
  config.vm.provision :shell, path: "./script/install.sh"
  # installing manually : They are installed under /usr/local
  config.vm.provision :shell, name: "docker-compose" ,path: "./script/install-docker-compose.sh"
  config.vm.provision :shell, name: "hub", path: "./script/install-hub.sh"
  config.vm.provision :shell, name: "stow", path: "./script/install-stow.sh"

  # install under /home/vagrant
  config.vm.provision :shell, name: "anyenv", path: "./script/install-anyenv.sh", privileged: false

  # testing
  config.vm.provision :shell, name: "test", path: "./tests/command-exists.sh", privileged: false
end
