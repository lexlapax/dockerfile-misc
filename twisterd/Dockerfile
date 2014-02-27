# build twister from source
# see accompanying README.md
# and upstream source instructions http://twister.net.co/
FROM ubuntu:precise
MAINTAINER Lex Lapax <lexlapax@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN \ 
	apt-get update ;\
	apt-get upgrade -y ;\
	apt-get install build-essential libtool libssl-dev libboost-all-dev python-distutils-extra python-software-properties libminiupnpc8 wget git -y ;\
	add-apt-repository -y ppa:bitcoin/bitcoin ;\
	apt-get update ;\
	apt-get install libdb4.8-dev libdb4.8++-dev libminiupnpc-dev -y 

RUN \
	mkdir -p /usr/local/src ~/.twister ;\
	cd /usr/local/src; \
	git clone https://github.com/miguelfreitas/twister-core.git ;\
	git clone https://github.com/miguelfreitas/twister-html.git ;\
	cd /usr/local/src/twister-core ;\
	./bootstrap.sh --enable-logging --enable-debug --enable-statistics ;\
	make ;\
	make install-binPROGRAMS 

RUN \
	cd ~/.twister ;\
	mv /usr/local/src/twister-html ./html ;\
	echo "rpcuser=user" >> ~/.twister/twister.conf ;\
	echo "rpcpassword=pwd" >> ~/.twister/twister.conf ;\
	echo "rpcallowip=*.*.*.*" >> ~/.twister/twister.conf 

EXPOSE 4433 4434 28332 28333 29333 29333/udp 
#CMD twisterd -daemon -rpcuser=user -rpcpassword=pwd -rpcallowip=127.0.0.1
CMD ["/bin/bash", "-i"]
CMD ["/usr/local/bin/twisterd"]
