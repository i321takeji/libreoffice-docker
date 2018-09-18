#!/bin/sh -

set -e

export LANG=ja_JP.UTF-8
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefalutIMModule=fcitx

fcitx-autostart > /dev/null 2>&1

libreoffice
