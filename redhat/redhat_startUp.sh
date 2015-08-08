#!/bin/bash

touch ~/this
export AMBARI_REPO="http://s3.amazonaws.com/dev.hortonworks.com/ambari/centos7/2.x/BUILDS/2.1.0-1409/ambaribn.repo"
yum -y update
yum -y upgrade
yum -y install wget
cd /etc/yum.repos.d/
wget $AMBARI_REPO 
yum -y install ambari-server ambari-agent
