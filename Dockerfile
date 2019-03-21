# download the image from docker
FROM ubuntu:18.04
# Author / Maintainer
MAINTAINER Giovanni Perez

#RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list

# Usage: ADD [source directory or URL] [destination directory]
ENV GCC_VERSION=7.3.1
ENV ARCHCROSS=arm-linux-gnueabihf-
ENV SYSROOT=/mnt/raspbian/sysroot
ENV PATH_GCC=/opt/gcc-linaro-$GCC_VERSION
# Installation of packages used for the compilation of Xcompiler and QT5
COPY sources.list /etc/apt/ 

RUN apt-get update && apt-get install -y \
	build-essential \
	libc6-dev\
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
	pkg-config \
  && rm -rf /var/lib/apt/lists/*

# WORKDIR used to change the working directory
RUN	mkdir -p /mnt/raspbian && mkdir -p $PATH_GCC 

# Environment sysroot for compilation 
COPY qt5pibuilder /opt/qt5pibuilder
WORKDIR /tmp 
#TODO: replace  RUN command by ADD. Files from remote URLs will untar the file into the ADD director
RUN wget -c https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz -P $PATH_GCC -O gcc-linaro-$GCC_VERSION.tar.xz \
	&& tar -kx --xz -f gcc-linaro-$GCC_VERSION.tar.xz \
	&& mv  gcc-linaro-7.3.1-2018*  $PATH_GCC \
	&& rm -rf *.tar.* 

# download sysroot from google drive. TODO: find docker 
RUN /bin/bash -c /opt/qt5pibuilder/getsysroot.sh 


WORKDIR /opt/qt5pibuilder
RUN ls -lah && pwd
RUN /bin/bash -c ./build.sh

#RUN /opt/qt5pibuilder/qt5/bin/qmake -query
