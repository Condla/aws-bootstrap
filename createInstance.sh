#/bin/bash
FILE="ubuntu14.4_HomeAccess_littlefinger.json"
COMMAND="aws ec2 run-instances --cli-input-json file://$FILE "
echo "executing: $COMMAND"
$COMMAND

echo "waiting for the machine booting!"
sleep 10

ipaddresses=$(aws ec2 describe-instances | grep PublicIpAddress | sed s/PublicIpAddress// | sed s/\"//g | sed s/\ //g | sed s/,//g | sed s/://g)
echo "In a few moments try to connect to your machine(s)!"
for ipaddress in $ipaddresses
    do echo "ssh ec2-user@$ipaddress"
done
