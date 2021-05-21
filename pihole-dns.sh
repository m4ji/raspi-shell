#!/bin/bash
### BEGIN INIT INFO
# Provides:          Pi-hole DNS resolution during a startup after a power failure.
# Required-Start:    $network $remote_fs $syslog
# Required-Stop:     $network $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:
# Description:       This script will install a Google DNS nameserver in /etc/resolv.conf
#                    until the Pi-hole has a chance to start working, then it will switch
#                    DNS back to localhost 127.0.0.1 so DNS resolution comes from the Pi-hole.
### END INIT INFO
echo "Setting up Google for Startup DNS"
cp /home/pi/startup-dns /etc/resolv.conf
echo "Waiting 1 minute"
sleep 1m
echo "Testing Internet connection and DNS resolution is ok..."
wget -q --spider http://google.com

if [ $? -eq 0 ]; then
    echo "Online"
    echo "Changing back to our default Pi-hole resolver..."
    cp /home/pi/default-dns /etc/resolv.conf
    echo "Done"
else
    echo "Offline"
    echo "Sorry, please try logging into the Pi-hole Admin interface and setting a normal resolver there. Once it starts working, put it back to 127.0.0.1#5300"
fi
