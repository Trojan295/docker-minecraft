FROM openjdk:8u121-alpine

RUN apk update && apk add wget

WORKDIR /app
ADD docker-entrypoint.sh /

RUN wget -O /app/server.zip https://media.forgecdn.net/files/2570/735/SevTech_Ages_Server_3.0.8.zip \
  && unzip server.zip && rm /app/server.zip \
  && /bin/sh /app/Install.sh \
  && echo "eula=true" > eula.txt

ADD server.properties /app/

EXPOSE 25565
VOLUME ["/app/world"]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/sh", "/app/ServerStart.sh"]
