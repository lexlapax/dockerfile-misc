# Build mosquitto from source
# file is using http://mosquitto.org/files/source/mosquitto-1.2.3.tar.gz
FROM ubuntu:precise
MAINTAINER Lex Lapax <lexlapax@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install wget build-essential libwrap0-dev libssl-dev python-distutils-extra -y

RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src
RUN wget http://mosquitto.org/files/source/mosquitto-1.2.3.tar.gz
RUN tar xvzf ./mosquitto-1.2.3.tar.gz
WORKDIR /usr/local/src/mosquitto-1.2.3
RUN pwd
RUN make
RUN make install
RUN adduser --system --disabled-password --disabled-login mosquitto
EXPOSE 1883
ENTRYPOINT ["/usr/local/sbin/mosquitto"]
