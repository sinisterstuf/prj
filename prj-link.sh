#!/bin/bash

# Check for project name
if [[ -z $1 ]]
then
	echo "Syntax: prj-link 'name'"
	exit
else
	name="$1"
fi

prjsource="$HOME/Projects/Web/$name"
wwwsource="$prjsource/www"
dest="$HOME/Projects/Web/www/$name"

if [ ! -e "$prjsource" ]
then
	echo "project does not exist"
	exit 1
elif [ ! -e "$wwwsource" ]
then
	echo "project has no web directory"
	exit 2
elif [ -h "$dest" ]
then
	echo "project already linked"
	exit 3
elif [ -e "$dest" ]
then
	echo "some file exists at the destination"
	exit 4
else
	# do the link
	ln -s $wwwsource $dest
	echo "linked"
fi

# success
exit 0
