#!/bin/sh -

set -e

USERNAME="${LIBRE_USER}"
USERID="${LIBRE_UID}"
GROUPID="${LIBRE_GID}"

if [ -z "${USERNAME}" ] || [ -z "${USERID}" ] || [ -z "${GROUPID}" ]; then
  bash
else
  groupadd "${USERNAME}" -g "${GROUPID}"
  useradd "${USERNAME}" -u "${USERID}" -g "${GROUPID}" -m -d "/home/${USERNAME}" -s /bin/bash
  ln -s /xfiles/.Xauthority "/home/${USERNAME}"
  su - "${USERNAME}" -c /usr/local/bin/runLibreOffice.sh
fi
