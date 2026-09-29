FROM python:3.11-slim

RUN apt-get update && apt-get install -y wget unzip

WORKDIR /app

RUN wget "https://github.com/kzyowo-del/miyooluraph/raw/main/deob_Luraph_v15Full.zip" -O deob.zip && \
    unzip deob.zip && rm deob.zip

COPY . .

RUN cd deobf && python3 deobf/deob.py /app/input.lua -o /app/output_clean.lua 2>&1 || true

CMD ["cat", "output_clean.lua"]
