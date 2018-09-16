#/bin/bash -

docker run --rm -i -t --net host -e DISPLAY=$DISPLAY \
                                 -v $HOME/.Xauthority:/root/.Xauthority:rw \
                                 libreoffice:ubuntu-16.04 "$@"
                                 #-v $HOME:/work-dir \
