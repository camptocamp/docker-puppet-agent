FROM debian:wheezy

MAINTAINER mickael.canevet@camptocamp.com

ENV PUPPET_AGENT_VERSION 1.2.4-1wheezy
ENV PATH=/opt/puppetlabs/bin:$PATH

RUN apt-get update \
  && apt-get install -y curl locales-all \
  && curl -O http://apt.puppetlabs.com/puppetlabs-release-pc1-wheezy.deb \
  && dpkg -i puppetlabs-release-pc1-wheezy.deb \
  && apt-get clean

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN apt-get update \
  && apt-get install -y puppet-agent=$PUPPET_AGENT_VERSION \
  && apt-get clean
