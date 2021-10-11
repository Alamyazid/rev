#!/bin/bash
read -rp "Masukan domain anda, atau enter untuk domain otomatis.."
read -rp "Domain/Host: $subdomain "
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo $subdomain > /etc/v2ray/domain
