#!/bin/bash
prjdir=$HOME/.vim-sessions
prjfiles=$(/bin/ls $prjdir | grep '\.vim$')
prjfiles=$(echo $prjfiles | sed -s 's/ / FALSE /g')
prjfiles=$(echo $prjfiles | sed -s 's/^/FALSE /')
prjfiles=$(echo $prjfiles | sed 's/\.vim$//')
selection=$(zenity --title="Prj-Open" --height="300"  --window-icon="/usr/share/pixmaps/vim.svg" --list --radiolist --column "Open" --column "Project" $prjfiles)
if [[ $selection == "" ]]
then
    echo "no file selected; aborting!"
    exit 1
else
    echo "opening $prjdir/$selection"".vim"
    gvim -S $prjdir/$selection".vim"
fi
exit 0
