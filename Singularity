BootStrap: debootstrap
OSVersion: stretch
MirrorURL:  http://ftp.fr.debian.org/debian/
Include: curl make gcc libsqlite3-dev libc6 libc6-dev libbam-dev libcairo2-dev libpango1.0-dev

%post

	GT_VERSION=1.5.9

    cd /usr/local; curl --fail --silent --show-error --location --remote-name http://genometools.org/pub/genometools-${GT_VERSION}.tar.gz
    cd /usr/local; tar zxf genometools-${GT_VERSION}.tar.gz; rm genometools-${GT_VERSION}.tar.gz
    cd /usr/local/genometools-${GT_VERSION}; make 64bit=yes cairo=no install

%runscript
	exec gt $@

%labels
	Maintainer Biocorecrg
	Version 0.1.0

