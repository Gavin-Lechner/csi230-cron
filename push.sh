#!/bin/bash

#Constants
AWSHOST="ec2-34-238-154-28.compute-1.amazonaws.com"
AWSUSER="push-web"
LOCALDIR="web-content"

#Change to working dir
cd /root/cron-lab

rsync -e "ssh -i keys/push-web" -vraO --no-perms --delete --chmod=660 --chown=push-web:www-data "${LOCALDIR}/" "${AWSUSER}@${AWSHOST}":

logger -t $0 "web content pushed to ${AWSHOST}"
echo -e "web content pushed to ${AWSHOST}" | sendmail "gavin.lechner@mymail.champlain.edu"
