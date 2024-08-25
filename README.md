# Ubuntu Base Image

Ubuntu base image for your awesome images.

## Ubuntu License

See https://ubuntu.com/legal/intellectual-property-policy

## Dockerfile License

It's just free. (Public Domain)

See https://github.com/yidigun/ubuntu-base

## Supported OS/Arch

* ```linux/amd64```
* ```linux/arm64```

## Supported tags

* ```20.04```, ```focal-20240530```, ```focal```
* ```22.04```, ```jammy-20240808```, ```jammy``` (amd64 only)
* ```24.04```, ```noble-20240801```, ```noble```, ```latest```, ```rolling```
* ```24.10```, ```oracular-20240811.1```, ```oracular```, ```devel```

## Changelog

* 2024-08-25 - Add 24.04 LTS support
* 2022-02-18 - Change default locale to en_US.UTF-8, timezone to UTC

## Use Image

This image is a base image with basic tools for runtime debugging.
And set default locale (en_US.UTF-8) and time zone (UTC) setup.

```shell
docker run --rm -it yidigun/ubuntu-base:24.04
```

```dockerfile
FROM docker.io/yidigun/ubuntu-base:24.04
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
