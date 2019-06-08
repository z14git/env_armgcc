# Use Ubuntu:16.04 image as parent image
FROM ubuntu:18.04

ENV AUTHOR z14git

# Modify apt-get to aliyun mirror
WORKDIR /repos
RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list

RUN apt-get update
RUN apt-get remove gcc-arm-none-eabi
RUN apt-get autoremove
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:team-gcc-arm-embedded/ppa
RUN apt-get update
RUN apt-get -y install gcc-arm-embedded
RUN apt-get -y install libc6-i386
RUN apt-get -y install python2.7 python-dev python-pip
RUN apt-get -y install libusb-1.0-0 libusb-1.0-0-dev
RUN apt-get -y install python-gtksourceview2
RUN pip install numpy pyserial==2.7 pyusb==1.0.0b2 Pillow
RUN apt-get -y install git

RUN git clone --recursive https://github.com/micropython/micropython.git
