#!/bin/bash

IMG_PATH=./

if [ "$1" != "puppetmaster" ] && [ "$1" != "puppetagent" ] && [ "$1" != "jenkins" ] && [ "$1" != "git" ] && [ "$1" != "puppetvalidation" ]
  then
    echo "Which image do you want to build?" 
    echo "$0 <puppetmaster/puppetagent/jenkins/git/puppetvalidation>"
    exit 1;
fi

docker build -t consul/$1 ./dockerfiles/$1/
