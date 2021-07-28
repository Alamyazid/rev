#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);

echo -e ""
echo -e "\e[1;32m═════════════════════════════════════════\e[m" | lolcat
echo -e "          \e[1;31m\e[1;31m═[\e[mSSH & OpenVPN Menu\e[1;31m]═\e[m" 
echo -e "\e[1;32m═════════════════════════════════════════\e[m" | lolcat
echo -e " 1\e[1;33m)\e[m  Create SSH & OpenVPN Account"
echo -e " 2\e[1;33m)\e[m  Trial Account SSH & OpenVPN"
echo -e " 3\e[1;33m)\e[m  Renew SSH & OpenVPN Account"
echo -e " 4\e[1;33m)\e[m  Delete SSH & OpenVPN Account"
echo -e " 5\e[1;33m)\e[m  Check User Login SSH & OpenVPN"
echo -e " 6\e[1;33m)\e[m  List Member SSH & OpenVPN"
echo -e " 7\e[1;33m)\e[m  Delete User Expired SSH & OpenVPN"
echo -e " 8\e[1;33m)\e[m  Set up Autokill SSH"
echo -e " 9\e[1;33m)\e[m  Cek Users Who Do Multi Login SSH"
echo -e " 10\e[1;33m)\e[m Restart Service Dropbear, Squid3"
echo -e "     OpenVPN dan SSH"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e " x)   MENU"
echo -e "\e[1;32m══════════════════════════════════════════\e[m" | lolcat
echo -e ""
read -p "     Please Input Number  [1-10 or x] :  "  ssh
echo -e ""
read -p "     Please Input Number  [1-10 or x] :  "  ssh
echo -e ""
case $ssh in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
deluser
;;
5)
cek
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
x)
exit
;;
*)
echo "Please enter an correct number"
;;
esac
