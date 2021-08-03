#!/bin/bash

/usr/bin/curl --silent ipinfo.io/ip > /tmp/.newone.txt
publicIP=$(/usr/bin/cat /tmp/.newone.txt)

if [[ ! -e publicIP.txt ]]; then
	/usr/bin/echo 0 > /root/RPiAdress/.publicIP.txt;
fi

ancientIP=$(cat /root/RPiAdress/.publicIP.txt);

if [[ "$publicIP" != "$ancientIP" ]] ; then
	/usr/bin/echo $publicIP > /root/RPiAdress/.publicIP.txt ;
	commitName=$(/usr/bin/date|/usr/bin/cut -d" " -f5);
	cd /root/RPiAdress/;
	/usr/bin/git add . > /dev/null 2>&1;
	/usr/bin/git commit -m $commitName  > /dev/null 2>&1;
	/usr
