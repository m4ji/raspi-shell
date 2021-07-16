#!/bin/bash
# Checks for sudo or root access and only runs with root access
if [ `whoami` != root ];
then 
	echo "Run the script as root dumbass"
	exit
elif [ `whoami` = root ];
then
# Updates repositories and then applies any updates
	apt update && apt upgrade -y
# Installs packages to complile doas along with vim and pip3
	apt install -y build-essential make bison flex libpam0g-dev vim python3-pip
# Applies personal aliases, bashrc, and profile
	cp /home/pi/new-pihole/.bashrc /home/pi/.bashrc
	cp /home/pi/new-pihole/.aliasrc /home/pi/
	cp /home/pi/new-pihole/.profile /home/pi/.profile
# Used to add dns files to home directory for pihole-dns.sh
	cp /home/pi/new-pihole/default-dns /home/pi/
	cp /home/pi/new-pihole/startup-dns /home/pi/
	cp /home/pi/new-pihole/pihole-dns.sh /home/pi/etc/init.d
# Installs bpytop
	pip3 install bpytop --upgrade
# Clones doas repository into home directory
	git clone https://github.com/slicer69/doas /home/pi/doas
# Perfoms a build and install for doas and then removes build files
	make --directory /home/pi/doas
	make --directory /home/pi/doas install
	make --directory /home/pi/doas clean
# Downloads pihole installer
	curl -sSL https://install.pi-hole.net | bash
# Installs tldr
	sudo wget -qO /usr/local/bin/tldr
	sudo chmod +x /usr/local/bin/tldr
# Sets new bashrc and alias settings
	source /home/pi/.aliasrc && source /home/pi/.bashrc
# Runs install script for Pi-hole
	bash /home/pi/basic-install.sh
	echo "Remember to delete this repository after this script finishes and the following commands"
	echo "chmod a+x ~/etc/init.d/pihole.dns && sudo update-rc.d pihole-dns.sh"
	echo "wget https://github.com/sharkdp/bat/releases/download/v0.18.2/bat_0.18.2_arm64.deb"
	exit
fi
