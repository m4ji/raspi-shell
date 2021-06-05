#!/bin/bash
if [ `whoami` != root ];
then
	echo "Run the script as root dumbass"
	exit
elif [ `whoami` = root ];
then
	cp ~/new-pihole/.bashrc ~/.bashrc
	cp ~/new-pihole/.aliasrc ~
	cp ~/new-pihole/default-dns ~
	cp ~/new-pihole/startup-dns ~
	cp ~/new-pihole/pihole-dns ~/etc/init.d/
	chmod a+x ~/etc/init.d/pihole-dns.sh
	update-rc.d pihole-dns.sh defaults
	apt install -y vim python3-pip
	pip3 install bpytop --upgrade
	exit
fi
