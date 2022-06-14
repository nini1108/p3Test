#!bin/bash

aws s3api create-bucket \
    --bucket p3test0615 \
    --region ap-southeast-2 \
    --create-bucket-configuration LocationConstraint=ap-southeast-2 \
    --acl public-read