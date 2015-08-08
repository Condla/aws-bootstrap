#/bin/bash
#FILE="ubuntu14.4_HomeAccess_littlefinger.json"a
#AWSFILE=$1
#JSONFILE=$2
AWSFILE="ubuntu14.4_HomeAccess_littlefinger.json"
STARTFILE="ubuntu_startup.sh"
COMMAND="aws ec2 run-instances --cli-input-json file://$AWSFILE --user-data file://$STARTFILE"
echo "executing: $COMMAND"
$COMMAND

echo "waiting for the machine booting!"
#sleep to wait until public ip address is assigned to machine...
sleep 10

ipaddresses=$(aws ec2 describe-instances | grep PublicIpAddress | sed s/PublicIpAddress// | sed s/\"//g | sed s/\ //g | sed s/,//g | sed s/://g)
echo "In a few moments try to connect to your machine(s)!"
echo "These machines are running at the moment"
for ipaddress in $ipaddresses
    do echo "ssh ec2-user@$ipaddress"
done
