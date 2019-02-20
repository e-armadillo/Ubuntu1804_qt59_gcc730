# download the image from docker
FROM ubuntu:18.04
# Author / Maintainer
MAINTAINER Giovanni Perez

#RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list

# Usage: ADD [source directory or URL] [destination directory]
ENV GCC_VERSION=7.3.0
ENV SYSROOT=/mnt/raspbian/sysroot
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
# add a whatever volume 

# WORKDIR used to change the working directory
RUN mkdir -p /opt/qt5pibuilder && \
		mkdir -p /mnt/raspbian/sysroot &&\
		mkdir -p /opt/gcc-linaro-$GCC_VERSION
RUN ls -lah && pwd

COPY qt5pibuilder /tmp/qt5pibuilder
WORKDIR /tmp/qt5pibuilder
RUN ls -lah

WORKDIR /mnt/raspbian 
RUN		wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1rsX8h1eSGwRehzPLj-u7aFtsmbpqdrDQ' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1rsX8h1eSGwRehzPLj-u7aFtsmbpqdrDQ" -O sysroot.tar.xz \
	&& rm -rf /tmp/cookies.txt \
	&& tar -kx --xz -f sysroot.tar.xz \
	&& mv rpiSys*/sysroot /mnt/raspbian/sysroot \
	&& set SYSROOT=$PWD \
	&& rm -rf rpiSys* \
	&& rm -rf *.tar.* \
	&& ls -lah
WORKDIR /opt/
#RUN wget https://github.com/gpmontt/CrossCompilerRpi3QT5/releases/download/file_2019-01-16/qt5pibuilder.zip\
	#		&& unzip qt5pi* 	\
	#		&& rm *.zip
#RUN /opt/qt5pibuilder/qt5/bin/qmake -query

WORKDIR /mnt/raspbian/sysroot 
RUN ls -lah &&  pwd
ENV name velo  



