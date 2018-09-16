FROM ubuntu:16.04

RUN sed -i.bak -e "s%http://.*.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list \
&& apt-get update && apt-get install -y --no-install-recommends \
  dbus-x11 \
# fcitx-imlist \
  fcitx-mozc \
  fonts-takao \
  language-pack-ja-base \
  language-pack-ja tzdata \
&& ln -s -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
&& dpkg-reconfigure -f noninteractive tzdata \
&& locale-gen ja_JP.UTF-8 \
&& apt-get clean \
&& rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ENV LANG ja_JP.UTF-8
ENV GTK_IM_MODULE=fcitx \
    QT_IM_MODULE=fcitx \
    XMODIFIERS=@im=fcitx \
    DefalutIMModule=fcitx

RUN apt-get update && apt-get install -y --no-install-recommends \
  libreoffice \
  libreoffice-l10n-ja \
  openjdk-8-jre \
# clean up
&& apt-get clean \
&& rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR work-dir

ENTRYPOINT ["entrypoint.sh"]
CMD ["libreoffice"]
