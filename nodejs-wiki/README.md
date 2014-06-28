dockerfile-nodejs-wiki
======================

smallest federated wiki is another revolution in the making

Small Federated Wiki is available at https://github.com/WardCunningham/Smallest-Federated-Wiki and more specifically the nodejs version at https://github.com/fedwiki/wiki-node


this image is based on ubuntu:trusty 

working on a buildroot based image to make the image small enough so that it could be put in small atom based devices .. 
that is a work in progress at https://github.com/lexlapax/dockerfile-nodejs-wiki


run with

docker run -d -P --name wiki lapax/nodejs-wiki 
or to map a static port
docker run -d -p 3000:3000 --name nodewiki lapax/nodejs-wiki


enjoy
