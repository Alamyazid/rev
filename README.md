# sc
# How to update kernel in debian 10 to 5.10
edit list:
nano /etc/apt/sources.list
then, add this :
deb https://deb.debian.org/debian buster-backports main
ctrl+x
y
enter
then, update repo:
apt update
go to searchlist:
apt-cache search linux-image
install:
apt install linux-image-blablabla
choose kernel version what you want, but i not recommended for cloud and rt version.
after install, then reboot.
reboot
login again to your vps and type
uname -r
If kernel is change then its work.
after this you can install autoscript
