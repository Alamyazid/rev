#!/bin/bash
clear
mkdir -p /home/warna

#setup warna
cd /home/warna
apt-get install ruby -y
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin/
gem install lolcat

#gotoroot
clear
echo -e ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Install warna succes"
echo -e "ketik menu untuk melihat hasil"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
rm lolcat.sh
