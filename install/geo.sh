#!/bin/bash
# IP Validation
MYIP=$(wget -qO- icanhazip.com);

# VPS Information
Checkstart1=$(ip route | grep default | cut -d ' ' -f 3 | head -n 1);
if [[ $Checkstart1 == "venet0" ]]; then 
    clear
	  lan_net="venet0"
    typevps="OpenVZ"
    sleep 1
else
    clear
		lan_net="eth0"
    typevps="KVM"
    sleep 1
fi

# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION
ITAM='\033[0;30m'
echo -e "$ITAM"
NAMAISP=$( curl -s ipinfo.io/org | cut -d " " -f 2-10  )
clear
REGION=$( curl -s ipinfo.io/region )
clear
COUNTRY=$( curl -s ipinfo.io/country )
clear
WAKTU=$( curl -s ipinfo.ip/timezone )
clear
CITY=$( curl -s ipinfo.io/city )
clear
REGION=$( curl -s ipinfo.io/region )
clear
WAKTUE=$( curl -s ipinfo.io/timezone )
clear
koordinat=$( curl -s ipinfo.io/loc )
clear
NC='\033[0m'
echo -e "$NC"

# Chek Status 
l2tp_status=$(systemctl status xl2tpd | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
#status_openvp=$(/etc/init.d/openvpn status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
status_ss_tls="$(systemctl show shadowsocks-libev-server@tls.service --no-page)"
ss_tls=$(echo "${status_ss_tls}" | grep 'ActiveState=' | cut -f2 -d=)
#sssotl=$(systemctl status shadowsocks-libev-server@*-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1) 
status_ss_http="$(systemctl show shadowsocks-libev-server@http.service --no-page)"
ss_http=$(echo "${status_ss_http}" | grep 'ActiveState=' | cut -f2 -d=)
#sssohtt=$(systemctl status shadowsocks-libev-server@*-http | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1) 
tls_v2ray_status=$(systemctl status v2ray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status v2ray@none | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status v2ray@vless | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status v2ray@vnone | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssr_status=$(systemctl status ssrmu | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status trojan | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
sstp_service=$(systemctl status accel-ppp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
squid_service=$(/etc/init.d/squid status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wg="$(systemctl show wg-quick@wg0.service --no-page)"
swg=$(echo "${wg}" | grep 'ActiveState=' | cut -f2 -d=)
sswg=$(systemctl status wg-quick@wg0 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_go_server=$(systemctl status trojan-go | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# Color Validation
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear

# Status Service OpenVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn="${GREEN}OpenVPN Service Is Running ${NC}( Aktif )"
else
  status_openvpn="${RED}OpenVPN Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN}SSH/Tunnel Service Is Running ${NC}( Aktif )"
else
   status_ssh="${RED}SSH/Tunnel Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  Squid 
if [[ $squid_service == "running" ]]; then 
   status_squid="${GREEN}Squid Service Is Running ${NC}( Aktif )"
else
   status_squid="${RED}Squid Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  VNSTAT 
if [[ $vnstat_service == "running" ]]; then 
   status_vnstat="${GREEN}Vnstat Service Is Running ${NC}( Aktif )"
else
   status_vnstat="${RED}Vnstat Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  Crons 
if [[ $cron_service == "running" ]]; then 
   status_cron="${GREEN}Crons Service Is Running ${NC}( Aktif )"
else
   status_cron="${RED}Crons Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  Fail2ban 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GREEN}Fail2Ban Service Is Running ${NC}( Aktif )"
else
   status_fail2ban="${RED}Fail2Ban Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service  TLS 
if [[ $tls_v2ray_status == "running" ]]; then 
   status_tls_v2ray="${GREEN}V2Ray HTTPS Service Is Running${NC} ( Aktif )"
else
   status_tls_v2ray="${RED}V2Ray HTTPS Service Is Not Running${NC} ( Not Aktif )"
fi

# Status Service Non TLS V2Ray
if [[ $nontls_v2ray_status == "running" ]]; then 
   status_nontls_v2ray="${GREEN}V2Ray HTTP Service Is Running ${NC}( Aktif )${NC}"
else
   status_nontls_v2ray="${RED}V2Ray HTTP Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Vless HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless="${GREEN}Vless HTTPS Service Is Running${NC} ( Aktif )"
else
  status_tls_vless="${RED}Vless HTTPS Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Vless HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless="${GREEN}Vless HTTP Service Is Running${NC} ( Aktif )"
else
  status_nontls_vless="${RED}Vless HTTP Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# ShadowsocksR Status
if [[ $ssr_status == "running" ]] ; then
  status_ssr="${GREEN}SSR Service Is Running${NC} ( Aktif )${NC}"
else
  status_ssr="${RED}SSR Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Ss HTTPS
if [[ $ss_tls == "active" ]] ; then
  status_ss_tls="${GREEN}SS HTTPS Service Is Running${NC} ( Aktif )${NC}"
else
  status_ss_tls="${RED}SS HTTPS Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Ss HTTP
if [[ $ss_http == "active" ]] ; then
  status_ss_http="${GREEN}SS HTTP Service Is Running${NC} ( Aktif )${NC}"
else
  status_ss_http="${RED}SS HTTP Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Trojan
if [[ $trojan_server == "running" ]]; then 
   status_virus_trojan="${GREEN}Trojan Service Is Running ${NC}( Aktif )${NC}"
else
   status_virus_trojan="${RED}Trojan Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Wireguard
if [[ $swg == "active" ]]; then
  status_wg="${GREEN}Wireguard Service Is Running ${NC}( Aktif )${NC}"
else
  status_wg="${RED}Wireguard Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service L2TP
if [[ $l2tp_status == "running" ]]; then 
   status_l2tp="${GREEN}L2TP Service Is Running${NC} ( Aktif )${NC}"
else
   status_l2tp="${RED}L2TP Service Is Not Running${NC}( Not Aktif )${NC}"
fi

# Status Service Dropbear
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GREEN}Dropbear Service Is Running${NC} ( Aktif )${NC}"
else
   status_beruangjatuh="${RED}Dropbear Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Status Service Stunnel
if [[ $stunnel_service == "running" ]]; then 
   status_stunnel="${GREEN}Stunnel Service Is Running ${NC}( Aktif )"
else
   status_stunnel="${RED}Stunnel Service Is Not Running ${NC}( Not Aktif )}"
fi

# Status Service SSTP
if [[ $sstp_service == "running" ]]; then 
   status_sstp="${GREEN}SSTP Service Is Running ${NC}( Aktif )"
else
   status_sstp="${RED}SSTP Service Is Not Running ${NC}( Not Aktif )"
fi

# Status Service Trojan Go
if [[ $trojan_go_server == "running" ]]; then 
   status_gabut="${GREEN}Trojan-GO Service Is Running ${NC}( Aktif )${NC}"
else
   status_gabut="${RED}Trojan-GO Service Is Not Running ${NC}( Not Aktif )${NC}"
fi

# Ram Usage
total_r2am=` grep "MemAvailable: " /proc/meminfo | awk '{ print $2}'`
MEMORY=$(($total_r2am/1024))

# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))

# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))

# Total Ram
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# Tipe Processor
totalcore="$(grep -c "^processor" /proc/cpuinfo)" 
totalcore+=" Core"
corediilik="$(grep -c "^processor" /proc/cpuinfo)" 
tipeprosesor="$(awk -F ': | @' '/model name|Processor|^cpu model|chip type|^cpu type/ {
                        printf $2;
                        exit
                        }' /proc/cpuinfo)"

# Shell Version
shellversion=""
shellversion=Bash
shellversion+=" Version" 
shellversion+=" ${BASH_VERSION/-*}" 
versibash=$shellversion

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Kernel Terbaru
kernelku=$(uname -r)

# Waktu Sekarang 
harini=`date -d "0 days" +"%d-%m-%Y"`
jam=`date -d "0 days" +"%X"`

# DNS Patch
tipeos2=$(uname -m)

# Getting Domain Name
Domen="$(cat /etc/v2ray/domain)"

# Echoing Result
echo -e ""
echo -e "In Here Is Your VPS Information : " | lolcat 
echo "-------------------------------------------------------------------------------" | lolcat 
echo "Operating System Information :" | lolcat 
echo -e "VPS Type    : $typevps"
echo -e "OS Arch     : $tipeos2"
echo -e "Hostname    : $HOSTNAME"
echo -e "OS Name     : $Tipe"
echo -e "OS Version  : $Versi_OS"
echo -e "OS URL      : $URL_SUPPORT"
echo -e "OS BASE     : $basedong"
echo -e "OS TYPE     : Linux / Unix"
echo -e "Bash Ver    : $versibash"
echo -e "Kernel Ver  : $kernelku"
echo "-------------------------------------------------------------------------------" | lolcat 
echo "Hardware Information :" | lolcat 
echo -e "Processor   : $tipeprosesor"
echo -e "Proc Core   : $totalcore"
echo -e "Virtual     : $typevps"
echo -e "Cpu Usage   : $cpu_usage"
echo "-------------------------------------------------------------------------------" | lolcat 
echo "System Status / System Information :" | lolcat 
echo -e "Uptime      : $uptime ( From VPS Booting )"
echo -e "Total RAM   : ${totalram}MB"
echo -e "Avaible     : ${MEMORY}MB"
echo -e "Download    : $downloadsize GB ( From Startup / VPS Booting )"
echo -e "Upload      : $uploadsize GB ( From Startup / VPS Booting )"
echo "-------------------------------------------------------------------------------" | lolcat 
echo "Internet Service Provider Information :" | lolcat 
echo -e "Public IP   : $MYIP"
echo -e "Domain      : $Domen"
echo "-------------------------------------------------------------------------------" | lolcat 
echo "System Status Information :" | lolcat 
echo -e "SSH / Tun   : $status_ssh"
echo -e "OpenVPN     : $status_openvpn"
echo -e "Dropbear    : $status_beruangjatuh"
echo -e "Stunnel     : $status_stunnel"
echo -e "Squid       : $status_squid"
echo -e "Fail2Ban    : $status_fail2ban"
echo -e "Crons       : $status_cron"
echo -e "Vnstat      : $status_vnstat"
echo -e "L2TP        : $status_l2tp"
echo -e "SSTP        : $status_sstp"
echo -e "V2Ray TLS   : $status_tls_v2ray"
echo -e "V2Ray HTTP  : $status_nontls_v2ray"
echo -e "Vless TLS   : $status_tls_vless"
echo -e "Vless HTTP  : $status_nontls_vless"
echo -e "SSR         : $status_ssr"
echo -e "SS TLS      : $status_ss_tls"
echo -e "SS HTTP     : $status_ss_http"
echo -e "Trojan      : $status_virus_trojan"
echo -e "Wireguard   : $status_wg"
#echo -e "Trojan-Go   : $status_gabut"
echo "------------------------------------------------------------------------" | lolcat 
echo ""