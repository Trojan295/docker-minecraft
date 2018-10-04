FROM openjdk:8u121-alpine

ARG VERSION

WORKDIR /app/

ADD docker-build.sh docker-entrypoint.sh $VERSION/install.sh /
ADD server.properties /app/

RUN apk update && apk add wget \
    && /bin/sh /docker-build.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/sh", "/app/ServerStart.sh"]

