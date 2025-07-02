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

RUN useradd -u 999 -m -s /bin/bash fake_root && echo 'fake_root:zyuraa123' | chpasswd && adduser fake_root sudo

USER fake_root

WORKDIR /home/fake_root

CMD ["bash", "--login"]
