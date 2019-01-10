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
	vim \  # this  could be gone
	pkg-config \
	build-dep qt5-default \
  libxcb-xinerama0-dev \
  bison gperf libicu-dev \
 && rm -rf /var/lib/apt/lists/*

# added Variable
ENV PATH_GCC=/opt/
ENV SYSROOT=/tmp/workspace/sysroot

VOLUME ["$PATH_GCC"] 
WORKDIR  $PATH_GCC 
RUN wget -c https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz -P $PATH_GCC -O gcc-linaro-$GCC_VERSION.tar.xz
	tar -kx --xz -f gcc-li*.tar.xz
RUN ls -la \
	pwd


VOLUME ["/opt/qt5pibuilder"]
WORKDIR /opt/qt5pibuilder
RUN wget https://github.com/gpmontt/CrossCompilerRpi3QT5/releases/download/file_2018-12-18/qt5pibuilder.zip 

# download the sysroot need to the compilation.
#VOLUME ["/mnt/raspbian/rpiSysroot-2018-06-27-raspbian-stretch-lite-updated/sysroot"]
#RUN \
	#wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1rsX8h1eSGwRehzPLj-u7aFtsmbpqdrDQ' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1rsX8h1eSGwRehzPLj-u7aFtsmbpqdrDQ" -O sysroot.tar.xz && rm -rf /tmp/cookies.txt \



# WORKDIR used to change the working directory
WORKDIR /tmp/qt5pibuilder


#ENV name velo  
#CMD ["/bin/sh", "-c", "/qt5pibuilder/build -c"]


