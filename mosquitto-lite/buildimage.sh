#!/bin/bash
export IMAGENAME=tinymosquitto
export BUILDROOTVER=2013.11


mkdir ~/src
cd ~/src

wget http://buildroot.uclibc.org/downloads/buildroot-$BUILDROOTVER.tar.gz
tar -xzvf buildroot-$BUILDROOTVER.tar.gz
git clone https://github.com/lexlapax/Dockerfiles
cp -r Dockerfiles/mosquitto-lite/package/mosquito buildroot-$BUILDROOTVER/package/
cp Dockerfiles/mosquitto-lite/buildroot.config buildroot-$BUILDROOTVER/.config
cd buildroot-$BUILDROOTVER
make all
# wait a really long time while it builds everything including the toolchain
cd output/images
mkdir extra extra/sbin extra/etc
touch extra/sbin/init extra/etc/resolv.conf
cp root.tar fixup.tar
tar rvf fixup.tar -C extra .

# docker steps
docker import - tinyimage < fixup.tar
cd ../../../Dockerfiles/mosquitto-lite

sed -i.bak -e "s/FROM lapax\/buildroot:mosquitto/FROM tinyimage/g" Dockerfile
sudo docker build -t $IMAGENAME .

