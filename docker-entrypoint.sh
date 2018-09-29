#!/bin/sh

MINECRAFT_PVP="${MINECRAFT_PVP:-"true"}"
MINECRAFT_MOTD="${MINECRAFT_MOTD:-"Minecraft Server"}"
MINECRAFT_MAX_PLAYERS="${MINECRAFT_MAX_PLAYERS:-"5"}"
MINECRAFT_LEVEL_SEED="${MINECRAFT_LEVEL_SEED:-""}"

sed -ie "s|{{PVP}}|${MINECRAFT_PVP}|" server.properties
sed -ie "s|{{MOTD}}|${MINECRAFT_MOTD}|" server.properties
sed -ie "s|{{MAX_PLAYERS}}|${MINECRAFT_MAX_PLAYERS}|" server.properties
sed -ie "s|{{LEVEL_SEED}}|${MINECRAFT_LEVEL_SEED}|" server.properties

exec "$@"

