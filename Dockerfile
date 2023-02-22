FROM noman12/atrociousbot

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN pip3 uninstall speedtest-cli
RUN pip3 uninstall qbittorrent-api
RUN pip3 uninstall yt-dlp
RUN pip3 uninstall mega
RUN pip3 uninstall mega.py
RUN pip3 uninstall megasdkrestclient
RUN pip3 uninstall ffmpeg
RUN pip3 uninstall ffmpeg-python
RUN pip3 uninstall python-ffmpeg



