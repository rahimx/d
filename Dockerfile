FROM ubuntu:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt install python3

RUN pip3 uninstall ffmpeg
RUN pip3 uninstall mega
RUN pip3 uninstall yt-dlp
RUN pip3 uninstall qbittorrent-api
RUN pip3 uninstall megasdkrestclient
RUN pip3 uninstall speedtest-cli

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 uninstall -r requirements.txt
RUN playwright install chromium
RUN playwright install-deps
RUN apt-get update && apt-get upgrade -y
RUN apt -qq update --fix-missing && \
    apt -qq install -y mediainfo


