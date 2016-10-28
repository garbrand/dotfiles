#!/bin/sh

docker run -d -p 25565:25565 -e EULA=TRUE -v /Users/garbrand/Minecraft:/data --name minecraft itzg/minecraft-server
