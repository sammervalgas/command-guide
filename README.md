

Linux Command Guide
=============

> NOTE: ***[known-issues](known-issues.md)*** like knowledge base problems. :)

<br/>

> NOTE: ***[openshift-cli](openshift-cli.md)*** bunch of cli openshift :)

Typology
--------

| Reference  | Description  |
|   :-----:    |    :-----:     |
|   [...]    |  To change   |   
|   &#124;   |     Or       |

* `List commands below` - Important commands


Commands
--------
A bunch of command lines designed to help us day by day, bellow are the summary of commands.

- [ALIAS](#alias)
- [AWK](#awk)
- [Angular](#angular)
- [AUTOCOMPLETE](#AutoComplete)
- [BOOTABLE_USB](#bootable_usb)
- [CHECKOS](#checkos)
- [CNTLM](#cntlm)
- [CPU](#cpu)
- [CURL](#curl)
- [DATE](#date)
- [DISK](#disk)
- [DOCKER](#docker)
- [DUPLICATES](#DUPLICATES)
- [FIND](#find)
- [FIREWALL](#Firewall)
- [GIT](#git)
- [GROUPS](#groups)
- [HOSTNAME](#hostname)
- [JAVA](#java)
- [JBOSS-CLI](#jboss-cli)
- [JENKINS-cli](#jenkins-cli)
- [JWT](#JWT)
- [KILL](#kill)
- [LINK](#link)
- [LOWERCASE/UPPERCASE](#case)
- [NPM](#npm)
- [OPENSHIFT](#openshift)
- [PIP](#pip)
- [PORTS](#ports)
- [PRIVILEGES](#privileges)
- [PROXY](#proxy)
- [REMOVE](#remove)
- [RHEL](#rhel)
- [SED](#sed)
- [SSH](#ssh)
- [SSL](#ssl)
- [SYSTEMCTL](#systemctl)
- [TCPDUMP](#tcpdump)
- [TRICKS](#tricks)
- [USER](#user)
- [VIM](#vim)
- [VIRTUALBOX](#virtualbox)


#### awk ####
```yaml
 show_block_text:
   cat -n standalone.xml | grep -i datasources   
   awk 'NR < 152 { next } { print } NR == 201 { exit }' standalone.xml

```


#### User ####
```yaml
  create: useradd [USERNAME]
  update_pass: passwd [USERNAME]
  list_user: cat /etc/sudoers

```

#### Groups ####
```yaml
  create_group: groupadd [GROUPNAME]
  add_group: usermod -aG [GROUPNAME] [USERNAME]
  entire_group_list: cut -d: -f1 /etc/group | sort
  specific_user: id -Gn [USERNAME]
```

#### Alias ####
Create your custom shortcuts

```bash
cat <<EOF >> ~/.bash_aliases
### GIT ###
# Linux
alias c=clear
alias cpa='rsync -rtv '
alias rexit='history -c && echo null > ~/.bash_history && exit '
alias l='ls -lh'
alias ll='ls -lah'
alias ltra='ls -ltr'

# Docker
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dpsqa='docker ps -qa '
alias dim='docker images '
alias dima='docker images -a'
alias drm='docker rm '
alias drmfa='docker rm -f $(docker ps -qa)'
alias drmexited='docker rm -f $(dpsqa -f status=exited)'
alias dinsp='docker inspect '
alias dlogs='docker logs -f '
alias dexec='docker exec -it '
alias drun='docker run -d -i -t '
alias dbuild='docker build -t '
alias dstop='docker stop '
alias dstart='docker start '
alias drestart='docker restart '
alias dstopa='docker stop $(dpsqa)'
alias dstarta='docker start $(dpsqa)'
alias drestarta='docker restart $(dpsqa)'

# Vagrant
alias vup='vagrant up'
alias vprovison='vagrant provision'
alias vdestroy='vagrant destroy'
alias vupdate='vagrant box update'
alias vssh='vagrant ssh'

# Git
alias ga='git add .'
alias gb='git branch'
alias gba='git branch -a'
alias gcf='git config'
alias gcfg='git config --global'
alias gcfs='git config --system'
alias grv='git remote -v'
alias gst='git status'
alias gps='git push -u $(grurl)'
alias grurl='git config --get remote.origin.url'
alias addssh='eval $(ssh-agent) && ssh-add -K ~/.ssh/id_rsa'
alias mac_address='ifconfig en1 | awk "/ether/{print }"'

# Flutter
alias fr='flutter run -d'
alias fd='flutter devices'
alias fe='flutter emulators'
alias fel='flutter emulators --launch'
alias fdoc='flutter doctor'
alias iphone='open -a Simulator'
alias flutter-ios-deintegrate="flutter clean && cd ios && pod deintegrate && rm -f Podfil* && flutter pub cache repair && flutter pub get && flutter pub upgrade"
alias fcb="flutter clean && flutter pub get && flutter build"

# K8S
alias kp="kubectl --kubeconfig='.kube/production/config' -n production"
alias kpn="kubectl --kubeconfig='.kube/production/config'"
alias kh="kubectl --kubeconfig='.kube/homolog/config' -n homolog"
alias khn="kubectl --kubeconfig='.kube/homolog/config'"
alias hp="helm --kubeconfig='.kube/production/config' -n production"
alias hh="helm --kubeconfig='.kube/homolog/config' -n homolog"

alias kubedvs="kubectl --kubeconfig='.kube/op-dev-k8s-config' -n dev-a1"
alias kubedvi="kubectl --kubeconfig='.kube/op-dev-k8s-config' -n dev-b1"

alias postgresup='/k8s/dev/support/postgres/connect.sh &'
alias openldapup='/k8s/dev/support/openldap/connect.sh &'
alias uppo='postgrestup && openldapup'
alias killpo="kill $(ps aux | egrep 'postgres|openldap' | awk {'print $2'})"


#DOTNET
#alias dotnet='/usr/local/share/dotnet/dotnet'

alias dnb='dotnet build'
alias dnc='dotnet clean'
alias dnr='dotnet restore'


#Angular
alias ngm='ng g m'
alias ngc='ng g c'
alias ngs='ng g s'
alias ngi='ng g interface'

EOF
```


#### CheckOS ####
```yaml
  cat /etc/*release | grep -i redhat|debian
```

#### AutoComplete ####
```bash
echo ' # mappings to have up and down arrow searching through history:
"\e[A": history-search-backward
"\e[B": history-search-forward
# mappings to have left and right arrow go left and right:
"\e[C": forward-char
"\e[D": backward-char

# mapping to have [Tab] and [Shift]+[Tab] to cycle through all the possible completions:
"\t": menu-complete
"\e[Z": menu-complete-backward' >> ~/.inputrc
```

### ANGULAR ###

```bash

ng generate components <COMPONENT_NAME>
ng g c <COMPONENT_NAME>

ng generate service <SERVICE_NAME>
ng g s <SERVICE_NAME>

ng generate module <MODULE_NAME> --routing
ng g m <MODULE_NAME> --routing

ng generate interface <INTERFACE_HAME>

```

### CASE ###

```bash
#UPPERCASE

UPPER_MSG='THIS IS UPPER'
#tr
echo $UPPER_MSG | tr '[:upper:]' '[:lower:]'
#AWK
echo $LOWER_MSG | awk '{ print tolower($0)}'

# LOWERCASE
LOWER_MSG='this is lower'

echo $LOWER_MSG | tr '[:lower:]' '[:upper:]'
echo $LOWER_MSG | awk '{ print toupper($0)}' 

# Bash4.0
${UPPER_MSG,,*} #lowercase
${LOWER_MSG^^*} #uppercase
```

#### CPU ####
```yaml
  Show:
    lscpu

  Cores:
    lscpu | grep -E '^Thread|^Core|^Socket|^CPU\('
    
    cpuid Command – Shows x86 CPU.
    dmidecode Command – Shows Linux Hardware Info.
    lshw -> (Installable)
    
  Tools Installation:
    Inxi Tool – Shows Linux System Information. ...
    lshw Tool – List Hardware Configuration. ...
    hardinfo  – Shows Hardware Info in GTK+ Window. ...
    hwinfo    – Shows Present Hardware Info.
```

#### JWT ####
```bash
# Decoding jwt token and reading the json objects

curl --location --request POST 'https://localhost/auth/realms/Providers/protocol' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=pass' \
--data-urlencode 'client_id=mobile' \
--data-urlencode 'username=email@email.com.br' \
--data-urlencode 'password=123456' \
--data-urlencode 'client_secret=MYSECRET' | jq '.access_token' | sed 's/\"//g' | jwt
```


#### Cntlm ####
```yaml
  # https://vijiboy.wordpress.com/2018/03/14/configure-cntlm-to-generate-hash-for-your-password-h-and-verify-m/
  user_data: cntlm -H -u username -d domainname # /etc/cntlm.conf
  check: cntlm -M http://google.com

```
#### Host ####

```yaml
 get_address:
    host localhost
```

#### Hostname ####
```yaml
  setting(Fedora):
    hostnamectl -set-hostname [NAME]
    hostnamectl status
  add:
    sudo /bin/bash -c 'echo -e "198.162.0.1\tmy.sample.host" >> /etc/hosts'
  public_address:
    curl -4 ifconfig.co
    curl ifconfig.me
  get_ip:
    ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//' # Linux
    ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1
```

#### Java ####

- Generating signed jar:
```bash

# Generate key
keytool -genkey -v -keystore MY_KEYSTORE.key -keyalg RSA -keysize 2048 -validity 10000 -alias MY_ALIAS

# Seflsigning Cert
keytool -selfcert -keystore MY_KEYSTORE.key -alias MY_ALIAS

# Signing jar
jarsigner -keystore MY_KEYSTORE.key MY_GENERATED.jar MY_ALIAS


```


#### Grep ####

```yaml
 regex:
    grep -Po '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' <<<'Find my server ip 127.0.0.1 or my.local.host'
    grep -Po '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' <<<$(cat cat /etc/hosts)
    cat /etc/hosts | grep -Po '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'
 second_line:
    echo -e 'red \n blue \n green \n grey' \n black | grep e | awk 'NR==2'
```


#### Find ####
```yaml
  find / -name [FILE|FOLDER]
  find / -iname [FILE|FOLDER] # case insensitive
  find . -name [FILE|FOLDER] -type d -exec rm -rf {} \; # Find and remove
  find [PATH] -ilname [FILE|FOLDER] -print 2>/dev/null # Find without permission denied print
  find . ! -name [FILE|FOLDER] # Find except file name
  # More infos: http://www.hypexr.org/linux_find_help.php

  parent_folder:
    find [PATH] -type d -maxdepth 1
    find [PATH] -type d -maxdepth 1 -ls
  remove_directories_not_in_path:
  find . -type d -not -path "*directory1" -not -path "*directory2" -maxdepth 1 -exec rm -rf '{}' \;
  
  #files
  find . -type f
```

#### Vim ####
```yaml
  select: vyp [highlight/copy/paste]
  copy_line: yy or Y
  delete_line: dd
  paste:
    p # to paste the copied or deleted text after the current line
    P # to paste the copied or deleted text before the current line
  multiple_lines:
    copy: 7yy
    delete: 10dd
  replace_all:
     :%s/search_string/replacement_string/g
```

#### for ####
```yaml
copy_from_list_dir:
  for i in $(ls); do cp "$i" /tmp; done
escape:
  for i in $(ls); do echo "<resource-root path=\"$i\" />"; done
```

#### Virtualbox ####
```yaml
  guest_additions:
    sudo apt-get install virtualbox-guest-dkms virtualbox-guest-x11 linux-headers-$(uname -r)
    sudo reboot
```

#### Disk ####
```yaml
  increase:
    lsblk
    df -h
    lvextend -L +100G /dev/mapper/example
    xfs_growfs /dev/mapper/example
  spaces_used:
    cd /
    du -sch *
    du -h --max-depth=1 ./
  list_disk_usage:
    df -h
```

#### Systemctl ####
```yaml
  # Reload daemon
  systemctl daemon-reload

  # Commands
  systemctl status [PROCESS]
  systemctl stop [PROCESS]
  systemctl start [PROCESS]
  systemctl restart [PROCESS]
  systemctl show --property [PROPERTY] [PROCESS]
  #systemctl show --property Environment docker
```

#### Remove ####
```yaml
  dir:
    rm -r [DIRECTORY] [*=ALL]
  file:
    rm -f [FILE] [*=ALL]
  per_day:
    find [FOLDER] -mtime +1 -exec rm -f {} \;
    find . -mtime +180 -delete;
```

#### ssl ####
```yaml
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
```

#### ssh ####
```yaml
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
  send_command_remotely:
    ssh -t user@server_host 'echo "My Sample Text" > /tmp/test.txt; cat /tmp/test.txt'
```

#### Proxy ####
```yaml
  # /etc/environment && ~/.bashrc
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

```

#### DUPLICATES ####
```bash
uniq # Remove duplicates
uniq -d #get duplicates
```

#### Git ####
```yaml
  init:
    git init
  remote:
    git remote add -f origin <remote_repository_url>
    git branch -r | sed -e 's/^.*origin\///g' | uniq #Get all remote branches removing duplicates 
  credential:
    # Store credential user pass after login one time.
    git config --global credential.helper store
    git config --global credential.helper cache #  memory
    git config --global credential.helper 'cache timeout=36000'
  add:
    git add .
    git add -- [FILE|FOLDER]
  current_branch_name:
    git rev-parse --abbrev-ref HEAD
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
    git push -u origin $(git rev-parse --abbrev-ref HEAD)
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
    specific_branch:
      git clone --single-branch --branch BRANCH_NAME GIT_REPO_URL [REPO_NAME]
  gitignore_update:
  	git rm -rf --cached . && git add .
  config:
    # edit
    git config [ --global | --system ] -e
    # --global = ~/.gitconfig
    # --system = /etc/gitconfig
    git config [ --global | --system ] alias.st status # git st = git status
    git config [ --global | --system ] http.proxy http://[USERNAME]:[PASSWORD]@[PROXY_URL]:[PROXY_PORT]
    git config [ --global | --system ] http.sslVerify [true | false]
    git config [ --global | --system ] --get http.proxy  
    git config [ --global | --system ] --unset http.proxy  
  revert:
    git checkout -- [FILE|FOLDER|COMMIT_ID] HEAD~[number]
  reset:
    git reset -- [FILE|FOLDER]
    git reset .
    git clean -df && git reset --hard # Reset Full without return.
  remove:
    git rm -- [FILE|FOLDER]
  rev:
    git rev-list
    git rev-parse @ # get local commit hash
    git rev-parse @{u} # get remote commit hash
    git ls-remote [GIT_REPO_URL] # list remote commit hash
  log:
    git log -- [FILE|FOLDER]
    git log -p -2 --all --full-history -- *[FILE|FOLDER]*
    git log after='2017-01-01' before='2018-01-01'

    git log --stat
    git log --pretty=oneline | short | medium | full | fuller

  recovery_detached:
    git reflog
    git checkout -b [BRANCH_NAME] [ID|HEAD~<NUMBER>]
    
  rename_local_branch:
    git branch -m NEW_BRANCH_NAME

  rename_remote_branch:
    git branch -m NEW_BRANCH_NAME
    git push origin --delete NEW_BRANCH_NAME
    git push -u origin NEW_BRANCH_NAME
    change_remote_url:
      git remote set-url origin [GIT_REPO_URL]
  git_clone_one_file:
    git archive --remote=git@github.com:sammervalgas/command-guide.git HEAD README.md | tar -xvf -
    git archive --remote=git@github.com:sammervalgas/command-guide.git [YOUR_BRANCH_NAME] README.md | tar -xvf -
    git archive --remote=git@github.com:sammervalgas/command-guide.git --prefix=[WHERE_TO_GO] [YOUR_BRANCH_NAME] [PATH/FILE] | tar -xvf -

  get_commit_message:
     # .git/hook/commit-msg
     #!/bin/bash
      INPUT_FILE=$1
      START_LINE=`head -n1 $INPUT_FILE`
  
  git_merge:
  	local:
		# merge: ... - not something we can merge
		git checkout BRANCH_NAME_TO_MERGE
		git checkout TARGET_BRANCH_NAME
		git merge BRANCH_NAME_TO_MERGE
	remote:
		git fetch origin REMOTE_BRANCH
		git checkout TARGET_BRANCH_NAME
		git merge origin/REMOTE_BRANCH
  git_discover_branch:
  	
  

```

#### Docker ####
```yaml
  list-containers[all]:
    docker ps [-a]
  list-images:
    docker images
  remove-container:
    docker rm <container | $(docker ps -q)>
  remove-images:
    docker rmi <image | $(docker images -q)>
    
  remove_untagged_images:
    docker rmi $(docker images -a | grep -i "^<none>" | awk '{print $3}') [--force]
    docker rmi -f $(docker images --filter "dangling=true")
    
  build:
    docker build -t [IMAGE_TAGGED_NAME]:[IMAGE_VERSION] -f <Dockerfile> .
  run:
    docker run -d -i -t -v /folder:/container_folder -p 8080:80 [CONTAINER_NAME]
  logs:
    follow:
      docker logs -f [CONTAINER_NAME]
    last_lines:
      docker logs -f --tail 10 [CONTAINER_NAME]
    since:
      docker logs -f --since 1m [CONTAINER_NAME]
  save_image_reload:
  	docker save --output image.tar [IMAGE_ID]
	docker image prune -fa
	docker load --input image.tar
  filter:
    # REF >>>>>> https://docs.docker.com/engine/reference/commandline/ps/
    docker ps -a -f 'exited=0' # 1 137 ...
    docker ps -a -f 'status=exited' # running | created | exited | paused | restarted
    docker ps -a --filter 'status=running' --format 'table \n{{ .ID}} {{.Names}} --> {{.Ports}} {{.Size}}'

  exec:
    docker exec -it [CONTAINER_NAME] bash # Enter inside container bash
    docker exec -i [CONTAINER_NAME] wget http://github.com/sammervalgas # Run wget inside container
    docker exec -i [CONTAINER_NAME] /bin/bash -c "mkdir -p ~/.m2/repository" # create folder inside docker
  inspect_images_in_use:
    docker inspect --format='{{.Id}} {{.Parent}}' $(docker images --filter since=[CONTAINER_NAME] -q)
    docker inspect --format '{{ .NetworkSettings.IPAddress}}' [CONTAINER_NAME]
    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' [CONTAINER_NAME]
    docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' [CONTAINER_NAME]

    # (Inspect First From Array)
    # Get Docker Gateway
    docker inspect network bridge
    docker inspect -f '{{ (index .IPAM.Config 0).Gateway }}' bridge

  copy-to-host:
    docker cp [CONTAINER_NAME]:[FILE|FOLDER] [DESTINATION]
  copy-to-container:
    docker cp [DESTINATION] [CONTAINER_NAME]:[FILE|FOLDER]
  enter_specific_container_folder:
  	docker exec -it CONTAINER_NAME bash -c "cd /some/dir; exec bash"
    docker exec -it CONTAINER_NAME bash -c "cd /some/dir; exec ${SHELL:-sh}" # Not usual but works. Change shell
  registry:
    mkdir -p /home/$USER/certs
    cd /home/$USER/certs

    #Generate rsa private key
    openssl genrsa -out registry.docker.test.com.key 2048

    # Gerate CRS (Certificate Signing Request)
    openssl req -new -key registry.docker.test.com.key -out registry.docker.test.com.csr

    # Generate SSL Certificate (CRT) Self Sign.
    openssl x509 -req -days 365 -in registry.docker.test.com.csr -signkey registry.docker.test.com.key -out registry.docker.test.com.crt

    # Create folder certs.d registry docker
    sudo mkdir -p /etc/docker/certs.d/registry.docker.test.com

    # Copy CRT into certs.d docker registry
    sudo cp /home/$USER/certs/registry.docker.test.com.crt /etc/docker/certs.d/registry.docker.test.com/ca.pem

    # as root -> Set registry on hosts
    echo "$(docker inspect -f '{{ (index .IPAM.Config 0).Gateway }}' bridge)    registry.docker.test.com" >> /etc/hosts

    # Run registry container
    docker run -d -p 5000:5000 \
    -v "/home/$USER/certs:/certs" \
    -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/registry.docker.test.com.crt \
    -e REGISTRY_HTTP_TLS_KEY=/certs/registry.docker.test.com.key \
    -v /opt/registry/data:/var/lib/registry \
    --restart always \
    --name registry registry:2

    # Check registry
    curl -i https://registry.docker.test.com:5000/v2/

    # Docker pull and tag
    docker pull redis:alpine; docker tag redis:alpine registry.docker.test.com:5000/redis:alpine

    # Push image to registry
    docker push registry.docker.test.com:5000/redis:alpine

    # If face some problem look into know-issues []
```

#### Curl ####
```yaml
  download:
    curl -sSOL [HTTP_URL]
  Post:
    curl -X -H "Content-Type: application/json" -H "X-Auth-Token: jd108rs4hfield" --data "param1=value1" POST [MY_HTTP_POST]

```

#### Sed ####
```yaml
  # Creating a file to use sed
  cat <<EOF >> sample-for-sed.file
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

add-text-one-line:
  sed -e '/002/s/append_me/' sample-for-sed.file
covert_string_to_array:
  arr=(`echo $(sed -e 's/\// /g' <<< "pos1/pos2/pos3/my-pos4/your-pos5/" )`)
  for i in ${arr[@]};do echo "$i";done

```

#### date ####
```yaml
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
```

#### pip ####
```yaml
  installation:
    pip install --upgrade pip
    pip install docker-compose==1.9.0
  search_list:
    pip list --format=columns | grep docker
```

#### RHEL ####
```yaml
  subscription:
    check: sudo subscription-manager status
    #where: https://access.redhat.com/downloads/content/package-browser
    repo_enable: subscription-manager repos --enable=[REPO] #Ex: -> rhel-7-server-optional-rpms

```

#### npm ####
```yaml
  config:
    npm config --global [DATA]
    npm config -g [DATA]

  proxy:
    npm config -g set proxy "[PROXY_URL]"
    npm config -g set https-proxy "[PROXY_URL]"

  ssl:
    npm config -g set strict-ssl false

  config:
    npm config --global set registry "http://registry.npmjs.org/"
    # remove
    npm config --global unset registry

  proxy:
    npm config set proxy http://<username>:<password>@<proxy-server-url>:<port>
    npm config set https-proxy http://<username>:<password>@<proxy-server-url>:<port>

```

#### Link ####
```yaml
  ln -s [SOURCE] [DESTINATION]
  unlink [FILE|FOLDER]
```

#### Kill #####
```bash
 kill -9 $(ps aux | grep -i 'ANY_PROCESS_PARAM_INSIDE_PSX' | awk '{print $2}' | head -n 1)
 # kill agent.jar
 kill -9 $(ps aux | grep 'java -jar agent.jar -jnlpUrl' | awk '{print $2}' | head -n 1)
```

#### Privileges #####
```bash
# create user Ex: jenkins
useradd jenkins

# change password
passwd jenkins

# create sudoers user file inside sudoers.d!
# Ex: jenkins
sudo /bin/bash -c "echo '' > /etc/sudoers.d/jenkins"

# Add privileges without enter pass (not recomended but I like :)
jenkins ALL= NOPASSWD: /usr/bin/docker # run docker
jenkins ALL= NOPASSWD: /bin/vi /etc/hosts # edit hosts file

# allow systemctl commands only for docker
jenkins ALL= NOPASSWD: /bin/systemctl daemon-reload, /bin/systemctl status docker, /bin/systemctl start docker, /bin/systemctl stop docker, /bin/systemctl restart docker

```

#### Bootable_usb ####

> :warning: ***IMPORTANT:***    
> Make sure to specify the output as the device name (for example, /dev/sdb), not as a name of a partition on the device (for example, /dev/sdb1).

```bash
$ lsblk
.
.
.
sdb               8:16   1  14,4G  0 disk
└─sdb1            8:17   1  14,4G  0 part /run/media/sammervalgas/pendrive

#####

$ su -
$ umount /dev/sdb

$ dd if=/home/sammervalgas/isos/my.iso of=/dev/sdb bs=1M
1994+1 registros de entrada
1994+1 registros de saída
2091008000 bytes (2,1 GB) copiados, 135,882 s, 15,4 MB/s

```

#### jboss-cli ####
```yaml
Connect:
   - $JBOSS_HOME/bin/jboss-cli -c

Enable Rbac:
   # Change directory to the authorisation node
   - cd /core-service=management/access=authorization 
   
   # command lists the current role names
   - ls -l 
   
   # To turn provider on RBAC
   - :write-attribute(name=provider, value=rbac) # After Restart JBoss
   
   # Disable RBAC
   - :write-attribute(name=provider, value=simple) # After Restart JBoss
   
   # Set myadmin user to SuperUser
   # ./role-mapping=SuperUser/include=ALIAS:add(name=USERNAME, type=USER)
   ./role-mapping=SuperUser/include=user-MyAdmin:add(name=myadmin, type=USER)
   
   # Add to a group
   ./role-mapping=Deployer/include=devops-group:add(name=leader-devs, type=GROUP)
   ./role-mapping=Monitor/include=monitoring-group:add(name=devs, type=GROUP)


```


#### jenkins-cli ####

```yaml
get_jars:
	curl 'http://my.jenkins:8080/jnlpJars/jenkins-cli.jar' > "$HOME/jenkins-cli.jar"
	echo '<User ID>:<API Token>' > "$HOME/.jenkins-cli-auth"

 build_jcli: #Wrapper to jenkins-cli
  cat <<EOF > $HOME/jcli
  #!/bin/bash
  if [[ -z "$1" ]];
  then
  echo "Error: Server name not found > jcli http://my.jenkins:8080"
  else
  # ${@:2} = Args starts after first ('$1') one
  java -jar $HOME/jenkins-cli.jar -s $1 -noKeyAuth -auth @$HOME/.jenkins-cli-auth ${@:2}
  fi
  EOF

  chmod 755 $HOME/jcli
  ln -s $HOME/jcli /usr/local/bin/

  jcli http://my.jenkins:8080/ help
  # Enjoy the silence ... (8-D.

  # SecretHandler.groovy it is in jenkins-groovy github project
  jcli http://my.jenkins:8080/ groovy = < SecretHandler.groovy '{AQAAABAAAAAQKOim4oesdIbJtOg0BT0kwDwaiO48vik/rcDU3dyT0MaQ=}'
```

#### Openshift ####

*** OC ***

```yaml
oc get dc [deployment-config]
oc get svc [service]
oc get bc [buildConfig]

Create:
  NewApp:
    oc new-app app1
Edit:
	oc edit ... -n [NAMESPACE]

Template:
   get:
     oc get template [TEMPLATE_NAME]
     oc get template [TEMPLATE_NAME] -o yaml
   edit:
     oc edit template [TEMPLATE_NAME]
  create_from_git:
    git archive --remote=GIT_REPO.git HEAD template.yml | oc create -f -
  replace_from_git:
    git archive --remote=GIT_REPO.git HEAD template.yml | oc replace -f -

Pods:
	oc get pods
  	oc get pod [NAME] -o wide
  	oc describe pod [NAME]
  	oc delete pod [NAME]

Nodes:
	oc get nodes
	oc get nodes -o wide
	oc get nodes -o yaml | json

Formatted:
	oc get pods -n [NAMESPACE] -o wide | awk '{printf "%s \t\t %s \n", $1, $7}'

```
#### Maven ####

```bash

mvn clean package

mvn clean install

mvn sonar:sonar -Dsonar.login='' ....

# cleanup dependencies
mvn dependency:purge-local-repository

```


#### override commands ####


```bash
# cd:
cat <<EOF >> ~/.bashrc
function alerta () {
  if [[ $PWD == '/tmp' ]]
  then
    echo "[$(date +%F-%A-%T)] - User $USER entered at $PWD."
  fi
}

function cd () {
  builtin cd "$@" && alerta
}
EOF

history:
  echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bash_profile
  # To overwrite the history file with the current shell's
  history -w
  history -d $(history | tail -1 - | awk '{print $1}') | vi ~/.bash_history
  for i in {$(history | tail -1 - | awk '{print $1}')..[END_POSITION]}; do history -d "$i"; done

```

### Firewall ####
[http://ask.xmodulo.com/open-port-firewall-centos-rhel.html](http://ask.xmodulo.com/open-port-firewall-centos-rhel.html)
```bash
  sudo systemctl stop firewalld
  sudo systemctl disable firewalld

```

#### tcpdump ####

```bash
# wait GET request on 8080 port
sudo tcpdump 'dst port 8080 and tcp[32:4] = 0x47455420'

# tcpdump: NFLOG link-layer type filtering not implemented
sudo tcpdump -i 5 'dst port 8080 and tcp[32:4] = 0x47455420'
```

#### ports ####
```yaml
list_all:
  sudo lsof -i -P -n
check_listen:
  sudo lsof -i -P -n | grep LISTEN
  sudo netstat -tulpn | grep LISTEN
get_process_from_port:  
lsof -i:8080 | awk '{print $2}' | head -2 | tail -1

```
#### tomcat ####

```bash
# ENVIRONMENT
TOMCAT_USER=my_username
TOMCAT_PASS=my_password
TOMCAT_HOST=localhost
TOMCAT_PORT=8080

CONTEXT_PATH=/my_application_name
WAR_FILE=target/my_application.war  # or $(find . -name "*.war" -type f) 

# DEPLOY
curl --upload-file $WAR_FILE "http://$TOMCAT_USER:$TOMCAT_PASS@$TOMCAT_HOSTL:$TOMCAT_PORT/manager/text/deploy?path=$CONTEXT_PATH&update=true"

#UNDEPLOY
curl "http://$TOMCAT_USER:$TOMCAT_PASS@$TOMCAT_HOSTL:$TOMCAT_PORT/manager/text/undeploy?path=$CONTEXT_PATH"

```
	IMPORTANT: tomcat-users.xml has to be setup with user that has admin, manager and manager-script roles.

<!--
#### Tricks ####
```yaml
  hide_traces:
    history -d $(history | tail -1 - | awk '{print $1}') | vi ~/.bash_history
    for i in {$(history | tail -1 - | awk '{print $1}')..[END_POSITION]}; do history -d "$i"; done

```
-->


#### bash ####

```bash
# list recursive
ls -R . | awk '/:$/&&f{s=$0;f=0}/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}NF&&f{ print s"/"$0 }'
```
