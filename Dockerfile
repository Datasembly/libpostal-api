FROM libpostal

ENV DEBIAN_FRONTEND noninteractive

COPY ./*.go /libpostal/
COPY ./build_libpostal_api.sh /libpostal/

WORKDIR /libpostal
RUN ./build_libpostal_api.sh

EXPOSE 8080

CMD /libpostal/go/bin/libpostal-api
