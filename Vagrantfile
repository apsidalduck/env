Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"
  config.ssh.forward_agent = true
  config.vm.provision :shell, path: "bootstrap-privileged.sh"
  config.vm.provision :shell, path: "bootstrap.sh", privileged:false
end