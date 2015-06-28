Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.ssh.forward_agent = true

  config.vm.network "forwarded_port", guest: 21, host: 2121

  config.vm.hostname = "ftpserver"

  config.vm.provision :shell, inline: <<SCRIPT

apt-get update
apt-get install -y git
wget -qO- https://get.docker.com/ | sh
gpasswd -a vagrant docker
service docker restart

SCRIPT

  config.vm.provision :shell, privileged:false, inline: <<SCRIPT

newgrp docker

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

cd /vagrant

docker build -t vic-ftp .
docker run -v /vagrant:/vagrant -p 21:21 --name vic-ftpd -d vic-ftp

SCRIPT

end
