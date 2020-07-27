#!/bin/bash
xhost +si:localuser:root
#xhost +local:root

docker run -it --gpus all --name lio_sam_test --rm   \
	   --mount type=volume,src=mnt,dst=/mnt \
       -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
       -v ${HOME}/bags:/bags \
       --net host \
       --privileged     \
       -e DISPLAY=$DISPLAY \
       --env="LANG=ja_JP.UTF-8" \
     --env QT_X11_NO_MITSHM=1 \
		lio_sam_ros_docker:melodic-devel-gpus \
		bash

xhost -si:localuser:root
#xhost -local:root
