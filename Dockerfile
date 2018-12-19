FROM ubuntu:18.04

MAINTAINER Koen De Keyser <koen.dekeyser@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

## pre-seed tzdata, update package index, upgrade packages and install needed software
RUN echo "tzdata tzdata/Areas select Europe" > /tmp/preseed.txt; \
    echo "tzdata tzdata/Zones/Europe select Brussels" >> /tmp/preseed.txt; \
    debconf-set-selections /tmp/preseed.txt && \
    apt-get update -q && \
    apt-get install -y --no-install-recommends tzdata

RUN apt-get install -y --no-install-recommends \
      software-properties-common \
      wget \
      fish \
      tmux \
      vim-gnome \
      libtinfo-dev \
      zip \
      unzip \
      net-tools \
      curl \
      sudo \
      man \
      make \
      git \
      gcc \
      g++ \
      ssh \
      python3 \
      python3-venv \
      python3-dev \
      python3-wheel

# Pycharm
ENV PYCHARM_VERSION 2018.3.1
ENV PYCHARM_TGZ pycharm-community-$PYCHARM_VERSION.tar.gz
RUN echo $PYCHARM_TGZ && \
    mkdir -p /opt/pycharm && \
    curl -SL https://download-cf.jetbrains.com/python/$PYCHARM_TGZ | tar xvz --strip-components=1 -C /opt/pycharm

RUN apt-get install -y --no-install-recommends \
      libxkbfile1 \
      libxss1 \
      libxtst6

