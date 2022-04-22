#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);

apt install jq curl -y
DOMAIN=iwaksaluang.cf
sub=$(</dev/urandom tr -dc a-z0-9 | head -c4)
SUB_DOMAIN=${sub}.iwaksaluang.cf
CF_ID=alamyazid13@gmail.com
CF_KEY=8e3a5871106936479556197772daa54786137
set -euo pipefail
IP=$(wget -qO- ifconfig.me/ip);
echo "Updating DNS for ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')
echo "Host : $SUB_DOMAIN"
echo $SUB_DOMAIN > /root/domain
cp /root/domain /etc/xray/
echo $SUB_DOMAIN > /etc/v2ray/domain
echo $SUB_DOMAIN > /etc/xray/domain
echo $SUB_DOMAIN > /root/domain
echo $SUB_DOMAIN > /etc/xray/domain

#mail.conf
cat > /root/mail.conf << END
DOMAIN=iwaksaluang.cf
CF_ID=alamyazid13@gmail.com
CF_KEY=15dd55d67ed3c631306554211057b4ab5dbf7
END
rm -f /root/cf.sh
