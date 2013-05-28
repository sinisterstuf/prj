#!/bin/bash

# Check for project short name or -h / --help flag
if [[ -z $1 ]]
then
    echo "Syntax: prj-new <short name> [nice name]"
	exit 1
else
    if [[ $1 == "-h"  || $1 == "--help" ]]
    then
        echo "Syntax: prj-new <short name> [nice name]"
        exit 1
    else
        name="$1"
    fi
fi

# Check for project nice name
if [[ -z $2 ]]
then
	nicename="$1"
else
    nicename="$2"
fi

prjdir="$HOME/Projects/Web/$name"
conffile="details.conf"

mkdir $prjdir
cd $prjdir
echo "[general]" > $conffile
echo "Name = $nicename" >> $conffile
mkdir www
prj-link "$name"
if [[ $? == 0 ]]
then
    echo "Linked = True" >> $conffile
fi
git init
git add .
