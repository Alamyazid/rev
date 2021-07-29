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

wget -O add-host "https://raw.githubusercontent.com/Alamyazid/rev/main/add-host.sh"
wget -O about "https://raw.githubusercontent.com/Alamyazid/rev/main/about.sh"
wget -O usernew "https://raw.githubusercontent.com/Alamyazid/rev/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/Alamyazid/rev/main/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/Alamyazid/rev/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/Alamyazid/rev/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/Alamyazid/rev/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/Alamyazid/rev/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/Alamyazid/rev/main/restart.sh"
wget -O speedtest "https://raw.githubusercontent.com/Alamyazid/rev/main/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/Alamyazid/rev/main/info.sh"
wget -O ram "https://raw.githubusercontent.com/Alamyazid/rev/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/Alamyazid/rev/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/Alamyazid/rev/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/Alamyazid/rev/main/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/Alamyazid/rev/main/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/Alamyazid/rev/main/clear-log.sh"
wget -O change-port "https://raw.githubusercontent.com/Alamyazid/rev/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/Alamyazid/rev/main/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/Alamyazid/rev/main/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/Alamyazid/rev/main/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/Alamyazid/rev/main/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/Alamyazid/rev/main/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/Alamyazid/rev/main/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/Alamyazid/rev/main/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/Alamyazid/rev/main/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/Alamyazid/rev/main/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/Alamyazid/rev/main/xp.sh"
wget -O update "https://raw.githubusercontent.com/Alamyazid/rev/main/update.sh"
wget -O strt "https://raw.githubusercontent.com/Alamyazid/rev/main/strt.sh"
wget -O swap "https://raw.githubusercontent.com/Alamyazid/rev/main/swapkvm.sh"
wget -O upgrade-mn "https://raw.githubusercontent.com/Alamyazid/rev/main/up-menu.sh"
chmod +x add-host
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x update
chmod +x strt
chmod +x swap
chmod +x upgrade-mn
wget -O /usr/bin/ssr https://raw.githubusercontent.com/Alamyazid/rev/main/ssrmu.sh && chmod +x /usr/bin/ssr
wget -O /usr/bin/add-ssr https://raw.githubusercontent.com/Alamyazid/rev/main/add-ssr.sh && chmod +x /usr/bin/add-ssr
wget -O /usr/bin/del-ssr https://raw.githubusercontent.com/Alamyazid/rev/main/del-ssr.sh && chmod +x /usr/bin/del-ssr
wget -O /usr/bin/renew-ssr https://raw.githubusercontent.com/Alamyazid/rev/main/renew-ssr.sh && chmod +x /usr/bin/renew-ssr
wget -O /usr/bin/add-sstp https://raw.githubusercontent.com/Alamyazid/rev/main/add-sstp.sh && chmod +x /usr/bin/add-sstp
wget -O /usr/bin/del-sstp https://raw.githubusercontent.com/Alamyazid/rev/main/del-sstp.sh && chmod +x /usr/bin/del-sstp
wget -O /usr/bin/cek-sstp https://raw.githubusercontent.com/Alamyazid/rev/main/cek-sstp.sh && chmod +x /usr/bin/cek-sstp
wget -O /usr/bin/renew-sstp https://raw.githubusercontent.com/Alamyazid/rev/main/renew-sstp.sh && chmod +x /usr/bin/renew-sstp
#wget -O /usr/bin/l2tp https://raw.githubusercontent.com/Alamyazid/rev/main/update/l2tp.sh && chmod +x /usr/bin/l2tp
#wget -O /usr/bin/menu https://raw.githubusercontent.com/Alamyazid/rev/main/update/menu.sh && chmod +x /usr/bin/menu
#wget -O /usr/bin/ssh https://raw.githubusercontent.com/Alamyazid/rev/main/update/ssh.sh && chmod +x /usr/bin/ssh
#wget -O /usr/bin/ssssr https://raw.githubusercontent.com/Alamyazid/rev/main/update/ssssr.sh && chmod +x /usr/bin/ssssr
#wget -O /usr/bin/sstpp https://raw.githubusercontent.com/Alamyazid/rev/main/update/sstpp.sh && chmod +x /usr/bin/sstpp
#wget -O /usr/bin/trojaan https://raw.githubusercontent.com/Alamyazid/rev/main/update/trojaan.sh && chmod +x /usr/bin/trojaan
#wget -O /usr/bin/v2raay https://raw.githubusercontent.com/Alamyazid/rev/main/update/v2raay.sh && chmod +x /usr/bin/v2raay
#wget -O /usr/bin/vleess https://raw.githubusercontent.com/Alamyazid/rev/main/update/vleess.sh && chmod +x /usr/bin/vleess
#wget -O /usr/bin/wgr https://raw.githubusercontent.com/Alamyazid/rev/main/update/wgr.sh && chmod +x /usr/bin/wgr
wget -O add-wg "https://raw.githubusercontent.com/Alamyazid/rev/main/add-wg.sh"
wget -O del-wg "https://raw.githubusercontent.com/Alamyazid/rev/main/del-wg.sh"
wget -O cek-wg "https://raw.githubusercontent.com/Alamyazid/rev/main/cek-wg.sh"
wget -O renew-wg "https://raw.githubusercontent.com/Alamyazid/rev/main/renew-wg.sh"
chmod +x add-wg
chmod +x del-wg
chmod +x cek-wg
chmod +x renew-wg
wget -O add-ss "https://raw.githubusercontent.com/Alamyazid/rev/main/add-ss.sh"
wget -O del-ss "https://raw.githubusercontent.com/Alamyazid/rev/main/del-ss.sh"
wget -O cek-ss "https://raw.githubusercontent.com/Alamyazid/rev/main/cek-ss.sh"
wget -O renew-ss "https://raw.githubusercontent.com/Alamyazid/rev/main/renew-ss.sh"
chmod +x add-ss
chmod +x del-ss
chmod +x cek-ss
chmod +x renew-ss
wget -O add-ws "https://raw.githubusercontent.com/Alamyazid/rev/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/Alamyazid/rev/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/Alamyazid/rev/main/add-tr.sh"
wget -O del-ws "https://raw.githubusercontent.com/Alamyazid/rev/main/del-ws.sh"
wget -O del-vless "https://raw.githubusercontent.com/Alamyazid/rev/main/del-vless.sh"
wget -O del-tr "https://raw.githubusercontent.com/Alamyazid/rev/main/del-tr.sh"
wget -O cek-ws "https://raw.githubusercontent.com/Alamyazid/rev/main/cek-ws.sh"
wget -O cek-vless "https://raw.githubusercontent.com/Alamyazid/rev/main/cek-vless.sh"
wget -O cek-tr "https://raw.githubusercontent.com/Alamyazid/rev/main/cek-tr.sh"
wget -O renew-ws "https://raw.githubusercontent.com/Alamyazid/rev/main/renew-ws.sh"
wget -O renew-vless "https://raw.githubusercontent.com/Alamyazid/rev/main/renew-vless.sh"
wget -O renew-tr "https://raw.githubusercontent.com/Alamyazid/rev/main/renew-tr.sh"
wget -O certv2ray "https://raw.githubusercontent.com/Alamyazid/rev/main/cert.sh"
chmod +x add-ws
chmod +x add-vless
chmod +x add-tr
chmod +x del-ws
chmod +x del-vless
chmod +x del-tr
chmod +x cek-ws
chmod +x cek-vless
chmod +x cek-tr
chmod +x renew-ws
chmod +x renew-vless
chmod +x renew-tr
chmod +x certv2ray
wget -O /usr/bin/add-l2tp https://raw.githubusercontent.com/Alamyazid/rev/main/addl2tp.sh && chmod +x /usr/bin/add-l2tp
wget -O /usr/bin/del-l2tp https://raw.githubusercontent.com/Alamyazid/rev/main/del-l2tp.sh && chmod +x /usr/bin/del-l2tp
wget -O /usr/bin/add-pptp https://raw.githubusercontent.com/Alamyazid/rev/main/add-pptp.sh && chmod +x /usr/bin/add-pptp
wget -O /usr/bin/del-pptp https://raw.githubusercontent.com/Alamyazid/rev/main/del-pptp.sh && chmod +x /usr/bin/del-pptp
wget -O /usr/bin/renew-pptp https://raw.githubusercontent.com/Alamyazid/rev/main/renew-pptp.sh && chmod +x /usr/bin/renew-pptp
wget -O /usr/bin/renew-l2tp https://raw.githubusercontent.com/Alamyazid/rev/main/renew-l2tp.sh && chmod +x /usr/bin/renew-l2tp
echo "done"
