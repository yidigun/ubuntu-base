ARG IMG_TAG
FROM docker.io/library/ubuntu:${IMG_TAG}

ARG IMG_NAME
ARG LANG=ko_KR.UTF-8
ARG TZ=Asia/Seoul

ENV IMG_NAME=$IMG_NAME
ENV IMG_TAG=$IMG_TAG
ENV LANG=$LANG
ENV TZ=$TZ

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive \
      apt-get -y install locales tzdata iproute2 net-tools telnet \
                         traceroute iputils-ping lsof psmisc && \
    if [ -n "$LANG" ]; then \
          eval `echo $LANG | \
            sed -E -e 's/([a-z]+_[a-z]+)\.([a-z0-9_-]+)/localedef -cf\2 -i\1 \1.\2/i'`; \
    fi; \
    if [ -n "$TZ" -a -f /usr/share/zoneinfo/$TZ ]; then \
          ln -sf /usr/share/zoneinfo/$TZ /etc/localtime; \
    fi; \
    apt-get clean