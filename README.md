# Minecraft docker-compose
Minecraft server using Docker-compose with a scripts useful for maintainance

## How-to-use
Simply use `docker-compose up -d --build`

If you want to backup the server, use `./backup.sh`. This will:
- Stop the server
- Archive the data dir to `$(dirname $PWD)-[current date timestamp].tar.zst`
- Restart the server

If you need to access the console, use `./attach.sh minecraft`

If you only need to see the logs, use `./logs.sh`

## Todo
- [ ] Add auto-updater for PaperMC (`paper.jar`)
- [ ] Others things...
