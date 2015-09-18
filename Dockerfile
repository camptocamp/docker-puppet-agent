FROM debian:wheezy

MAINTAINER mickael.canevet@camptocamp.com

ENV PUPPET_AGENT_VERSION 1.2.4-1wheezy

RUN apt-get update \
  && apt-get install -y curl \
  && curl -O http://apt.puppetlabs.com/puppetlabs-release-pc1-wheezy.deb \
  && dpkg -i puppetlabs-release-pc1-wheezy.deb \
  && apt-get clean

RUN apt-get update \
  && apt-get install -y puppet-agent=$PUPPET_AGENT_VERSION \
  && apt-get clean
