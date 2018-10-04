# accept EULA
echo "eula=true" > /app/eula.txt

# install rcon-cli
wget -O /app/rcon-cli.tar.gz https://github.com/itzg/rcon-cli/releases/download/1.4.0/rcon-cli_1.4.0_linux_amd64.tar.gz
tar xfz /app/rcon-cli.tar.gz
rm -f /app/rcon-cli.tar.gz

# install Minecraft server
/bin/sh /install.sh

# create volume directory
files="backups world banned-ips.json banner-players.json ops.json whitelist.json"

mkdir /data
mkdir /data/world
mkdir /data/backups

for file in $files; do
    echo "Create symlink for /app/$file"
    ln -s /data/$file /app/$file
done

