#
# Git
# 
# VERSION 0.1
# 

FROM ubuntu
MAINTAINER Alex Giurgiu "alex@giurgiu.io"

ADD /bootstrap /tmp/bootstrap/
RUN chmod +x /tmp/bootstrap/bootstrap.sh && /tmp/bootstrap/bootstrap.sh
Add /bin/init.sh /tmp/init.sh

# Setup the init script and puppet modules
RUN chmod +x /tmp/init.sh
RUN git clone --bare --mirror https://github.com/nustiueudinastea/dummy-module.git /home/git/puppet-modules.git
ADD /bin/post-receive.git /home/git/puppet-modules.git/hooks/post-receive
RUN chmod +x /home/git/puppet-modules.git/hooks/post-receive
RUN chown git:git /home/git/puppet-modules.git/ -R
# Fix pam issue
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
CMD ["/bin/bash", "/tmp/init.sh"]
