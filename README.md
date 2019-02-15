# Linux Command Guide

```yaml
groups:
  create_group: groupadd <groupname>
  add_group: usermod -aG <groupname> <username>
  entire_group_list: cut -d: -f1 /etc/group | sort
  specific_user: id -Gn <username>

check_os:
  cat /etc/*release | grep -i redhat|debian

vim:
  copy_line: yy or Y
  delete_line: dd
  paste:
    p # to paste the copied or deleted text after the current line
    P # to paste the copied or deleted text before the current line
  multiple_lines:
    copy: 7yy
    delete: 10dd


virtualbox:
        guest_additions:
                sudo apt-get install virtualbox-guest-dkms virtualbox-guest-x11 linux-headers-$(uname -r)
                sudo reboot

ssh:
  login_without_password:
    ssh-keygen -t rsa # Do not set password to a passphrase
    ssh <user>@<server_ip> mkdir -p .ssh
    cat .ssh/id_rsa.pub | ssh <user>@<server_ip> 'cat >> .ssh/authorized_keys'


proxy:
  add: export {http, https, ftp}_proxy="http://PROXY_SERVER:PORT"
  remove: unset {http, https, ftp}_proxy
  bash_function:
    echo " # Set Proxy
      function setproxy() {
          export {http,https,ftp}_proxy=\"http://PROXY_SERVER:PORT\"
      }

      # Unset Proxy
      function unsetproxy() {
          unset {http,https,ftp}_proxy
      }" >> ~/.bashrc && source ~/.bashrc

auto_complete:
echo ' # mappings to have up and down arrow searching through history:
"\e[A": history-search-backward
"\e[B": history-search-forward
# mappings to have left and right arrow go left and right:
"\e[C": forward-char
"\e[D": backward-char

# mapping to have [Tab] and [Shift]+[Tab] to cycle through all the possible completions:
"\t": menu-complete
"\e[Z": menu-complete-backward' >> ~/.inputrc


link:
  ln -s <target_folder1> <target_folder2>
  unlink <folder|file>

docker:
  list-containers[all]: docker ps [-a]
  list-images: docker images
  remove-container: docker rm <container | $(docker ps -q)>
  remove-images: docker rmi <image | $(docker images -q)>
  build: docker build -t <tag_name>:<version> <Dockerfile>
  run: docker run -d -i -t <container>
  exec: docker exec -it <container> | bash # Enter inside container bash

rhel:
  subscription:
    check: sudo subscription-manager status
    #where: https://access.redhat.com/downloads/content/package-browser
    repo_enable: subscription-manager repos --enable=<repositoryt> #Ex: -> rhel-7-server-optional-rpms
pip:
  installation:
    pip install --upgrade pip
    pip install docker-compose==1.9.0
  search_list:
    pip list --format=columns | grep docker
---
git:
  init:
    git init
  remote:
    git remote add -f origin <remote_repository_url>
  add:
    git add .
    git add -- <file>
  commit:
    git commit -m "First commit"
    git commit -m -a "Commit with add"
  remove:
    git rm <file|folder>
  push:
    git push -u origin master
  stash:
    git stash
    git stash apply
    git stash pop
  clone:
    git clone <url_repo> <name_folder>
  config:
    # ~/.gitconfig
    git config --global alias.st status # git st
  revert:
    git checkout -- <file | folder | commit_id > <HEAD~[number]>
  reset:
    git reset <file |folder>
    git reset
  log:
    git log -- <file>
    git log -p -2 --all --full-history -- *<file>*
    git log after='2017-01-01' before='2018-01-01'
---
curl:
  download:
    curl -sSOL <urlfile>

```
