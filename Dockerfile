FROM alpine:latest

WORKDIR /usr/src/app
SHELL ["/bin/bash", "-c"]
RUN chmod 777 /usr/src/app

RUN apt-get -y update && DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y apt-utils && DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y python3 python3-pip libglib2.0 libnss3 libgconf-2-4 libfontconfig1 wget \
    tzdata p7zip-full p7zip-rar xz-utils curl pv jq ffmpeg \
    locales git unzip rtmpdump libmagic-dev libcurl4-openssl-dev \
    libssl-dev libc-ares-dev libsodium-dev libcrypto++-dev \
    libsqlite3-dev libfreeimage-dev libpq-dev libffi-dev \	
    && locale-gen en_US.UTF-8


RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install python3
RUN apt-get -y install python3-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN playwright install chromium
RUN playwright install-deps
RUN apt-get update && apt-get upgrade -y
RUN apt -qq update --fix-missing && \
    apt -qq install -y mediainfo
