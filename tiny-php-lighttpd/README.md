tiny-php-lighttpd
=================

this file is available at

https://github.com/lexlapax/Dockerfiles/blob/master/tiny-php-lighttpd/README.md

is most likely also available as an untrusted docker image (for now) 

at https://index.docker.io/u/lapax/tiny-php-lighttpd/ for testing purposes 


description
-----------
a very minimal (buildroot based) docker encapsulation of php, mysql-client and lighttpd 

this is built using buildroot http://buildroot.uclibc.org/ in order to make the image small.

the docker image was built with instructions from 

http://blog.docker.io/2013/06/create-light-weight-docker-containers-buildroot/

the buildroot directory contains the .config file used for running the build.

the buildroot/package/mysql_client contains the changed mysql_client.mk (to take care of ld.so.cache issues in uclibc)
the buildroot/package/php contains the changed php package files to include additional things like gd etc..


short instructions 
------------------
(the full instructions are in the buildimage.sh file)

download buildroot 

git clone this repo

copy buildroot config, mysql_client and php build instructions from git clone to buildroot directory

build root image

touch up root image with docker support (/sbin/init and /etc/resolv.conf)

touch up root image with lighttpd example directory

import image into docker (at this point the image can be tested)

create new image from Dockerfile

enjoy


the image built this way is tiny

> $ docker images 

> REPOSITORY              TAG                 IMAGE   ID            CREATED             VIRTUAL SIZE 

> lapax/tiny-php-lighttpd latest d24f6143907d About a minute ago 54.24 MB
