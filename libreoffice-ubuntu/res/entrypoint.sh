#!/bin/sh -

set -e

USER="$1"
UID="$2"

if [ -z "${USER}" ] || [ -z "${UID}" ]; then
  bash
else
  useradd "${USER}" -u "${UID}" -m -d "/home/${USER}" -s /bin/bash
  ln -s /xfiles/.Xauthority "/home/${USER}"
  su - "${USER}" -c /usr/local/bin/runLibreOffice.sh
fi
