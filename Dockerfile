FROM noman12/atrociousbot:latest

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
