# zap2xml

See [HDHomeRunEPG-to-XmlTv](https://github.com/IncubusVictim/HDHomeRunEPG-to-XmlTv) for original Python script to convert HDHomeRun EPG data to XMLTV file.

## Docker

| Tag | Description |
|---|---|
| latest | Stable zap2xml releases |
| nightly | HEAD zap2xml release |

### Compose

```yaml
services:
  hdhomerunepg:
    image: ghcr.io/ddarnell1/HDHomeRunEPG:latest
    container_name: hdhomerunepg
    restart: unless-stopped
    environment:
      - OPT_ARGS=-I -D -C /config/hdhomerunepg.conf
      - SLEEPTIME=43200 # 12 hours in seconds
      - TZ=America/Denver
    volumes:
      - ./config:/config
      - {$HOME}/docker/jellyfin/epg:/epg

```
