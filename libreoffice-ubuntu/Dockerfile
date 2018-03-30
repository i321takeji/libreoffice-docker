FROM ubuntu:16.04

RUN sed -i.bak -e "s%http://.*.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list \
&& apt-get update && apt-get install -y \
#--no-install-recommends \
language-pack-ja-base language-pack-ja tzdata \
dbus-x11 fonts-takao fcitx-mozc \
#fcitx-imlist \
&& ln -s -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
&& dpkg-reconfigure -f noninteractive tzdata \
&& locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

ENV GTK_IM_MODULE=fcitx \
    QT_IM_MODULE=fcitx \
    XMODIFIERS=@im=fcitx \
    DefalutIMModule=fcitxi

RUN apt-get update && apt-get install -y --no-install-recommends openjdk-8-jre libreoffice libreoffice-l10n-ja

# clean up
RUN apt-get dist-upgrade -y && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

CMD ["/bin/bash", "-c", "fcitx-autostart > /dev/null 2>&1 && libreoffice"]
#CMD ["libreoffice"]
