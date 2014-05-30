#!/bin/bash

# etcd syncing
IP=`hostname -I`
GWIP=`/sbin/ip route | awk '/default/ { print $3 }'`

echo "Refreshing Jenkins address in consul"
curl -s -X PUT -d "{\"ID\": \"jenkins-puppet\", \"Name\":\"jenkins\", \"Port\":8080}" http://$GWIP:8500/v1/agent/service/register

java -jar /usr/share/jenkins/jenkins.war
