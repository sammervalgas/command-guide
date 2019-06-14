

Linux Command Guide
=============

Note: [known-issues](known-issues.md) like knowledge base problems. :)

### Typology

| Reference  | Description  |
|   :---:    |    :---:     |
|   [...]    |  To change   |   
|   &#124;   |     Or       |

### Commands
---
```yaml
groups:
  create_group: groupadd [GROUPNAME]
  add_group: usermod -aG [GROUPNAME] [USERNAME]
  entire_group_list: cut -d: -f1 /etc/group | sort
  specific_user: id -Gn [USERNAME]

---
check_os:
  cat /etc/*release | grep -i redhat|debian

---
cntlm:
  # https://vijiboy.wordpress.com/2018/03/14/configure-cntlm-to-generate-hash-for-your-password-h-and-verify-m/
  user_data: cntlm -H -u username -d domainname # /etc/cntlm.conf
  check: cntlm -M http://google.com

---
hostname:
  setting(Fedora):
    hostnamectl -set-hostname [NAME]
    hostnamectl status

---
find:
  find / -name [FILE|FOLDER]
  find / -iname [FILE|FOLDER] # case insensitive
  find . -name [FILE|FOLDER] -type d -exec rm -rf {} \; # Find and remove
  find [FOLDER] -ilname [FILE|FOLDER] -print 2>/dev/null # Find without permission denied print
  # More infos: http://www.hypexr.org/linux_find_help.php

---
vim:
  copy_line: yy or Y
  delete_line: dd
  paste:
    p # to paste the copied or deleted text after the current line
    P # to paste the copied or deleted text before the current line
  multiple_lines:
    copy: 7yy
    delete: 10dd

---
virtualbox:
  guest_additions:
    sudo apt-get install virtualbox-guest-dkms virtualbox-guest-x11 linux-headers-$(uname -r)
    sudo reboot
---
disk:
  increase:
    lsblk
    df -h
    lvextend -L +100G /dev/mapper/example
    xfs_growfs /dev/mapper/example
  spaces_used:
    cd /
    du -sch *

---
remove:
  dir: rm -r [DIRECTORY] [*=ALL]
  file: rm -f [FILE] [*=ALL]
  per_day: 
    find [FOLDER] -mtime +1 -exec rm -f {} \;
    find . -mtime +180 -delete;
---
ssl:
  crt:
    openssl genrsa 2048 > host.key
    chmod 400 host.key
    openssl req -new -x509 -nodes -sha256 -days 365 -key host.key -out host.cert

    # generate private keygen
    openssl genrsa -des3 -out server.key 1024

    #  Generate a CSR (Certificate Signing Request)
    openssl req -new -key server.key -out server.csr
    # > Country Name (2 letter code) [GB]:BR
    # > State or Province Name (full name) [Berkshire]:São Paulo
    # > Locality Name (eg, city) [Newbury]:São Paulo
    # > Organization Name (eg, company) [My Company Ltd]:My Company
    # > Organizational Unit Name (eg, section) []:Information Technology
    # > Common Name (eg, your name or your server's hostname) []:my.host.com.br
    # > Email Address []:email@here.com.br
    # > Please enter the following 'extra' attributes
    # > to be sent with your certificate request
    # > A challenge password []:
    # > An optional company name []:

    # Remove Passphrase from Key
    cp server.key server.key.org
    openssl rsa -in server.key.org -out server.key

    #Generating a Self-Signed Certificate
    openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
---
ssh:
  login_without_password:
    ssh-keygen -t rsa # Do not set password to a passphrase
    ssh <user>@<server_ip> mkdir -p ~/.ssh
    cat ~/.ssh/id_rsa.pub | ssh <user>@<server_ip> 'cat >> .ssh/authorized_keys'

  git_ssh:
    # generate ssh
    ssh-keygen -t rsa -b 4096 -C "$USER@$(hostname)"
    # add agent
    eval $(ssh-agent -s)
    # add ssh key to the ssh-agent
    ssh-add ~/.ssh/id_rsa

---
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

---
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

---
link:
  ln -s [SOURCE] [DESTINATION]
  unlink [FILE|FOLDER]

---
docker:
  list-containers[all]:
    docker ps [-a]
  list-images:
    docker images
  remove-container:
    docker rm <container | $(docker ps -q)>
  remove-images:
    docker rmi <image | $(docker images -q)>
  remove_untagged_images:
    docker rmi $(docker images -a | grep "^<none>" | awk '{print $3}') [--force]
  build:
    docker build -t [IMAGE_TAGGED_NAME]:[IMAGE_VERSION] -f <Dockerfile> .
  run:
    docker run -d -i -t -v /folder:/container_folder -p 8080:80 [CONTAINER_NAME]
  exec:
    docker exec -it [CONTAINER_NAME] bash # Enter inside container bash
    docker exec [CONTAINER_NAME] wget http://github.com/sammervalgas
  inspect_images_in_use:
    docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=[CONTAINER_NAME] -q)
    docker inspect --format '{{ .NetworkSettings.IPAddress}}' [CONTAINER_NAME]
    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' [CONTAINER_NAME]
    docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' [CONTAINER_NAME]

  copy-to-host:
    docker cp [CONTAINER_NAME]:[FILE|FOLDER] [DESTINATION]
  copy-to-container:
    docker cp [DESTINATION] [CONTAINER_NAME]:[FILE|FOLDER]

---
rhel:
  subscription:
    check: sudo subscription-manager status
    #where: https://access.redhat.com/downloads/content/package-browser
    repo_enable: subscription-manager repos --enable=[REPO] #Ex: -> rhel-7-server-optional-rpms

---
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
    git add -- [FILE|FOLDER]
  commit:
    git commit -m "First commit"
    git commit -m -a "Commit with add"
    last_commit:
      git show --name-only
      git log --name-status HEAD^..HEAD
      git diff-tree --no-commit-id --name-only -r HEAD^..HEAD
  checkout:
    switch: git checkout [BRANCH]
    branch: git checkout -b [BRANCH_NAME] [SHA1 | OLDEST_VERSION]
  remove:
    git rm [FILE|FOLDER]
  push:
    git push -u origin master
  stash:
    git stash
    git stash apply
    git stash pop
  clone:
    git clone [REPO_URL] [FOLDER]
    oldest:
      git clone [REPO_URL]
      git log --all
      git checkout <SHA1>
  config:
    # edit
    git config [ --global | --system ] -e
    # --global = ~/.gitconfig
    # --system = /etc/gitconfig
    git config [ --global | --system ] alias.st status # git st
    git config [ --global | --system ] http.proxy http://[USERNAME]:[PASSWORD]@[PROXY_URL]:[PROXY_PORT]
    git config [ --global | --system ] http.sslVerify [true | false]
    git config [ --global | --system ] --get http.proxy  
    git config [ --global | --system ] --unset http.proxy  
  revert:
    git checkout -- [FILE|FOLDER|COMMIT_ID] HEAD~[number]
  reset:
    git reset -- [FILE|FOLDER]
    git reset .
  remove:
    git rm -- [FILE|FOLDER]
  log:
    git log -- [FILE|FOLDER]
    git log -p -2 --all --full-history -- *[FILE|FOLDER]*
    git log after='2017-01-01' before='2018-01-01'

    git log --stat
    git log --pretty=oneline | short | medium | full | fuller

  recovery_detached:
    $ git reflog
    $ git checkout -b [BRANCH_NAME] [ID|HEAD~<NUMBER>]

---
curl:
  download:
    curl -sSOL [HTTP_URL]

---
sed:
  # Creating a file to use sed
  cat <<EOF >> sample-for-sed
  001 history
  002 blob
  003 old_text
  004 vim /tmp/test

  # Lets edit this file
  EOF

# Quick link http://www.grymoire.com/Unix/Sed.html
s = substitue
g = global

'/^$/ d' = Remove all spaces
's/\s[0-9]*//g' = Remove all numbers
's/old_text/new_text/g' = Remove all old_text to new_text
'sed '0,/pattern/s/pattern/replacement/' filename' = Change first line ocurrency only.

''
---
date:
 timestamp:
  $ date +%s
 weekday uppercase:
  $ date +%^A
  
  -  (hyphen) do not pad the field
  _  (underscore) pad with spaces
  0  (zero) pad with zeros
  ^  use upper case if possible
  #  use opposite case if possible

  Formats:
      %%   a literal %
      %a   locale's abbreviated weekday name (e.g., Sun)
      %A   locale's full weekday name (e.g., Sunday)
      %b   locale's abbreviated month name (e.g., Jan)
      %B   locale's full month name (e.g., January)
      %c   locale's date and time (e.g., Thu Mar  3 23:05:25 2005)
      %C   century; like %Y, except omit last two digits (e.g., 20)
      %d   day of month (e.g., 01)
      %D   date; same as %m/%d/%y
      %e   day of month, space padded; same as %_d
      %F   full date; same as %Y-%m-%d
      %g   last two digits of year of ISO week number (see %G)
      %G   year of ISO week number (see %V); normally useful only with %V
      %h   same as %b
      %H   hour (00..23)
      %I   hour (01..12)
      %j   day of year (001..366)
      %k   hour, space padded ( 0..23); same as %_H
      %l   hour, space padded ( 1..12); same as %_I
      %m   month (01..12)
      %M   minute (00..59)
      %n   a newline
      %N   nanoseconds (000000000..999999999)
      %p   locale's equivalent of either AM or PM; blank if not known
      %P   like %p, but lower case
      %r   locale's 12-hour clock time (e.g., 11:11:04 PM)
      %R   24-hour hour and minute; same as %H:%M
      %s   seconds since 1970-01-01 00:00:00 UTC
      %S   second (00..60)
      %t   a tab
      %T   time; same as %H:%M:%S
      %u   day of week (1..7); 1 is Monday
      %U   week number of year, with Sunday as first day of week (00..53)
      %V   ISO week number, with Monday as first day of week (01..53)
      %w   day of week (0..6); 0 is Sunday
      %W   week number of year, with Monday as first day of week (00..53)
      %x   locale's date representation (e.g., 12/31/99)
      %X   locale's time representation (e.g., 23:13:48)
      %y   last two digits of year (00..99)
      %Y   year
      %z   +hhmm numeric time zone (e.g., -0400)
      %:z  +hh:mm numeric time zone (e.g., -04:00)
      %::z  +hh:mm:ss numeric time zone (e.g., -04:00:00)
      %:::z  numeric time zone with : to necessary precision (e.g., -04, +05:30)
      %Z   alphabetic time zone abbreviation (e.g., EDT)
      
----
tricks:
  hide_traces:
    history -d $(history | tail -1 - | awk '{print $1}') | vi ~/.bash_history
    for i in {$(history | tail -1 - | awk '{print $1}')..[END_POSITION]}; do history -d "$i"; done

```
