#!/bin/bash
clear

#download
wget -O /usr/local/bin/PDirect.py https://raw.githubusercontent.com/project-sc/alamyazid/main/install/PDirect.py
chmod +x /usr/local/bin/PDirect.py

#setservicecdn
cat > /etc/systemd/system/cdn.service << END
[Unit]
Description=Python Edu Proxy Script By TuanYZ
Documentation=iwaksapat.site
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/PDirect.py
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable cdn.service
systemctl restart cdn.service

#WEBSOCKETNONTLS 

#nontls service
cat > /etc/systemd/system/cdn-nontls.service << END
[Unit]
Description=Python Edu Proxy Script By TuanYZ
Documentation=https://t.me/whytzy96
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/PDirect.py 2095
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable cdn-nontls.service
systemctl restart cdn-nontls.service


#OVPN WEBSOCKET INSTALLER
wget -O /usr/local/bin/ovpn.py https://raw.githubusercontent.com/project-sc/alamyazid/main/install/ovpn.py
chmod +x /usr/local/bin/ovpn.py


#install service 
cat > /etc/systemd/system/cdn-ovpn.service << END
[Unit]
Description=Python Edu Proxy Script By TuanYZ
Documentation=iwaksapat.site
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ovpn.py 2082
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable cdn-ovpn.service
systemctl restart cdn-ovpn.service


