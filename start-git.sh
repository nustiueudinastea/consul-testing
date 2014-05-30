#!/bin/bash

EXTIP=`hostname -I | awk '{ print $2 }'`
docker run -d -p $EXTIP:2222:22 --dns 172.17.42.1 consul/git
