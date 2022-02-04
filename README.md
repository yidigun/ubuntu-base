# Ubuntu Base Image

## Ubuntu License

See https://ubuntu.com/legal/intellectual-property-policy

## Dockerfile License

It's just free. (Public Domain)

See https://github.com/yidigun/ubuntu-base

## Use Image

This image is a base image with basic tools for runtime debugging.
And do locale (ko_KR.UTF-8) and time zone (Asia/Seoul) setup.

```shell
docker run --rm -it yidigun/ubuntu-base:20.04
```

```dockerfile
FROM docker.io/yidigun/ubuntu-base:20.04
```
