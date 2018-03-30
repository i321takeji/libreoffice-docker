#/bin/bash -

#docker run --rm -i -t --net host -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority:rw libreoffice
docker run --rm -i -t --net host -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority:rw libreoffice /bin/bash

