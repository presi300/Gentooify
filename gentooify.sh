#!/bin/bash

whoami > "Etc-files/whoami.txt"

usr=$(cat "Etc-files/whoami.txt")

#Check if the user is root
if [ $usr != "root" ]; then  
    echo "This script needs to be executed as root to work!"  
    read pe
    exit
else 
    echo "ayyy lmao"
fi

#Check if git is installed
wget > /dev/null 2> /dev/null

if [ $? -eq 127 ]; then
    clear
    echo "This script requires wget to be installed, install wget and try again"
    exit
else
    echo "lmao"
fi

#Selection menu
while true
do
clear
echo "Welcome to the Gentooify script!"
echo -e "\n1. Install Gentooify\n2. What is this?\n3. Exit\n\n"

read -p "Select an option: " mqn

if [ $mqn -eq 1 ]; then             #Install
    clear
    break
elif [ $mqn -eq 2 ]; then           #Help
    less Etc-files/Help.txt
elif [ $mqn -eq 3 ]; then           #Exit
    clear
    echo "Press any key to exit..."
    clear
    exit 
else                                #Error
    clear
    echo "Error, unrecognized, press ENTER key to try again..."
    read pe
fi
done

while true
do
clear
echo -e "1. Install Gentooify with the recommended configuration\n2. Install Gentooify without any configuration\n\n"
read -p "Select an option: " ree

if [ $ree -eq 1 ]; then
    bash Etc-files/recconf.sh
    break
fi
done