FROM debian:stretch

# File Author / Maintainer
MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu> 

ARG GT_VERSION=1.5.9

RUN apt-get update; 
RUN apt-get install -y curl make gcc libsqlite3-dev libc6 libc6-dev libbam-dev libcairo2-dev libpango1.0-dev;

RUN cd /usr/local; curl --fail --silent --show-error --location --remote-name http://genometools.org/pub/genometools-${GT_VERSION}.tar.gz
RUN cd /usr/local; tar zxf genometools-${GT_VERSION}.tar.gz; rm genometools-${GT_VERSION}.tar.gz
RUN cd /usr/local/genometools-${GT_VERSION}; make 64bit=yes cairo=no install

# Where to store input and output
VOLUME /scratch

# Clean cache
RUN apt-get clean
RUN set -x; rm -rf /var/lib/apt/lists/*
