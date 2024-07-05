#!/bin/bash

########################
#
# Author : Gouri Shinde
#
# This script will report the AWS resource usage
#
# Version: v1
#
########################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# list S3 buckets

echo "Print list of s3 buckets : "
aws s3 ls

# list EC2 instances

echo "Print list of EC2 instances : "
aws ec2 describe-instances

# list AWS lambda functions

echo "Print list of lambda functions : "
aws lambda list-functions

# list IAM users

echo "Print list of IAM users : "
aws iam list-users
