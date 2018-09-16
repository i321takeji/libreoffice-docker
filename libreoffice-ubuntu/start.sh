#/bin/bash -

docker run --rm -i -t --net host -e DISPLAY=$DISPLAY \
                                 -v $HOME/.Xauthority:/root/.Xauthority:rw \
                                 -v $HOME:/work-dir \
                                 libreoffice:ubuntu-16.04 "$@"
