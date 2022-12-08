FROM ubuntu:20.04
MAINTAINER gizempesen

RUN echo 'root:root' | chpasswd
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get update
RUN apt-get install -y systemd systemd-sysv dbus dbus-user-session

RUN apt-get install coturn -y
RUN systemctl start coturn
RUN echo "TURNSERVER_ENABLED=1" >> /etc/default/coturn
RUN mv /etc/turnserver.conf /etc/turnserver.conf.backup
#RUN service coturn restart

#RUN mkdir -p /scripts
#COPY jitsi.sh /scripts
#WORKDIR /scripts
#RUN chmod +x jitsi.sh
#RUN ./jitsi.sh; systemctl 

EXPOSE 22 80 443 4443 5347 3478 5349 5322 
EXPOSE 1000/udp  
CMD service coturn restart

ENTRYPOINT ["/sbin/init"]
