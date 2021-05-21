#!/bin/bash
if [ `whoami` != root ];
then
	echo "Run the script as root dumbass"
	exit
elif [ `whoami` = root ];
then
	apt update && apt upgrade -y
	apt install build-essential make bison flex libpam0g-dev
	chmod a+x stage2.sh stage3.sh stage4.sh
	exit
fi
