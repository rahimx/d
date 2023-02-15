FROM noman12/heroku:latest

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN playwright install chromium
RUN playwright install-deps
RUN apt-get update && apt-get upgrade -y
RUN apt -qq update --fix-missing && \
    apt -qq install -y mediainfo
