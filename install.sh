#!/bin/bash
if [ `whoami` != root ];
then
	echo "Run the script as root dumbass"
	exit
elif [ `whoami` = root ];
then
	chmod a+x stage1.sh stage2.sh stage3.sh stage4.sh
	bash stage1.sh
	bash stage2.sh
	bash stage3.sh
	bash stage4.sh
	exit
fi
