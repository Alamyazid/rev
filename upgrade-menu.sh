#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);

echo "Start Update"
# update
cd /usr/bin
wget -O /usr/bin/l2tp https://raw.githubusercontent.com/Alamyazid/rev/main/update/l2tp.sh && chmod +x /usr/bin/l2tp
wget -O /usr/bin/menu https://raw.githubusercontent.com/Alamyazid/rev/main/update/menu.sh && chmod +x /usr/bin/menu
wget -O /usr/bin/ssh https://raw.githubusercontent.com/Alamyazid/rev/main/update/ssh.sh && chmod +x /usr/bin/ssh
wget -O /usr/bin/ssssr https://raw.githubusercontent.com/Alamyazid/rev/main/update/ssssr.sh && chmod +x /usr/bin/ssssr
wget -O /usr/bin/sstpp https://raw.githubusercontent.com/Alamyazid/rev/main/update/sstpp.sh && chmod +x /usr/bin/sstpp
wget -O /usr/bin/trojaan https://raw.githubusercontent.com/Alamyazid/rev/main/update/trojaan.sh && chmod +x /usr/bin/trojaan
wget -O /usr/bin/v2raay https://raw.githubusercontent.com/Alamyazid/rev/main/update/v2raay.sh && chmod +x /usr/bin/v2raay
wget -O /usr/bin/vleess https://raw.githubusercontent.com/Alamyazid/rev/main/update/vleess.sh && chmod +x /usr/bin/vleess
wget -O /usr/bin/wgr https://raw.githubusercontent.com/Alamyazid/rev/main/update/wgr.sh && chmod +x /usr/bin/wgr

