FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    vim \
    net-tools \
    tzdata \
    bash

RUN echo "zyuraa" > /etc/hostname

RUN useradd -u 999 -m ptero && echo 'ptero:su zyuraa123' | chpasswd && adduser ptero sudo

RUN echo "root:su zyuraa123" | chpasswd

EXPOSE 8080

CMD ["bash", "--login"]
