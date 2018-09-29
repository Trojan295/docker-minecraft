FROM openjdk:8u121-alpine

RUN apk update && apk add wget

WORKDIR /app
ADD docker-entrypoint.sh /

RUN wget -O /app/FTB.zip https://media.forgecdn.net/files/2620/528/FTBContinuumServer_1.5.2.zip \
  && unzip FTB.zip && rm /app/FTB.zip \
  && /bin/sh /app/FTBInstall.sh \
  && echo "eula=true" > eula.txt

ADD server.properties /app/

EXPOSE 25565
VOLUME ["/app/world"]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/sh", "/app/ServerStart.sh"]
