# docker-syslog-ng
docker build for a syslog-ng host. 

## what does it do?
 * listens on default syslog-ng port (514)  
 * write to path /logs which is exposed as volume /logs  
 * default behaviour defined in [/conf/syslog-ng.conf](syslog-ng.conf) can be changed by mapping a host path containing a custom syslog-ng.conf to exposed volume /conf  

## exposed ports
 * 514/udp
 * 514/tcp

## exposed volumes
 * `/conf` contains syslog-ng.conf
 * `/logs` log destination