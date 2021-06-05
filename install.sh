#!/bin/bash
if [ `whoami` != root ];
then
	echo "Run the script as root dumbass"
	exit
elif [ `whoami` = root ];
then
	apt update
	apt upgrade -y
	apt install -y build-essential make bison flex libpam0g-dev vim python3-pip
	cp /home/pi/new-pihole/.bashrc /home/pi/.bashrc
	cp /home/pi/new-pihole/.aliasrc /home/pi
	cp /home/pi/new-pihole/.profile /home/pi/.profile
	cp /home/pi/new-pihole/default-dns /home/pi
	cp /home/pi/new-pihole/startup-dns /home/pi
	cp /home/pi/new-pihole/pihole-dns.sh /home/pi/etc/init.d
	chmod a+x /home/pi/etc/init.d/pihole-dns.sh
	update-rc.d pihole-dns.sh defaults
	pip3 install bpytop --upgrade
	git clone https://github.com/slicer69/doas /home/pi/doas
	make --directory /home/pi/doas
	make --directory /home/pi/doas install
	git clone --depth 1 https://github.com/pi-hole/pi-hole.git /home/pi/Pi-hole
	mkdir -p /home/pi/bin
	curl -o /home/pi/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
	chmod +x /home/pi/bin/tldr
	source /home/pi/.bashrc
	source /home/pi/.aliasrc
	bash /home/pi/Pi-hole/automated\ install/basic-install.sh
	exit
fi
