FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y autoconf automake build-essential curl git libsnappy-dev libtool pkg-config

RUN git clone https://github.com/openvenues/libpostal -b $COMMIT

COPY ./*.go /libpostal/
COPY ./*.sh /libpostal/

WORKDIR /libpostal
RUN ./build_libpostal.sh
RUN ./build_libpostal_api.sh

EXPOSE 8080

CMD /libpostal/go/bin/libpostal-api
