tiny-haproxy
============

this file is available at

https://github.com/lexlapax/Dockerfiles/blob/master/tiny-haproxy/README.md

is most likely also available as an untrusted docker image (for now) 

at https://index.docker.io/u/lapax/tiny-haproxy/ for testing purposes 


description
-----------
a very minimal (buildroot based) docker encapsulation of haproxy available at http://haproxy.1wt.eu/

http://haproxy.1wt.eu/download/1.4/src/haproxy-1.4.24.tar.gz

this is built using buildroot http://buildroot.uclibc.org/ in order to make the image small.

the docker image was built with instructions from 

http://blog.docker.io/2013/06/create-light-weight-docker-containers-buildroot/

the buildroot directory contains the .config file used for running the build.

the buildroot/package/haproxy contains the two required files to include haproxy into the buildroot build
image includes sshd 
image also includes pythonbased supervisord to help start up sshd and haproxy
short instructions 
------------------
(the full instructions are in the buildimage.sh file)

download buildroot 

git clone this repo

copy buildroot config and haproxy build instructions from git clone to buildroot directory
insert haproxy build instructions into package/Config.in

build root image

touch up root image with docker support (/sbin/init and /etc/resolv.conf)

touch up root image with haproxy example directory

import image into docker (at this point the image can be tested)

create new image from Dockerfile

enjoy


the image built this way is tiny

> $ docker images 

> REPOSITORY              TAG                 IMAGE   ID            CREATED             VIRTUAL SIZE 

> lapax/tiny-haproxy      latest              0600e2ff19e7        3 minutes ago       2.592 MB

