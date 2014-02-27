twisterd
========

This file is available at

https://github.com/lexlapax/Dockerfiles/blob/master/twisterd/README.md

It is most likely available as a trusted docker image 
at http://index.docker.io/u/lapax/twisterd/ for testing / home use purposes


description
-----------
A docker encapsulation of twister peer-to-peer microblogging service available at http://twister.net.co/

was built from source at https://github.com/miguelfreitas/twister-core using instructions from http://twister.net.co/?page_id=23 

uses ubuntu precise (12.04) as a base build image

starts up twisterd as root using configs in root's ~/.twister/twister.conf ..
allows rpc from *any* host by default, if not desired, the "rpcallowip" value can be changed to one's liking

after starting with something like

docker run -d -name twisterd lapax/twisterd

you can access the html interface using a browser at
	http://<dockercontainerip>:28332/index.html

for <dockercontainerip> you could do
	docker inspect -format '{{ .NetworkSettings.IPAddress }}' twisterd

follow instructions from http://twister.net.co/?page_id=23 and http://twister.net.co/?page_id=29
after you can access the HTML UI

enjoy :)
