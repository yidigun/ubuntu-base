# Ubuntu Base Image

Ubuntu base image for your awesome images.

## Ubuntu License

See https://ubuntu.com/legal/intellectual-property-policy

## Dockerfile License

It's just free. (Public Domain)

See https://github.com/yidigun/ubuntu-base

## Supported tags

* ```20.04```, ```focal-20220801```, ```focal``` (not supported)
* ```22.04```, ```jammy-20220801```, ```jammy```, ```latest```, ```rolling```
* ```22.10```, ```kinetic-20220801```, ```kinetic```, ```devel```
 
## Changelog

* 2022-02-18 - Change default locale to en_US.UTF-8, timezone to UTC

## Use Image

This image is a base image with basic tools for runtime debugging.
And do locale (ko_KR.UTF-8) and time zone (Asia/Seoul) setup.

```shell
docker run --rm -it yidigun/ubuntu-base:20.04
```

```dockerfile
FROM docker.io/yidigun/ubuntu-base:20.04
```

To change locale or timezone use following codes.

```dockerfile
ARG LANG=en_US.UTF-8
ARG TZ=UTC

ENV LANG=$LANG
ENV TZ=$TZ

RUN locale-gen $LANG && \
    update-locale LANG=$LANG && \
    [ -n "$TZ" -a -f /usr/share/zoneinfo/$TZ ] && \
      ln -sf /usr/share/zoneinfo/$TZ /etc/localtime
```
