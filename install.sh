#!/bash/bin
if [ `whoami` != root ];
then
	echo "Run the script as root dumbass"
	exit
elif [ `whoami` = root ];
then
  bash stage1.sh
  bash stage2.sh
  bash stage3.sh
  bash stage4.sh
	exit
fi
