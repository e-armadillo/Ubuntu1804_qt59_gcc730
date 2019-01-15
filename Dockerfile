# download the image from docker
FROM ubuntu:18.04
# Author / Maintainer
MAINTAINER Giovanni Perez

#RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list

COPY sources.list /etc/apt/ 

RUN apt-get update && apt-get install -y \
	build-essential \
	wget \
	curl \
	gdb-multiarch \
	xz-utils \
	git \
	unzip \
	zip \
	multistrap \
	cmake \
	python \
	vim \
	pkg-config \
 && rm -rf /var/lib/apt/lists/*
# add a whatever volume 

VOLUME ["qt5pibuilder"]
# WORKDIR used to change the working directory
WORKDIR /tmp/qt5pibuilder

ENV name velo  
RUN ls -lah


COPY entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh
ENTRYPOINT ["/bin/sh","-c","entrypoint.sh"]

#	build-essential \
#	wget \
#	curl \
	#	git \
	#	unzip \
	#	zip \
	#	multistrap \
	#	cmake \
	#	python \  
	#	pkg-config \
	#	bison \
	# 	gperf \
	#	libicu-dev \
	#	&& rm -rf /var/lib/apt/lists/*


# Usage: ADD [source directory or URL] [destination directory]
