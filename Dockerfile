FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl wget git build-essential python3 imagemagick ffmpeg \
    ca-certificates bash chromium-browser chromium-driver \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o /usr/local/bin/n && \
    chmod +x /usr/local/bin/n

RUN n 0.12.18 && n 4.9.1 && n 5.12.0 && n 6.17.1 && n 7.10.1 && n 8.17.0 && \
    n 9.11.2 && n 10.24.1 && n 11.15.0 && n 12.22.12 && n 13.14.0 && n 14.21.3 && \
    n 15.14.0 && n 16.20.2 && n 17.9.1 && n 18.20.7 && n 19.9.0 && \
    n 20.19.0 && n 21.6.2 && n 22.14.0 && n 23.10.0 && n 24.3.0 && n prune

RUN npm install -g \
    puppeteer \
    sharp \
    axios \
    node-fetch \
    form-data \
    cheerio \
    ffmpeg-static \
    fluent-ffmpeg \
    moment \
    chalk \
    qrcode-terminal

CMD ["bash", "--login"]
