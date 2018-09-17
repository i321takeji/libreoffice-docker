#/bin/bash -

set -e

WORK_DIR="$1"
WORK_VOLUME=""

if [ -n "${WORK_DIR}" ]; then
  if [ -d "${WORK_DIR}" ]; then
    WORK_ABSPATH="$(cd ${WORK_DIR} && pwd)"
    WORK_VOLUME="-v ${WORK_ABSPATH}:/work-dir"
  else
    echo "${WORK_DIR} is NOT directory."
    exit 1
  fi
fi

bash -c "fcitx-autostart &&
         docker run --rm -i -t --net host -e DISPLAY=$DISPLAY \
                                          -v $HOME/.Xauthority:/root/.Xauthority:rw \
                                          ${WORK_VOLUME} \
                                          libreoffice:ubuntu-16.04 $@"
