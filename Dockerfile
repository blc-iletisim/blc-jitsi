FROM ubuntu:20.04
MAINTAINER gizempesen

RUN \
  echo 'root:root' | chpasswd && \
  apt-get update && \  
  printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d && \
  apt-get install -y systemd systemd-sysv dbus dbus-user-session

RUN \ 
  apt-get install coturn -y && \
  echo "TURNSERVER_ENABLED=1" >> /etc/default/coturn && \
   mv /etc/turnserver.conf /etc/turnserver.conf.backup 
#RUN service coturn restart

#RUN mkdir -p /scripts
#COPY jitsi.sh /scripts
#WORKDIR /scripts
#RUN chmod +x jitsi.sh
#RUN ./jitsi.sh; systemctl 

COPY start.sh start.sh
RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]

#WORKDIR /root/etc
#ENTRYPOINT ["systemctl start coturn"]

EXPOSE 22 80 443 4443 5347 3478 5349 5322
EXPOSE 1000/udp
