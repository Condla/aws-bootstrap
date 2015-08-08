#!/bin/bash -ex
touch ~/this
export AMBARI_REPO="http://s3.amazonaws.com/dev.hortonworks.com/ambari/ubuntu12/2.x/BUILDS/2.1.0-1409/ambaribn.list "
apt-get -y update
apt-get -y upgrade
apt-get -y install wget
cd /etc/apt/sources.list.d
wget $AMBARI_REPO 
apt-get -y install ambari-server ambari-agent
