#!/usr/bin/env bash

apt-get update
apt-get install -y git
cd /vagrant
git config --global user.name "Vicram Kotecha"
git config --global user.email "apsidalduck@users.noreply.github.com"
git clone https://github.com/apsidalduck/env.git
env/bootstrap2.sh
