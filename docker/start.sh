#!/bin/bash

export DISPLAY=${DISPLAY:-:0}
export XAUTH=/tmp/.docker.xauth

## Generate Xauthority file if not present
if [ ! -f $XAUTH ]; then
    touch $XAUTH
    xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
    echo "[+] Xauthority file created at $XAUTH"
fi
 
## Allow local docker X access
xhost +local:docker

## Start docker-compose
echo "[+] Starting hg_wvn container..."
# docker-compose build
# echo "[+] Done starting container..."
echo "[+] Attaching hg_wvn container..."
docker-compose up -d
