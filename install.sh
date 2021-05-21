#!/bin/bash
if [ `whoami` != root ];
then
	echo "Run the script as root dumbass"
	exit
elif [ `whoami` = root ];
then
	cp home/pi/raspi-shell/.bashrc home/pi/.bashrc
	cp home/pi/raspi-shell/.aliasrc /home/pi
	cp home/pi/raspi-shell/default-dns /home/pi
	cp home/pi/raspi-shell/startup-dns /home/pi
	cp home/pi/raspi-shell/pihole-dns home/pi/etc/init.d/
	update-rc.d pihole-dns.sh defaults
	apt install vim python3-pip
	pip3 install bpytop --upgrade
	exit
fi
