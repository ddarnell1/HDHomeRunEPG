FROM alpine:latest

RUN apk add --no-cache \
  python3 \
  py3-pip \
  py3-configargparse \
  py3-requests

ENV SLEEPTIME=43200

WORKDIR /app

COPY HDHomeRunEPG_To_XmlTv.py HDHomeRunEPG_To_XmlTv.py
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
