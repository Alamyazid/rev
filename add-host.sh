#!/bin/bash
read -e -p " Masukan domain anda, atau enter untuk domain otomatis..
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
