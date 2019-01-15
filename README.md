# Linux Command Guide

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
