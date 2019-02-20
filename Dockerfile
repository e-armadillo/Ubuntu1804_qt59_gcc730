# download the image from docker
FROM ubuntu:18.04
# Author / Maintainer
MAINTAINER Giovanni Perez

#RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list

# Usage: ADD [source directory or URL] [destination directory]
ENV GCC_VERSION=7.3.1
ENV ARCHCROSS=arm-linux-gnueabihf-
ENV SYSROOT=/mnt/raspbian/sysroot
ENV PATH_GCC=/opt/gcc-linaro-7.3.1
# Installation of packages used for the compilation of Xcompiler and QT5
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
	pkg-config \
  && rm -rf /var/lib/apt/lists/*

# WORKDIR used to change the working directory
RUN	mkdir -p /mnt/raspbian && mkdir -p $PATH_GCC

COPY qt5pibuilder /tmp/qt5pibuilder
WORKDIR /tmp/qt5pibuilder
RUN ls -lah

# Environment sysroot for compilation 
WORKDIR /tmp 
RUN wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1rsX8h1eSGwRehzPLj-u7aFtsmbpqdrDQ' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1rsX8h1eSGwRehzPLj-u7aFtsmbpqdrDQ" -O sysroot.tar.xz \
	&& rm -rf /tmp/cookies.txt \
	&& tar -kx --xz -f sysroot.tar.xz \
	&& mv rpiSys*/sysroot /mnt/raspbian/ \
	&& rm -rf rpiSys* \
	&& rm -rf *.tar.* \
	&& ls -lah \
	&& pwd
RUN wget -c https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz -P $PATH_GCC -O gcc-linaro-$GCC_VERSION.tar.xz \
	&& tar -kx --xz -f gcc-linaro-$GCC_VERSION.tar.xz \
	&& mv  gcc-linaro-7.3.1-2018*  $PATH_GCC \
	&& rm -rf *.tar.* 
RUN ls -lah &&  pwd

#Prepare gcc-linaro
#WORKDIR /tmp
#RUN wget https://github.com/gpmontt/CrossCompilerRpi3QT5/releases/download/file_2019-01-16/qt5pibuilder.zip \
	#			&& unzip qt5pi* 	\
	#			&& rm *.zip
#RUN /opt/qt5pibuilder/qt5/bin/qmake -query
