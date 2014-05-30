#!/bin/bash

# PM service
echo "Starting the Puppet master service"
service puppetmaster start

# etcd syncing
PM_IP=`hostname -I`
GWIP=`/sbin/ip route | awk '/default/ { print $3 }'`

echo "Cloning the puppet-modules repo"
git clone git@git.service.consul:~/puppet-modules/ /etc/puppet/modules

echo "Registering PM service with consul"
curl -X PUT -d "{\"ID\": \"puppetmaster1\", \"Name\":\"puppetmaster\", \"Port\":8600}" http://$GWIP:8500/v1/agent/service/register

MI=`curl -s "http://$GWIP:8500/v1/kv/update/puppetmaster" | awk -F "," '{ print $2 }' | cut -d ":" -f 2`
echo "Initial index is $MI"

while [ true ]; do
  echo "Waiting for git update(index higher than $MI)"
  MI=`curl -s "http://$GWIP:8500/v1/kv/update/puppetmaster?index=$MI" | awk -F "," '{ print $2 }' | cut -d ":" -f 2`
  echo "New index is $MI"
  echo "Modules updated. Pulling repo."
  cd /etc/puppet/modules && git pull && cd -
done
