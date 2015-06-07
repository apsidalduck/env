Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"

  config.ssh.forward_agent = true

  config.vm.provision :shell, inline: <<SCRIPT

apt-get update
apt-get install -y git

SCRIPT

  config.vm.provision :shell, privileged:false, inline: <<SCRIPT

git config --global user.name "Vicram Kotecha"
git config --global user.email "apsidalduck@users.noreply.github.com"
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
git clone ssh://git@github.com/apsidalduck/env.git
cp -r /vagrant/* env/
cd env
git config --global core.excludesfile ./.gitignore
git add -A
git commit -m 'auto commit'
git push origin master

SCRIPT

end
