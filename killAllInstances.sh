#/bin/bash

read -r -p "!Attention! All your AWS instances will be terminated! Are you sure? [y/[N]] " response
response=${response,,}    # tolower
if [[ $response =~ ^(yes|y)$ ]]
    then
    read -r -p "Are you really sure? [y/[N]] " response
    response=${response,,}    # tolower
    if [[ $response =~ ^(yes|y)$ ]]
        then
        instancesToTerminate=$(./getRunningInstanceIds.sh)
        echo "Terminating instances: "
        echo $instancesToTerminate
        aws ec2 terminate-instances --instance-ids $instancesToTerminate
    else
        echo 'aborted'
    fi
else
    echo 'aborted'
fi

