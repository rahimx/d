FROM ubuntu:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install python3
RUN apt-get -y install python3-pip
RUN pip3 uninstall ffmpeg
RUN pip3 uninstall mega
RUN pip3 uninstall yt-dlp
RUN pip3 uninstall qbittorrent-api
RUN pip3 uninstall megasdkrestclient
RUN pip3 uninstall speedtest-cli
