#!/bin/bash
xhost +local:root
sleep 1
docker start dragondiskFront
sleep 1
xhost -local:root

