#!/bin/bash

echo " "
echo "Test the WiFi connection"

function testConnection()
{
#    echo "Test connection for network device $1"
    local it="indirizzo inet:"
    local en="inet addr:"
    local pattern_match=$it
    if ifconfig ${1} 2<&1 | grep -q "$pattern_match" ; then
        echo "true"
    else
        echo "false"
    fi  
}

if $(testConnection wlan0); then
    echo "*** The WiFi connection is OK ***"
else
    if $(testConnection eth0); then
        echo "*** The Eth connection is OK ***"
        exit
    else
        echo "    Problems with WiFi - Force down the: wlan0"
        ifdown --force wlan0
        sleep 1
        echo "    Restart the: wlan0"
        ifup wlan0
        sleep 1
    fi
fi


echo " "
echo "Please wait 5sec, a second test of WiFi is being processed"
sleep 5

if $(testConnection wlan0); then
    echo "*** The WiFi connection is OK ***"
else
    if $(testConnection eth0); then
        echo "*** The Eth connection is OK ***"
        exit
    else
        echo "    Problems with WiFi - Force down the: wlan0"
        ifdown --force wlan0
        sleep 1
        echo "    Restart the: wlan0"
        ifup wlan0
        sleep 1
    fi
fi

echo "END Test of the WiFi connection"
echo " "

exit
