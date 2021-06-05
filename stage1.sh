#!/bin/bash
if [ `whoami` != root ];
then
	echo "Run the script as root dumbass"
	exit
elif [ `whoami` = root ];
then
	apt update && apt upgrade -y
	apt install -y build-essential make bison flex libpam0g-dev
	exit
fi
