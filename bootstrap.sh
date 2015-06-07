#!/usr/bin/env bash

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
