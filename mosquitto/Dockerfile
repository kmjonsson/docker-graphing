FROM ubuntu:15.10

MAINTAINER fot@fot.nu

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates apt-transport-https

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 77B7346A59027B33C10CAFE35E64E954262C4500 && \
    echo "deb http://ppa.launchpad.net/mosquitto-dev/mosquitto-ppa/ubuntu wily main" > /etc/apt/sources.list.d/mosquitto.list && \
    apt-get update && apt-get install -y mosquitto

EXPOSE 1883

VOLUME ["/etc/mosquitto","/var/log/mosquitto","/var/lib/mosquitto"]

USER mosquitto

ENV MOSQUITTO_CONF /etc/mosquitto/mosquitto.conf
CMD /usr/sbin/mosquitto -c "$MOSQUITTO_CONF"
