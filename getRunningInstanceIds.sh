#/bin/bash

aws ec2 describe-instances | grep InstanceId | sed s/\ //g | sed s/\"//g | sed s/InstanceId:// | sed s/,//
#cat testfile.txt | grep InstanceId | sed s/\ //g | sed s/\"//g | sed s/InstanceId:// | sed s/,//
