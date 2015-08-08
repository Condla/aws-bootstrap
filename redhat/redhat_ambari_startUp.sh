#!/bin/bash

touch ~/this
yum -y update
yum -y upgrade
yum -y install wget

#install ambari
export AMBARI_REPO="http://s3.amazonaws.com/dev.hortonworks.com/ambari/centos7/2.x/BUILDS/2.1.0-1409/ambaribn.repo"
cd /etc/yum.repos.d/
wget $AMBARI_REPO 
yum -y install ambari-server ambari-agent

#disable SELINUX:
sed -i s/SELINUX=enforcing/SELINUXTYPE=disabled/ /etc/sysconfig/selinux
echo "sparky" > /etc/hostname

#configure ambari defaults:
printf '\n\n\n\n\n\n\n\n\n' | ambari-server setup
ambari-server start
ambari-agent start


