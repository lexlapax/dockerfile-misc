# minimal image to support just the runtime for mosquitto
# file is using http://mosquitto.org/files/source/mosquitto-1.2.3.tar.gz
# built using buildroot following instructions from
# http://blog.docker.io/2013/06/create-light-weight-docker-containers-buildroot
# instructions at https://github.com/lexlapax/Dockerfiles/tree/master/mosquitto-lite

FROM lapax/buildroot:mosquitto
MAINTAINER Lex Lapax <lexlapax@gmail.com>

RUN adduser -S -H -D -s /bin/false mosquitto
EXPOSE 1883
ENTRYPOINT ["/usr/sbin/mosquitto"]
