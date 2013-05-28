#!/bin/bash

# Check for project name
if [[ -z $1 ]]
then
	echo "Missing project name!"
	echo "Syntax: prj-phpmyadmin <project name>"
	exit 1
else
	CONFIG_FILE="$HOME/Projects/Web/$1/details.conf"
fi

SECTION="sql"

eval `sed -e 's/[[:space:]]*\=[[:space:]]*/=/g' \
    -e 's/;.*$//' \
    -e 's/[[:space:]]*$//' \
    -e 's/^[[:space:]]*//' \
    -e "s/^\(.*\)=\([^\"']*\)$/\1=\"\2\"/" \
   < $CONFIG_FILE \
    | sed -n -e "/^\[$SECTION\]/,/^\s*\[/{/^[^;].*\=.*/p;}"`

chromium --app="http://$Site/"
echo -e "User: $User\nPass: $Pass"
