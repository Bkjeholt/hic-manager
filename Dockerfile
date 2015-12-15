FROM armv7/armhf-php:cli

MAINTAINER Björn Kjeholt <dev@kjeholt.se>

RUN docker-php-ext-install mysqli && \
    docker-php-ext-install sockets && \
    mkdir /opt/php && \
    mkdir /etc/hic.d && \
    apt-get update && \
    apt-get install -y vim

ENV HIC_MANAGER_IP_ADDR="127.0.0.1" \
    HIC_MANAGER_PORT_NO="37500" \
    HIC_TIME_QUE_SCAN_INTERVALL="30" \
    HIC_FIND_AGENTS_TIME_INTERVALL="600"

COPY php/. /opt/php/
WORKDIR /opt/php
VOLUME /var /opt/php /etc/hic.d

CMD [ "php", "./server.php" ]

