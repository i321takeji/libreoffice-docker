FROM ubuntu:18.04

RUN sed -i.bak -e "s%http://.*.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list \
&& apt-get update && apt-get install -y \
  dbus-x11 \
# fcitx-imlist \
  fcitx-mozc \
  fonts-ipafont \
  fonts-ipaexfont \
# fonts-takao \
  language-pack-ja-base \
  language-pack-ja tzdata \
  mozc-utils-gui \
  wget \
  xz-utils \
&& ln -s -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
&& dpkg-reconfigure -f noninteractive tzdata \
&& locale-gen ja_JP.UTF-8 \
&& mkdir -p /usr/share/fonts/truetype/mplusipa \
&& wget -O - http://osdn.net/dl/mplus-fonts/mplus-TESTFLIGHT-063.tar.xz | tar Jxf - --strip-components 1 -C /usr/share/fonts/truetype/mplusipa/ --wildcards *.ttf \
&& fc-cache -fv \
&& apt-get purge -y \
  wget \
  xz-utils \
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
&& apt-get clean \
&& rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

COPY res/entrypoint.sh /usr/local/bin
COPY res/runLibreOffice.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/runLibreOffice.sh

WORKDIR work-dir

ENTRYPOINT ["entrypoint.sh"]
CMD ["libreoffice"]
