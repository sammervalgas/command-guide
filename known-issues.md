Known issues (Problems Solutions)
=============


## Docker ##

#### :red_circle: ERROR ####

```bash
$ docker run -ti -p 8080:8080 -p 50000:50000 -v /opt/jenkins:/var/jenkins_home jenkins
```

> touch: cannot touch '/var/jenkins_home/copy_reference_file.log': Permission denied <br/>
> Can not write to /var/jenkins_home/copy_reference_file.log. Wrong volume permissions?<br/><br/>

#### :heavy_check_mark: SOLUTION ####
```bash
$ sudo chmod -R 1000 /var/jenkins_home
or
$ sudo chmod -R 1000:1000 /var/jenkins_home

$ docker run -it -u $(id -g) -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```
<br/><br/>

#### :red_circle: ERROR ####

***_Get https://registry.docker.test.com/v2/: net/http: TLS handshake timeout in Docker_***

> :warning:IMPORTANT: If you are behind proxy environment, setup http-proxy.conf daemon docker

#### :heavy_check_mark: SOLUTION ####

```bash
cat /etc/systemd/system/docker.service.d/http-proxy.conf 
    
# If NOT EXIST run this line
cat<<EOF >> /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=[YOUR_PROXY_URL]"
Environment="NO_PROXY=localhost,127.0.0.1,registry.docker.test.com"

# If EXISTS http-proxy.conf add NO_PROXY line
echo 'Environment="NO_PROXY=localhost,127.0.0.1,registry.docker.test.com"' >> /etc/systemd/system/docker.service.d/http-proxy.conf
```
***Reload***
```bash
# Reload daemon
systemctl daemon-reload
# Restart
systemctl restart docker
# Check the property Environment docker NO_PROXY shows.
systemctl show --property Environment docker
```
---
#### :red_circle: ERROR ####
***_x509: certificate signed by unknown authority_***


Add into daemon.json the follow snippet according docker installation type: <br/>
* docker-ce: /etc/docker/daemon.json <br/>
* redhat: /etc/sysconfig/docker <br/>

#### :heavy_check_mark: SOLUTION ####

```json
{
 "insecure-registries": ["registry.docker.test.com:5000"]
}
```
***Reload***
```bash
# Reload daemon
systemctl daemon-reload
# Restart
systemctl restart docker
# Check the property Environment docker NO_PROXY shows.
systemctl show --property Environment docker
```
---
## Certbot ##
#### :red_circle: ERROR ####
***_Problems with renew...<br/>
Client with the currently selected authenticator does not support any combination of challenges that will satisfy the CA_***

#### :heavy_check_mark: SOLUTION ####
```bash
sudo certbot --authenticator standalone --installer nginx -d [MY.DOMAIN] --pre-hook "service nginx stop" --post-hook "service nginx start"
```

> (OR) Follow this link: https://community.letsencrypt.org/t/how-to-stop-using-tls-sni-01-with-certbot/83210


## DOCKER SONARQUBE ##

#### :red_circle: ERROR ####
    
    max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]

#### :heavy_check_mark: SOLUTION ####

```bash
sudo sysctl -w vm.max_map_count=262144
```

#### NPM ####

ERROR: ***sh: 1: node: Permission denied***

SOLUTION
```bash
npm config set user 0
npm config set unsafe-perm true
