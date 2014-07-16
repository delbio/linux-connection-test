#!/bin/bash

echo " "
echo "Test the WiFi connection"
if ifconfig wlan0 | grep -q "inet addr:" ; then
        echo "*** The WiFi connection is OK ***"
else
	if ifconfig eth0 | grep -q "inet addr:" ; then
		echo "*** The Eth connection is OK ***"
		exit		
	fi

        echo "    Problems with WiFi - Force down the: wlan0"
        ifdown --force wlan0
        sleep 1
        echo "    Restart the: wlan0"
        ifup wlan0
        sleep 1
fi

echo " "
echo "Please wait 5sec, a second test of WiFi is being processed"
sleep 5
if ifconfig wlan0 | grep -q "inet addr:" ; then
        echo "*** The WiFi connection is OK ***"
else
	if ifconfig eth0 | grep -q "inet addr:" ; then
		echo "*** The Eth connection is OK ***"
		exit		
	fi

        echo "    Problems with WiFi - Force down the: wlan0"
        ifdown --force wlan0
        sleep 1
        echo "    Restart the: wlan0"
        ifup wlan0
        sleep 1
fi

echo "END Test of the WiFi connection"
echo " "

exit
