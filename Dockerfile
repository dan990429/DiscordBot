FROM python:3.7-slim
LABEL Name=discordbot Version=0.0.1

ADD requirements.txt /tmp

RUN sed -i 's/deb.debian.org/ftp.kaist.ac.kr/' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/ftp.kaist.ac.kr/' /etc/apt/sources.list

RUN \
    apt-get -y update && \
    apt-get install -y \
        git \
        curl \
        wget

RUN pip3 install -r /tmp/requirements.txt
