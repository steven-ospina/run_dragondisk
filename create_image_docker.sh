#!/bin/bash
# Allow X server connection
xhost +local:root
docker run -d --name dragondiskFront \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v /home/:/home/ \
    dragondisk
# Disallow X server connection
xhost -local:root
