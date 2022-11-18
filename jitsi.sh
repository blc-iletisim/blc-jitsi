#sistemi güncelleyelim
sudo apt-get update -y

#install coturn
sudo apt-get install coturn

#---coturn dosyasını a
sudo nano /etc/default/coturn

#bu komutu yaz
TURNSERVER_ENABLED=1

#coturn start
systemctl start coturn

#coturn yedeğini kaydet
mv /etc/turnserver.conf /etc/turnserver.conf.backup

#coturn restart
sudo service coturn restart


#---domaini variable al
sudo hostnamectl set-hostname jitsi.your_domain

#bu komutu echo ile yazdır
sudo nano /etc/hosts -> 127.0.0.1 jitsi.your_domain

#portlara izin verilmesi
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 4443/tcp
sudo ufw allow 10000/udp
sudo ufw allow 22/tcp
sudo ufw allow 3478/udp
sudo ufw allow 5349/tcp


#jitsi gpg key
wget https://download.jitsi.org/jitsi-key.gpg.key

#add key
sudo apt-key add jitsi-key.gpg.key

#rm key after add
rm jitsi-key.gpg.key

#---
sudo nano /etc/apt/sources.list.d/jitsi-stable.list
deb https://download.jitsi.org stable/

#sistemi güncelleyelim
sudo apt update -y

#install jitsi-meet with apt package
sudo apt install jitsi-meet -y

#---enter domain name and generate self signed certificate

#run letsencryipt
sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh

#---sip-communicator.properties
nano /etc/jitsi/videobridge/sip-communicator.properties

#default ice.harvest yorum satırına alınacak
#local ip = iç ip
#public ip= 84ü
org.ice4j.ice.harvest.NAT_HARVESTER_LOCAL_ADDRESS=<Local.IP.Address>
org.ice4j.ice.harvest.NAT_HARVESTER_PUBLIC_ADDRESS=<Public.IP.Address>
