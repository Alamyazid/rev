#!/bin/bash
clear
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- https://icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

#Update Repository VPS
clear
apt update 
apt-get -y upgrade

#Port Server
Port_OpenVPN_TCP='1194';
Port_Squid='3128';
Port_OHP='8484';

#Installing ohp Server
cd 
wget -O /usr/local/bin/ohp-ovpn "https://raw.githubusercontent.com/project-sc/alamyazid/main/install/ohp"
chmod +x /usr/local/bin/ohp-ovpn

#Buat File OpenVPN TCP OHP
cat > /etc/openvpn/tcp-ohp.ovpn <<END
setenv CLIENT_CERT 0
setenv opt block-outside-dns
client
dev tun
proto tcp
remote "bug" 1194
persist-tun
persist-key
persist-remote-ip
comp-lzo
reneg-sec 0
pull
resolv-retry infinite
remote-cert-tls server
verb 3
auth-user-pass
cipher none
auth none
auth-nocache
script-security 2
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
http-proxy xxxxxxxxx 8484
http-proxy-option VERSION 1.1
http-proxy-option CUSTOM-HEADER ""
http-proxy-option CUSTOM-HEADER "Host: "
http-proxy-option CUSTOM-HEADER "X-Forwarded-Host: "
http-proxy-option CUSTOM-HEADER ""
END
sed -i $MYIP2 /etc/openvpn/tcp-ohp.ovpn;

# masukkan certificatenya ke dalam config client TCP 1194
echo '<ca>' >> /etc/openvpn/tcp-ohp.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/tcp-ohp.ovpn
echo '</ca>' >> /etc/openvpn/tcp-ohp.ovpn
cp /etc/openvpn/tcp-ohp.ovpn /home/vps/public_html/tcp-ohp.ovpn
clear
cd 

#Buat Service Untuk OHP
cat > /etc/systemd/system/ohp-ovpn.service <<END
[Unit]
Description=Direct Squid Proxy For OpenVPN TCP
Documentation=https://t.me/xzvnct
Wants=network.target
After=network.target
[Service]
ExecStart=/usr/local/bin/ohp-ovpn -port 8484 -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:1194
Restart=always
RestartSec=3
[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ohp-ovpn
systemctl restart ohp-ovpn

echo "SUCCES"
