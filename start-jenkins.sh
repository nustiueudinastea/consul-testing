#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
EXTIP=`hostname -I | awk '{ print $2 }'`
docker run -d -p $EXTIP:8080:8080 -v $SCRIPTPATH/volumes/jenkins/jobs/:/root/.jenkins/jobs/ consul/jenkins
