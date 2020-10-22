#!/usr/bin/bash
# remember to set creds with:
# export creds="--profile myAWSprofile"
aws $creds s3 cp hardening_setup.sh s3://TEST-bucket/test/
aws $creds cloudformation create-stack --stack-name $1 --template-body file://mvp.yaml