#/bin/bash -

set -e

IMAGE="bamboog130/libreoffice-docker"

WORK_DIR="$1"
WORK_VOLUME=""

if [ -n "${WORK_DIR}" ]; then
  if [ -d "${WORK_DIR}" ]; then
    WORK_ABSPATH="$(cd ${WORK_DIR} && pwd)"
    WORK_VOLUME="-v ${WORK_ABSPATH}:/libreoffice-work"
  else
    echo "${WORK_DIR} is NOT directory."
    exit 1
  fi
fi

bash -c "docker run --rm -i -t --net host -e DISPLAY=${DISPLAY} \
                    --name libreoffice_container \
                    -e LIBRE_UID=`id -u` -e LIBRE_GID=`id -g` \
                    -v ${HOME}/.Xauthority:/xfiles/.Xauthority:rw \
                    ${WORK_VOLUME} \
                    ${IMAGE}"
