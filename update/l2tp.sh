#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);

echo -e ""
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e "         \e[1;31m\e[1;31m═[\e[mL2TP & PPTP Account\e[1;31m]═\e[m" 
echo -e "\e[1;32m═══════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Creating L2TP Account"
echo -e " 2\e[1;33m)\e[m  Create Account PPTP"
echo -e " 3\e[1;33m)\e[m  Deleting L2TP Account"
echo -e " 4\e[1;33m)\e[m  Delete PPTP Account"
echo -e " 5\e[1;33m)\e[m  Check User Login PPTP"
echo -e " 6\e[1;33m)\e[m  Renew L2TP Account"
echo -e " 7\e[1;33m)\e[m  Renew PPTP Account"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please Input Number  [1-7 or x] :  "  l2tp
echo -e ""
case "$l2tp" in
1)
add-l2tp
;;
2)
add-pptp
;;
3)
del-l2tp
;;
4)
del-pptp
;;
5)
cek-pptp
;;
6)
renew-l2tp
;;
7)
renew-pptp
;;
x)
menu
;;
*)
echo "Please enter an correct number"
;;
esac
