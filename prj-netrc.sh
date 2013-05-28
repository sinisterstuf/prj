#!/bin/bash

# Check for project name
if [[ -z $1 ]]
then
	echo "Missing project name!"
	echo "Syntax: prj-netrc <project name>"
	exit 1
else
	CONFIG_FILE="$HOME/Projects/Web/$1/details.conf"
fi

SECTION="ftp"

eval `sed -e 's/[[:space:]]*\=[[:space:]]*/=/g' \
    -e 's/;.*$//' \
    -e 's/[[:space:]]*$//' \
    -e 's/^[[:space:]]*//' \
    -e "s/^\(.*\)=\([^\"']*\)$/\1=\"\2\"/" \
   < $CONFIG_FILE \
    | sed -n -e "/^\[$SECTION\]/,/^\s*\[/{/^[^;].*\=.*/p;}"`

echo "machine $Site login $User password $Pass" >> $HOME/.netrc
echo "87.229.98.59 $Site" | sudo tee -a /etc/hosts
