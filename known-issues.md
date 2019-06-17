Known issues (Problems Solutions)
=============


## Docker

### Issue:<br/>

```bash
$ docker run -ti -p 8080:8080 -p 50000:50000 -v /opt/jenkins:/var/jenkins_home jenkins
```

> touch: cannot touch '/var/jenkins_home/copy_reference_file.log': Permission denied <br/>
> Can not write to /var/jenkins_home/copy_reference_file.log. Wrong volume permissions?<br/><br/>

### Solution:
```bash
$ sudo chmod -R 1000 /var/jenkins_home
or
$ sudo chmod -R 1000:1000 /var/jenkins_home

$ docker run -it -u $(id -g) -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```
<br/><br/>

### Issue 

> ERROR: Get https://registry.docker.test.com/v2/: net/http: TLS handshake timeout in Docker <br/>
> IMPORTANT: If you are inside proxy environment, setup http-proxy.conf daemon docker
<br/>

### Solution
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
<br/><br/>
### Problem
> x509: certificate signed by unknown authority<br/>
> Add into daemon.json the follow snippet<br/>
> docker-ce:  /etc/docker/daemon.json<br/>
> redhat: /etc/sysconfig/docker<br/>
<br/>

### Solution

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

#### Certbot
## Issue:</br>

> Problems with renew...
> Client with the currently selected authenticator does not support any combination of challenges that will satisfy the CA
<br/>
### Solution:
```bash
sudo certbot --authenticator standalone --installer nginx -d [MY.DOMAIN] --pre-hook "service nginx stop" --post-hook "service nginx start"
```

> (OR) Follow this link: https://community.letsencrypt.org/t/how-to-stop-using-tls-sni-01-with-certbot/83210

