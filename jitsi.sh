#sistemi güncelleyelim
apt-get update -y

#install coturn
apt-get install coturn -y

echo "TURNSERVER_ENABLED=1" >> /etc/default/coturn

#coturn start
systemctl start coturn

#coturn yedeğini kaydet
mv /etc/turnserver.conf /etc/turnserver.conf.backup

#coturn restart
service coturn restart


#domaini variable al
hostnamectl set-hostname jitsi.gizempesen.com

#bu komutu echo ile yazdır
#echo "84.44.28.75 jitsi.gizempesen.com" >> /etc/hosts

# Ensure support for apt repositories served via HTTPS
apt-get install apt-transport-https -y

apt-add-repository universe

apt-get update -y

##portlara izin verilmesi
#ufw allow 80/tcp
#ufw allow 443/tcp
#ufw allow 4443/tcp
#ufw allow 10000/udp
#ufw allow 22/tcp
#turnserver
#ufw allow 3478/udp
#ufw allow 5349/tcp
#external jibri service
#ufw allow 5222/tcp



echo deb http://packages.prosody.im/debian $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list
wget https://prosody.im/files/prosody-debian-packages.key -O- | sudo apt-key add -
apt-get install lua5.2 -y

curl https://download.jitsi.org/jitsi-key.gpg.key | sudo sh -c 'gpg --dearmor > /usr/share/keyrings/jitsi-keyring.gpg'
echo 'deb [signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/' | sudo tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null

apt-get update -y

# jitsi-meet installation
apt-get install jitsi-meet -y

#jitsi gpg key
#wget https://download.jitsi.org/jitsi-key.gpg.key

#add key
#sudo apt-key add jitsi-key.gpg.key

#rm key after add
#rm jitsi-key.gpg.key

#---
#sudo nano /etc/apt/sources.list.d/jitsi-stable.list
#deb https://download.jitsi.org stable/

#sistemi güncelleyelim
#sudo apt update -y

#install jitsi-meet with apt package
#sudo apt install jitsi-meet -y

#---enter domain name and generate self signed certificate

#run letsencryipt
#sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh

#---sip-communicator.properties
#nano /etc/jitsi/videobridge/sip-communicator.properties

#default ice.harvest yorum satırına alınacak
#local ip = iç ip
#public ip= 84ü
#org.ice4j.ice.harvest.NAT_HARVESTER_LOCAL_ADDRESS=<Local.IP.Address>
#org.ice4j.ice.harvest.NAT_HARVESTER_PUBLIC_ADDRESS=<Public.IP.Address>
