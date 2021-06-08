#!/bin/bash
# Checks for sudo or root access and only runs with root access
if [ `whoami` != root ];
then 
	echo "Run the script as root dumbass"
	exit
elif [ `whoami` = root ];
then
# Updates repositories and then applies any updates
	apt update
	apt upgrade -y
# Installs packages to complile doas along with vim and pip3
	apt install -y build-essential make bison flex libpam0g-dev vim python3-pip
# Applies personal aliases, bashrc, and profile
	cp /home/pi/new-pihole/.bashrc /home/pi/.bashrc
	cp /home/pi/new-pihole/.aliasrc /home/pi
	cp /home/pi/new-pihole/.profile /home/pi/.profile
# Used to add dns files to home directory for pihole-dns.sh
	cp /home/pi/new-pihole/default-dns /home/pi
	cp /home/pi/new-pihole/startup-dns /home/pi
	cp /home/pi/new-pihole/pihole-dns.sh /home/pi/etc/init.d
# Sets script as executable
# Update: Command does not function as intended.  Run manually.
	# chmod a+x /home/pi/etc/init.d/pihole-dns.sh
# Allows script to run at boot
# Update: Command does not function as intended.  Run manually.
	# update-rc.d pihole-dns.sh defaults
# Installs bpytop
	pip3 install bpytop --upgrade
# Clones doas repository into home directory
	git clone https://github.com/slicer69/doas /home/pi/doas
# Builds and installs doas
	make --directory /home/pi/doas
	make --directory /home/pi/doas install
# Clones Pi-hole repository into home
	git clone --depth 1 https://github.com/pi-hole/pi-hole.git /home/pi/Pi-hole
# Installs tldr
	mkdir -p /home/pi/bin
	curl -o /home/pi/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
	chmod +x /home/pi/bin/tldr
# Sets new bashrc and alias settings
	source /home/pi/.bashrc
	source /home/pi/.aliasrc
# Runs install script for Pi-hole
	bash /home/pi/Pi-hole/automated\ install/basic-install.sh
	echo "Remember to delete this repository after this script finishes"
	exit
fi
