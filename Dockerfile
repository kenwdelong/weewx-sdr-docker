FROM jgoerzen/weewx:5.0.2
# https://salsa.debian.org/jgoerzen/docker-weewx
MAINTAINER kenwdelong@gmail.com


# https://www.rtl-sdr.com/rtl-sdr-quick-start-guide/   all the way at the bottom
RUN mkdir -p /etc/modprobe.d
RUN echo 'blacklist dvb_usb_rtl28xxu' | tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
RUN apt update && apt-get install -y rtl-sdr
RUN mkdir -p /etc/udev/rules.d
RUN echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="2838", GROUP="adm", MODE="0666", SYMLINK+="rtl_sdr"' | tee --append /etc/udev/rules.d/20.rtlsdr.rules
RUN usermod -aG adm weewx
RUN apt-get install -y rtl-433

# WEEWX SDR DRIVER
RUN wget -O weewx-sdr.zip https://github.com/matthewwall/weewx-sdr/archive/master.zip

## This next line is throwing all kinds of errors...
#RUN weectl extension install weewx-sdr.zip
#RUN rm weewx-sdr.zip
#RUN /etc/weewx/scripts/wee_config --reconfigure --driver=user.sdr --no-prompt
