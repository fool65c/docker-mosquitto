from ubuntu:16.04

ENV DEBIAN_FRONTEND="noninteractive"
ENV MOSQUITTO_VERSION=1.4.9
ENV MOSQUITTO_LOCATION="http://mosquitto.org/files/source/mosquitto-${MOSQUITTO_VERSION}.tar.gz"

RUN apt-get update
RUN apt-get install -y \
	build-essential \
	libwrap0-dev \
	libssl-dev \
	libc-ares-dev \
	uuid-dev xsltproc \
	wget

RUN cd /var/tmp \
	&& wget ${MOSQUITTO_LOCATION} -O mosquitto.tgz \
  && tar -xzvf mosquitto.tgz

RUN cd /var/tmp/mosquitto-${MOSQUITTO_VERSION} \
    && make \
    && make install

# add the bind use
# create mosquitto user
RUN useradd --system --uid 1000 -M --shell /usr/sbin/nologin mosquitto

# docker volumes
VOLUME /config

# expose mosquitto ports
EXPOSE 8883

add mosquitto.conf /etc/mosquitto/mosquitto.conf

USER mosquitto

CMD ["mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]


