# Version: 0.0.1

# Initial base is from the resin rpi-raspbian image.

FROM resin/rpi-raspbian
MAINTAINER R. Cody Erben
ENV REFRESHED_AT 2016-02-05

RUN echo 'deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi' >> /etc/apt/sources.list

# Update the apt cache, install git, and
# then pull the build dependencies for rtl-sdr.

RUN apt-get update && apt-get -y upgrade && \
  apt-get -y install darkice alsa-utils nano && \
  apt-get clean

RUN rm -rf /var/lib/apt/lists/* && \
    rm -f /var/cache/apt/archives/*.deb && \
    rm -f /var/cache/apt/archives/partial/*.deb && \
    rm -f /var/cache/apt/*.bin

ADD darkice.cfg /etc/darkice.cfg
