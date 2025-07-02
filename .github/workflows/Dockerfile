FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    vim \
    openssh-server \
    net-tools \
    tzdata

RUN echo "zyuraa" > /etc/hostname

RUN useradd -u 999 -m ptero && echo 'ptero:su zyuraa123' | chpasswd && adduser ptero sudo

RUN echo "root:su zyuraa123" | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd

EXPOSE 22

CMD bash -c "ssh-keygen -A && /usr/sbin/sshd -D"
