# download the image from docker
FROM ubuntu:18.04
# Author / Maintainer
MAINTAINER Giovanni Perez

# Install usefull packages for project
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
#CMD ["/bin/sh", "-c", "/qt5pibuilder/build -c"]


