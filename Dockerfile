FROM noman12/atrociousbot

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 uninstall --no-cache-dir -r requirements.txt
