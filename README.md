# HDHomeRunEPG

See [HDHomeRunEPG-to-XmlTv](https://github.com/IncubusVictim/HDHomeRunEPG-to-XmlTv) for original Python script to convert HDHomeRun EPG data to XMLTV file.

## Docker

| Tag | Description |
|---|---|
| latest | Stable HDHomeRunEPG releases |
| nightly | HEAD HDHomeRunEPG release |

### Compose

```yaml
services:
  hdhomerunepg:
    image: ghcr.io/ddarnell1/hdhomerunepg:latest
    container_name: hdhomerunepg
    restart: unless-stopped
    network_mode: host
    security_opt:
      - no-new-privileges:true
    environment:
      - OPT_ARGS=--days 14 --host 192.168.0.99 --filename /epg/epg.xml
      - SLEEPTIME=43200 # 12 hours in seconds
    volumes:
      - ${HOME}/docker/jellyfin/epg:/epg
```

## Usage

```
python HDHomeRunEPG_To_XmlTv.py [--help] [--host <HOST>] [--filename <FILENAME>] [--days <DAYS>] [--hours <HOURS>] [--debug <DEBUG>]
```

|      Paramater | Description     |
| -------------: | :-------------- |
| `--help`  | Show the command parameters available. |
| `--host <HOST>`  | The host name or IP address of the HDHomeRun server if different from "hdhomerun.local". |
| `--filename <FILENAME>` | The file path and name of the EPG to be generated. Defaults to epg.xml in the current directory. |
| `--days <DAYS>` | The number of days in the future from now to obtain an EPG for. Defaults to 7 but will be restricted to the maximum number of days the HDHomeRun device will return. |
| `--hours <HOURS>` | The number of hours of guide interation to obtain. Defaults to 3 hours. This is an adavanced option which basically tells the app how many hours to increment for each query to the HDHomeRun device.  Making this too large will mean gaps can appear int he guide, equally making it too small will make the app run longer. Note any duplicate programmes retrieved are ignored anyway. |
| `--debug <DEBUG>` | Switch debug log message on, options are "on", "full" or "off". Defaults to "on". This is usefuly to see the detail of all the programmes being retrieved, but will mak the app take longer to run. |
