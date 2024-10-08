ARG IMG_TAG=latest
FROM docker.io/library/ubuntu:${IMG_TAG}

ARG IMG_NAME
ARG IMG_TAG
ARG LANG=en_US.UTF-8
ARG TZ=Etc/UTC

ENV IMG_NAME=$IMG_NAME
ENV IMG_TAG=$IMG_TAG
ENV LANG=$LANG
ENV TZ=$TZ

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive \
      apt-get -y install locales tzdata iproute2 net-tools telnet \
                         traceroute iputils-ping lsof psmisc curl && \
    apt-get clean

RUN locale-gen $LANG && \
    update-locale LANG=$LANG && \
    [ -n "$TZ" -a -f /usr/share/zoneinfo/$TZ ] && \
      ln -sf /usr/share/zoneinfo/$TZ /etc/localtime
