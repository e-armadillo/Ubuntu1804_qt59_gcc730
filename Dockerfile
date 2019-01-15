# download the image from docker
FROM ubuntu:18.04
# Author / Maintainer
MAINTAINER Giovanni Perez

# Install usefull packages for project
#RUN sed -i 's/main/main contrib/g' /etc/apt/sources.list
# this command is just temporary, you probably are going to do something else
#
COPY sources.list /etc/apt/ 

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh
ENTRYPOINT ["/bin/sh","-c","entrypoint.sh"]

RUN apt-get update 
RUN apt-get install -y \
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
	bison gperf libicu-dev \
	&& rm -rf /var/lib/apt/lists/*


# Usage: ADD [source directory or URL] [destination directory]
