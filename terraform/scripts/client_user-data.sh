#!/usr/bin/env bash

yum update -y
yum upgrade -y

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum-config-manager --enable epel

yum install -y fping

fping -c 128 -e -r 3 -s -u -f /tmp/master_ips.txt &> /tmp/fping_results.txt

AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone/)
aws s3 cp /tmp/fping_results.txt s3://rmx-vpn-stats-012927997223/${AZ}/fping_results.txt

shutdown now
