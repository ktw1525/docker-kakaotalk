sudo xhost +local:docker

sudo docker run -it --name kakaotalk -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/snd docker-kakaotalk