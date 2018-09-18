#!/bin/sh -

set -e

LIBRE_USER="$1"
LIBRE_UID="$2"

if [ -z "${LIBRE_USER}" ] || [ -z "${LIBRE_UID}" ]; then
  bash
else
  useradd "${LIBRE_USER}" -u "${LIBRE_UID}" -m -d "/home/${LIBRE_USER}" -s /bin/bash
  ln -s /xfiles/.Xauthority "/home/${LIBRE_USER}"
  su - "${LIBRE_USER}" -c /usr/local/bin/runLibreOffice.sh
fi
