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

RUN mkdir -p /sshkeys && \
    ssh-keygen -t rsa -f /sshkeys/ssh_host_rsa_key -N "" && \
    ssh-keygen -t ecdsa -f /sshkeys/ssh_host_ecdsa_key -N "" && \
    ssh-keygen -t ed25519 -f /sshkeys/ssh_host_ed25519_key -N ""

RUN mkdir -p /var/run/sshd

EXPOSE 22

CMD bash -c "mkdir -p /etc/ssh && cp /sshkeys/* /etc/ssh/ && /usr/sbin/sshd -D"
