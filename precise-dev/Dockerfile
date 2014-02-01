FROM ubuntu:precise
MAINTAINER Lex Lapax <lexlapax@gmail.com>

RUN echo "deb http://us.archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install wget curl build-essential golang libwrap0-dev libssl-dev python-distutils-extra -y

CMD ["/bin/bash", "-l"]
