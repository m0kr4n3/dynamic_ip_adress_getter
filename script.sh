#!/bin/bash

if [[ $# -eq 0 ]]; then
        echo -e "[-] Usage : $0 <the private git repository to push your public ip>\n ex : $0  ~/RPI_address"
        exit
fi;
current_dir="$PWD"
dir="$1"


# Making the path absolute
if [[ ! "${dir:0:1}" == "/" ]]; then
        dir="$PWD/$dir";
fi;

# Testing if the directory is a real git repository
if [[ ! -d "$dir/.git" ]]; then
        echo -e "no such git repository : $1/.git"
        exit
fi;

# Fetching the public ip address
publicIP=$(/usr/bin/curl --silent ipinfo.io/ip)

#initiating the current ip address to 0 if it doesn't exist, in order to write on it
if [[ ! -e "$dir/publicIP.txt" ]]; then
	/usr/bin/echo 0 > "$dir/publicIP.txt";
fi

ancientIP=$(cat "$dir/publicIP.txt");

if [[ "$publicIP" != "$ancientIP" ]] ; then
	/usr/bin/echo $publicIP > "$dir/publicIP.txt" ;
	commitName=$(/usr/bin/date|/usr/bin/cut -d" " -f4);
	cd "$dir";
	/usr/bin/git add . > /dev/null 2>&1;
	/usr/bin/git commit -m $commitName  > /dev/null 2>&1;
	/usr/bin/git push origin main > /dev/null 2>&1;
	cd "$current_dir";
	echo "Public ip address is successfully uploaded !"
fi;

