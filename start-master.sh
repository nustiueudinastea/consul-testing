#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
EXTIP=`hostname -I | awk '{ print $2 }'`
docker run -d -p $EXTIP:8140:8140 --dns 172.17.42.1 -v $SCRIPTPATH/manifests:/etc/puppet/manifests consul/puppetmaster
