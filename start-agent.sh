#!/bin/bash

if [ $# -eq 0 ]
then
  echo "Usage: $0 <container-hostname>"
  exit 1
fi

HOSTNAME=$1

echo Starting client $HOSTNAME
docker run -t -i -h $HOSTNAME --dns 172.17.42.1  consul/puppetagent /bin/bash
