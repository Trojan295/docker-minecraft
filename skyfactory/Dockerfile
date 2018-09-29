FROM openjdk:8u121-alpine

RUN apk update && apk add wget

RUN mkdir /app
WORKDIR /app

RUN wget -O /app/FTB.zip https://media.forgecdn.net/files/2481/284/FTBPresentsSkyfactory3Server_3.0.15.zip \
  && unzip FTB.zip && rm /app/FTB.zip \
  && /bin/sh /app/FTBInstall.sh

# accept EULA
RUN echo "eula=true" > eula.txt

EXPOSE 25565
VOLUME ["/app/world"]

ENTRYPOINT ["/bin/sh"]
CMD ["/app/ServerStart.sh"]
