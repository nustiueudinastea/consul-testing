#
# Puppet agent
#

FROM ubuntu:precise
MAINTAINER Alex Giurgiu "alex@giurgiu.io"

RUN apt-get update && apt-get install -y wget curl git
RUN wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb -O /tmp/puppetlabs-release-precise.deb --no-check-certificate
RUN dpkg -i /tmp/puppetlabs-release-precise.deb
RUN apt-get update && apt-get install -y puppet
ADD /conf/puppet.conf /etc/puppet/puppet.conf

# Helper scripts
ADD /bin/init.sh /tmp/init.sh
