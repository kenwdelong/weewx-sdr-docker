FROM debian
MAINTAINER kenwdelong@gmail.com

ENV WEEWX_VERSION=weewx-4.8.0

RUN apt-get update -y && apt-get install -y  --no-install-recommends \
    git wget python3 
    
# https://www.rtl-sdr.com/rtl-sdr-quick-start-guide/   all the way at the bottom
RUN echo 'blacklist dvb_usb_rtl28xxu' | tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf