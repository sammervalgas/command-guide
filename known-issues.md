Known issues (Problems Solutions)
=============


#### Docker

Issue:</br>
$ docker run -ti -p 8080:8080 -p 50000:50000 -v /opt/jenkins:/var/jenkins_home jenkins
> touch: cannot touch ‘/var/jenkins_home/copy_reference_file.log’: Permission denied <br/>
> Can not write to /var/jenkins_home/copy_reference_file.log. Wrong volume permissions?

Solution:
$ sudo chmod -R 1000 /var/jenkins_home
or
$ sudo chmod -R 1000:1000 /var/jenkins_home

$ docker run -it -u $(id -g) -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home jenkins/jenkins:lts
