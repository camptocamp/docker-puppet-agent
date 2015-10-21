FROM debian:wheezy

MAINTAINER mickael.canevet@camptocamp.com

ENV RELEASE=wheezy
ENV PUPPET_AGENT_VERSION 1.2.7-1${RELEASE}
ENV PATH=/opt/puppetlabs/bin:$PATH

RUN apt-get update \
  && apt-get install -y curl locales-all \
  && curl -O http://apt.puppetlabs.com/puppetlabs-release-pc1-${RELEASE}.deb \
  && dpkg -i puppetlabs-release-pc1-${RELEASE}.deb \
  && rm -rf /var/lib/apt/lists/*

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN apt-get update \
  && apt-get install -y puppet-agent=$PUPPET_AGENT_VERSION \
  && rm -rf /var/lib/apt/lists/*
