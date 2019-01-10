# download the image from docker
FROM ubuntu:18.04
# Author / Maintainer
MAINTAINER Giovanni Perez

# Install usefull packages for project
RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list
# this command is just temporary, you probably are going to do something else
#
#
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
	build-dep qt5-default \
	bison gperf libicu-dev \
 && rm -rf /var/lib/apt/lists/*

# added Variable
ENV PATH_GCC=/opt/
ENV SYSROOT=/mnt/raspbian/

RUN mkdir -p /opt/gcc-linaro-7.3.0 \
	&& wget -c https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz -P /opt/ -O gcc-linaro-7.3.0.tar.xz \
	| tar -xJC /opt/gcc-linaro-7.3.0 \
 ls -la	



