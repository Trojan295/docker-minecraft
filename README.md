# Minecraft servers
This repository containes Docker builds for a few popular modpacks. All Docker images have also [rcon-cli](https://github.com/itzg/rcon-cli) for server console access embedded.

#### Supported modpacks
- FTB SkyFactory 3
- FTB Continuum
- SevTech: Ages

## Building
Only one Dockerfile is used to build all the server images. To build a image with a specific modpack you need to define the `VERSION` build arg, which should be the directory with the `install.sh` of the mod. This file contains the installation procedure for a specific modpacks server. General steps are defined in `docker-build.sh`.

Eg. to build the SevTech: Ages server
```
docker build --build-arg VERSION=sevtech_ages -t trojan295/minecraft-server:sevtech
```

# Running a Minecraft Server
To run a server:
```
docker run -d -p 25565:25565 trojan295/minecraft-server:<TAG>
```

To persist the world, backups, op list, whitelist and banned list mount a volume under  `/data`:
```
docker run -d -p 25565:25565 -v mc-world-data:/app trojan295/minecraft-server:<TAG>
```

# Configuration

The following environment variables can be used to configure parameters in `server.properties`.

**MINECRAFT_PVP** - enable PVP mode, default `true`
**MINECRAFT_MOTD** - message of the day, default `Minecraft Server`
**MINECRAFT_MAX_PLAYERS** - maximum amount of player, default `5`
**MINECRAFT_LEVEL_SEED** - level seed, default is empty
**MINECRAFT_ONLINE_MODE** - enable online mode, default `true`
**MINECRAFT_RCON_PASSWORD** - RCON password, required to enable RCON

Eg. change the MOTD
```
docker run -d -p 25565:25565 -e MINECRAFT_MOTD="Some other MOTD" trojan295/minecraft-server:<TAG>
```

# Enter server console

If the **MINECRAFT_RCON_PASSWORD** environment variable is set, then the server will start RCON listening on port 25575.
The images have `rcon-cli` (https://github.com/itzg/rcon-cli) binary embedded. To run it exec in the containter eg.:
```
docker exec -it <container_name> /app/rcon-cli
```

