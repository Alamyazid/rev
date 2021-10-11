#!/bin/bash
read -rp "Masukan domain anda, atau enter untuk domain otomatis.."
read -rp "Domain/Host: "
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
