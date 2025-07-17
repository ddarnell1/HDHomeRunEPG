FROM alpine:latest

ENV SLEEPTIME=43200
ENV HOST=192.168.68.192

RUN apk add --no-cache \
  python3 \
  py3-pip \
  pip3 install argparse \
  pip3 install requests \
  && ln -sf python3 /usr/bin/python

WORKDIR /app

COPY zap2xml.pl zap2xml.pl
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
