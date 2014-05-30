#
# Puppet agent
#

FROM ubuntu:precise
MAINTAINER Alex Giurgiu "alex@giurgiu.io"

RUN apt-get update && apt-get install -y wget dnsmasq git openssh-server
RUN wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb -O /tmp/puppetlabs-release-precise.deb --no-check-certificate
RUN dpkg -i /tmp/puppetlabs-release-precise.deb
RUN apt-get update && apt-get install -y puppet
ADD /conf/puppet.conf /etc/puppet/puppet.conf
RUN mkdir /var/run/sshd
ADD /key/git_test /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh && chown root:root /root/.ssh/id_rsa
RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config
ADD /bin/init.sh /tmp/init.sh

# Setup the test user
RUN useradd -m -p "\$6\$P1XvtD.F\$uyKJEDV32KdxbZcWHg7lLNIu9dNiGmU903Yx1Hnavwch94IAw3Pt42vCRpgoGKwKssdsIiD.JG3T0gQDE6qbc0" jenkins

CMD ["/bin/bash", "/tmp/init.sh"]
