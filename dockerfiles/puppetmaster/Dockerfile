#
# Puppet Master
#

FROM ubuntu:precise
MAINTAINER Alex Giurgiu "alex@giurgiu.io"

# Basic packages
RUN apt-get update && apt-get install -y wget curl git python-pip gcc python-dev dnsmasq
# Install puppet
RUN wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb -O /tmp/puppetlabs-release-precise.deb --no-check-certificate
RUN dpkg -i /tmp/puppetlabs-release-precise.deb
RUN apt-get update && apt-get install -y puppetmaster
# Copy the private key required to access the git repo
ADD /key/git_test /root/.ssh/id_rsa
ADD /conf/config.ssh /root/.ssh/config
RUN chmod 700 /root/.ssh && chown root:root /root/.ssh/id_rsa
RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config
# Setup the init scripts 
ADD /bin/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh
ADD /conf/puppet.conf /etc/puppet/puppet.conf
CMD ["/tmp/init.sh"]
