FROM alpine:latest

ENV SLEEPTIME=43200

RUN apk add --no-cache \
  python3 \
  py3-pip \
  pip3 install argparse \
  pip3 install requests \
  && ln -sf python3 /usr/bin/python

WORKDIR /app

COPY HDHomeRunEPG_To_XmlTv.py HDHomeRunEPG_To_XmlTv.py
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
