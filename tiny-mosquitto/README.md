tiny-mosquitto
==============

this file is available at

https://github.com/lexlapax/Dockerfiles/blob/master/tiny-mosquitto/README.md


description
-----------
a minimal runtime only docker encapsulation of the mosquitto mqtt broker available at http://mosquitto.org

currently uses http://mosquitto.org/files/source/mosquitto-1.3.5.tar.gz

this is built using buildroot v14.11 http://buildroot.uclibc.org/ in order to make the image small.

the docker image was built with instructions from 

http://blog.docker.io/2013/06/create-light-weight-docker-containers-buildroot/

the buildroot directory contains the .config file used for running the build.

mosquitto uses malloc_usable_size which is not available in uclibc

the config uses glibc instead because of that

the buildroot/package/mosquitto contains the two required files to include mosquitto into the buildroot build


short instructions 
------------------
(the full instructions are in the buildimage.sh file)

download buildroot 

git clone this repo

copy buildroot config and mosquitto build instructions from git clone to buildroot directory

build root image

touch up root image with docker support (/sbin/init and /etc/resolv.conf)

import image into docker (at this point the image can be tested)

create new image from Dockerfile

enjoy


the image built this way is tiny


> $ docker images

> REPOSITORY              TAG                 IMAGE ID            CREATED             VIRTUAL SIZE

> lapax/tiny-mosquitto      latest              fb9fd82b0c0b        4 minutes ago       6.25 MB
