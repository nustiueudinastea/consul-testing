FROM ubuntu:12.04
MAINTAINER Alex Giurgiu <alex@giurgiu.io>
# Based on Ben Firshman's image

RUN apt-get update && apt-get install -y curl git wget
RUN curl http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
#RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
RUN echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list
RUN apt-get update
# HACK: https://issues.jenkins-ci.org/browse/JENKINS-20407
RUN apt-get install -y --force-yes jenkins
ADD /bin/docker /usr/bin/docker
# Install jenkins plugins
RUN mkdir /var/run/jenkins && mkdir /root/.jenkins/plugins -p
RUN wget http://updates.jenkins-ci.org/latest/git.hpi -O /root/.jenkins/plugins/git.hpi
RUN wget http://updates.jenkins-ci.org/latest/scm-api.hpi -O /root/.jenkins/plugins/scm-api.hpi
RUN wget http://updates.jenkins-ci.org/latest/git-client.hpi -O /root/.jenkins/plugins/git-client.hpi
ADD /bin/init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh
EXPOSE 8080
CMD ["/tmp/init.sh"]
