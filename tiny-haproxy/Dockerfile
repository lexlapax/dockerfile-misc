# minimal image to run haproxy

FROM tinyhaproxy
MAINTAINER Lex Lapax <lexlapax@gmail.com>

RUN adduser -S -H -D -s /bin/false haproxy
EXPOSE 80
CMD ["/usr/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg"]
CMD ["/bin/sh", "-l"]
