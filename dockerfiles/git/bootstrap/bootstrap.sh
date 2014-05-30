#!/bin/bash
BASE_DIR=/tmp/bootstrap/
HOME=/home/git
PUBKEY=git_test.pub

# making sure script aborts if a command fails
set -e

# INSTALL PKG's
apt-get update
apt-get install git openssh-server apt-utils dnsmasq python-pip gcc python-dev git curl libssl-dev -y

# Setup environment
mkdir /var/run/sshd
adduser --gecos "" --disabled-password git
cd $HOME
mkdir $HOME/.ssh && mv $BASE_DIR/$PUBKEY $HOME/.ssh/authorized_keys
chown git:git \.* -R && chgrp root .ssh && chmod 700 .ssh && chmod 600 .ssh/authorized_keys
locale-gen en_US.UTF-8 en_US
update-locale en_US.UTF-8 en_US
