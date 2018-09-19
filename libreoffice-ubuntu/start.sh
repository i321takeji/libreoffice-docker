#/bin/bash -

set -e

IMAGE="libreoffice:ubuntu-18.04"

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

bash -c "docker run --rm -i -t -d --net host -e DISPLAY=${DISPLAY} \
                    --name libreoffice_container \
                    -v ${HOME}/.Xauthority:/xfiles/.Xauthority:rw \
                    ${WORK_VOLUME} \
                    ${IMAGE} ${USER} ${UID}"
