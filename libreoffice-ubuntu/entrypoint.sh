#!/bin/sh -

set -eu

fcitx-autostart > /dev/null 2>&1

"$@"
