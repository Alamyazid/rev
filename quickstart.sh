/bin/sh
latest_version="$(curl -s "https://api.github.com/repos/p4gefau1t/trojan-go/releases" | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
echo "The latest version of trojan-go is ${latest_version}"
trojango_link="https://github.com/p4gefau1t/trojan-go/releases/download/v${latest_version}/trojan-go-linux-amd64.zip"
mkdir -p "/usr/bin/trojan-go"
mkdir -p "/etc/trojan-go"
cd `mktemp -d`
curl -sL "${trojango_link}" -o trojan-go.zip
unzip -q trojan-go.zip && rm -rf trojan-go.zip
mv trojan-go /usr/bin/trojan-go/trojan-go
mv geoip.dat /etc/trojan-go/geoip.dat
mv geosite.dat /etc/trojan-go/geosite.dat
mv example/trojan-go.service /etc/systemd/system/trojan-go.service
if [ ! -f "/etc/trojan-go/config.json" ]; then
  mv example/sever.json /etc/trojan-go/config.json
fi
systemctl daemon-reload
systemctl reset-failed
echo -e "Trojan-go has been installed.\n"
echo -e "Trojan-go\t-> /usr/bin/trojan-go/trojan-go"
echo -e "config.json\t-> /etc/trojan-go/config.json"
