#!/bin/bash
export IMAGENAME=tinyhaproxy
export BUILDROOTVER=2013.11
export HAPROXY_VERSION=1.4.24


mkdir ~/src
cd ~/src

wget http://buildroot.uclibc.org/downloads/buildroot-$BUILDROOTVER.tar.gz
tar -xzvf buildroot-$BUILDROOTVER.tar.gz
git clone https://github.com/lexlapax/Dockerfiles
cp -r Dockerfiles/tiny-haproxy/package/haproxy buildroot-$BUILDROOTVER/package/
cp Dockerfiles/tiny-haproxy/buildroot.config buildroot-$BUILDROOTVER/.config
cd buildroot-$BUILDROOTVER
make all
# wait a really long time while it builds everything including the toolchain
mkdir -p output/images/fixup/sbin output/images/fixup/etc output/images/fixup/share/haproxy
cp -r output/build/haproxy-$HAPROXY_VERSION/examples output/images/fixup/share/haproxy/
cp -r output/build/haproxy-$HAPROXY_VERSION/VER* output/images/fixup/share/haproxy/

touch output/images/fixup/sbin/init output/images/fixup/etc/resolv.conf

cd output/images
cp root.tar fixup.tar
tar rvf fixup.tar -C fixup .

# docker steps
docker import - $IMAGENAME < fixup.tar

