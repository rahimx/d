FROM ubuntu:latest

WORKDIR /usr/src/app
SHELL ["/bin/bash", "-c"]
RUN chmod 777 /usr/src/app

RUN apt-get -y update
RUN apt-get -y install python3
RUN apt-get -y install python3-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN playwright install chromium
RUN playwright install-deps
RUN apt -qq install -y mediainfo
