#!/usr/bin/env bash

git config --global user.name "Vicram Kotecha"
git config --global user.email "apsidalduck@users.noreply.github.com"
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
git clone ssh://git@github.com/apsidalduck/env.git
cp -r /vagrant/* env/
chmod u+x env/bootstrap2.sh
cd env
./bootstrap2.sh
git add -A
git commit
git push origin master