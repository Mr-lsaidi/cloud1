#!/bin/bash

chmod 400 *.pem 
export AWS_ACCESS_KEY_ID=AKIAVH6C25CQBSLECWBP
export AWS_SECRET_ACCESS_KEY=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
export AWS_DEFAULT_REGION=us-east-1

echo "plugin: aws_ec2
regions:
  - <region>
filters:
  tag:<tag_key>:
    - <tag_value>" > ./aws_ec2.yml

read -p "Your option       : "  option
read -p "Your region       : "  region
read -p "Your ec2 tag key  : " tag_key
read -p "Your ec2 tag value: " tag_value

if [ -z "$option" ]
then
    echo "empty option input"
else
    if [ -z "$region" ]
    then
        echo "empty region input"
    else
        if [ -z "$tag_key" ]
        then
            echo "empty tag key input"
        else
            if [ -z "$tag_value" ]
            then
                echo "empty tag value input"
            else
                sed -i "s/<region>/$region/g" ./aws_ec2.yml
                sed -i "s/<tag_key>/$tag_key/g" ./aws_ec2.yml
                sed -i "s/<tag_value>/$tag_value/g" ./aws_ec2.yml
                echo "Set AWS dynamic inventory variables"
                if [ "$option" == "ping" ]
                then
                    ansible aws_ec2 -m ping -u ubuntu --private-key=ec2-cloud-1.pem
                elif [ "$option" == "deploy" ]
                then
                    ansible-playbook playbook.yml -u ubuntu --private-key=ec2-cloud-1.pem --ask-vault-pass
                else
                    echo "USAGE : sh run.sh [ping/deploy]\n
                * ping: for ping on server
                * deploy: for start playbook and deploy server\n"
                fi
            fi 
        fi 
    fi
    
fi
