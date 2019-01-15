#!/bin/sh 

myname="gio bio"


/bin/sh -c " echo Hello World $myname"
mkdir -p /tmp/workspace/
cd /tmp/workspace

# download  sysroot image from raspberrypi3 

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1rsX8h1eSGwRehzPLj-u7aFtsmbpqdrDQ' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1rsX8h1eSGwRehzPLj-u7aFtsmbpqdrDQ" -O sysroot.tar.xz && rm -rf /tmp/cookies.txt


# Download  gcc-linaro-7.3.0

gcc-linaro-$GCC_VERSION.1-2018.05-x86_64_arm-linux-gnueabihf/bin
