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
# 


# quoted from the docker buildroot blog post
#
# You should see a small, lean, rootfs.tar file, containing the image to be imported 
# in Docker. But it’s not quite ready yet. We need to fix a few things. 
# 
# Docker sets the DNS configuration by bind-mounting over /etc/resolv.conf. 
# This means that /etc/resolv.conf has to be a standard file. By default, 
# buildroot makes it a symlink. We have to replace that 
# symlink with a file (an empty file will do). 
# 
# Likewise, Docker “injects” itself within containers by bind-mounting over /sbin/init. 
# This means that /sbin/init should be a regular file as well. By default, 
# buildroot makes it a symlink to busybox. We will change that, too.

mkdir -p output/images/fixup/sbin output/images/fixup/etc 
touch output/images/fixup/sbin/init output/images/fixup/etc/resolv.conf

# while you're at it, add the haproxy samples,. etc.. as well
mkdir -p output/images/fixup/share/haproxy
cp -r output/build/haproxy-$HAPROXY_VERSION/examples output/images/fixup/share/haproxy/
cp -r output/build/haproxy-$HAPROXY_VERSION/VER* output/images/fixup/share/haproxy/


cd output/images
cp root.tar fixup.tar
tar rvf fixup.tar -C fixup .

# docker steps
docker import - $IMAGENAME < fixup.tar

