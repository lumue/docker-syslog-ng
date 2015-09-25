FROM base/archlinux
MAINTAINER Lutz Mueller <mueller.lutz@gmail.com>

RUN pacman -Sy && \
    pacman -S --noconfirm syslog-ng

RUN mkdir /logs && \
    mkdir /opt/syslog-ng && \
    echo '@version: 3.5' > /etc/syslog-ng/syslog-ng.conf && \
    echo '@include "/opt/syslog-ng/syslog-ng.conf"' >> /etc/syslog-ng/syslog-ng.conf && \
    touch /opt/syslog-ng/syslog-ng.conf

ADD syslog-ng.conf /opt/syslog-ng/syslog-ng.conf

VOLUME ["/opt/syslog-ng", "/logs"]

EXPOSE 514/tcp 514/udp

ENTRYPOINT ["syslog-ng"]
CMD ["-F","--no-caps"]
