FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends --fix-missing tar unzip unrar

COPY . /app

RUN unzip Linux_Week5_Lab.zip && mv /app/auto-uncompressing.sh /app/Linux_Week5_Lab/auto-uncompressing.sh
