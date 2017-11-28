FROM starlabio/ubuntu-base:1.2
MAINTAINER Derek Straka <derek@starlab.io>

RUN sed -e 's:deb h:deb [arch=amd64] h:' -e 's:deb-src h:deb-src [arch=amd64] h:' -i /etc/apt/sources.list && \
    find /etc/apt/sources.list.d/ -type f -exec sed -e 's:deb h:deb [arch=amd64] h:' -e 's:deb-src h:deb-src [arch=amd64] h:' -i {} \;

# Xen depends
RUN apt-get --quiet --yes update && \
	apt-get --quiet --yes build-dep linux-image-4.4.0-98-generic && \
	apt-get --quiet --yes install pkg-config && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD build-deb.sh /usr/local/bin/build-deb.sh
