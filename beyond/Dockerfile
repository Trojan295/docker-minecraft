FROM openjdk:8u121

RUN apt-get update && apt-get install -y wget

RUN mkdir /app
WORKDIR /app

RUN wget -O /app/FTB.zip https://addons-origin.cursecdn.com/files/2439/681/FTBBeyondServer_1.10.0.zip \
  && unzip FTB.zip && rm /app/FTB.zip \
  && /bin/bash /app/FTBInstall.sh

# accept EULA
RUN echo "eula=true" > eula.txt

EXPOSE 25565
VOLUME ["/app/world"]

ENTRYPOINT ["/bin/bash"]
CMD ["/app/ServerStart.sh"]
