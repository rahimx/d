FROM anasty17/mltb:dev

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
