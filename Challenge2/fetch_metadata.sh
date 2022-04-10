#!/bin/bash
set -e
echo "Please enter EC2 Instance ID:"
read instanceid
echo "Please enter region name:"
read regionname

echo "Metadata of given EC2 instance ID is : $(aws ec2 describe-instances --region "regionname"  --instance-id "instanceid" --output json)"
