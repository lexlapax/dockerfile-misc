# minimal image to support just the runtime for mosquitto
# file is using http://mosquitto.org/files/source/mosquitto-1.2.3.tar.gz
FROM ubuntu:precise
MAINTAINER Lex Lapax <lexlapax@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y
#RUN apt-get install zlib1g libssl1.0.0 -y

RUN mkdir -p /usr/local/etc/mosquitto

ADD libmosquitto.so.1 /usr/local/lib/libmosquitto.so.1
ADD mosquitto /usr/local/sbin/mosquitto
ADD mosquitto_pub /usr/local/bin/mosquitto_pub
ADD mosquitto_sub /usr/local/bin/mosquitto_sub
ADD mosquitto_passwd /usr/local/bin/mosquitto_passwd

ADD mosquitto.conf.example /usr/local/etc/mosquitto/mosquitto.conf.example
ADD aclfile.example /usr/local/etc/mosquitto/aclfile.example
ADD pskfile.example /usr/local/etc/mosquitto/pskfile.example
ADD pwfile.example /usr/local/etc/mosquitto/pwfile.example

RUN ln -sf /usr/local/lib/libmosquitto.so.1 /usr/local/lib/libmosquitto.so

RUN /sbin/ldconfig

RUN adduser --system --disabled-password --disabled-login mosquitto
EXPOSE 1883
ENTRYPOINT ["/usr/local/sbin/mosquitto"]
