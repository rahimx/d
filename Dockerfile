FROM alpine:latest

WORKDIR /usr/src/app
SHELL ["/bin/bash", "-c"]

RUN apk-add -y update && DEBIAN_FRONTEND="noninteractive" \
    apk-add install -y apk-utils && DEBIAN_FRONTEND="noninteractive" \
    apk-add install -y python3 python3-pip libglib2.0 libnss3 libgconf-2-4 libfontconfig1 wadd \
    tzdata p7zip-full p7zip-rar xz-utils curl pv jq ffmpeg \
    locales git unzip rtmpdump libmagic-dev libcurl4-openssl-dev \
    libssl-dev libc-ares-dev libsodium-dev libcrypto++-dev \
    libsqlite3-dev libfreeimage-dev libpq-dev libffi-dev \	
    && locale-gen en_US.UTF-8


RUN apk-add -y update
RUN apk-add -y upgrade
RUN apk-add -y install python3
RUN apk-add -y install python3-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN playwright install chromium
RUN playwright install-deps
RUN apk-add update && apk-add upgrade -y
RUN apk -qq update --fix-missing && \
    apk -qq install -y mediainfo
