#!/bin/bash -ex

export AMBARI_REPO="http://s3.amazonaws.com/dev.hortonworks.com/ambari/ubuntu12/2.x/BUILDS/2.1.0-1409/ambaribn.list "
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install wget
cd /etc/apt/sources.list.d
sudo wget $AMBARI_REPO 
sudo apt-get -y install ambari-server ambari-agent
