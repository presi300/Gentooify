#!/bin/bash
st3t=$(ls /home | grep "stage3")
clear
ls /home | grep "stage3"

if [ $? -eq 0 ];then
    while true
    do
    clear
    echo -e "An existing stage3 tarball was detected!\n"
    read -p "Do you want to delete it and download a new one? [y/n]: " yn

    if [ $yn == "y" ];then
        echo "Deleting... "
        rm /home/$st3t
        break
    elif [ $yn == "n" ];then
        clear   
        mkdir /home/Gentooify
        if [ $? != 0 ]; then
            clear
            echo -e "An existing Gentooify instalation was detected!\nDo you want to overwrite it with a clean one or exit?\n\n1. Delete it\n2. Exit\n\n"
            read -p "Enter choice: " ovr
            if [ $ovr == 1 ]; then
                clear
                echo "Deleting..." 
                rm -r /home/Gentooify
                read -p "Press ENTER to continue (This might return you to 'An existing stage3 was detected')..." pe
            elif [ $ovr == 2 ]; then
                clear
                exit #It's too late so it exits for testing purposes
            fi
        fi
        clear
        echo -e "Extracting existing stage3 tarball...\n"
        tar -xpf /home/$st3t -C /home/Gentooify
        exit
        
       
    else
        clear
        read -p "Error, unrecognized, press ENTER key to try again..." pe
    fi
    done
fi
echo "\nChecking stage3 builds..."
wget --quiet https://gentoo.osuosl.org/releases/amd64/autobuilds/latest-stage3-amd64-openrc.txt
st3=$(awk '{print $1;}' latest-stage3-amd64-openrc.txt | grep stage3)

echo -e "\nDownloading stage3 tarball...\n"
wget https://mirror.bytemark.co.uk/gentoo//releases/amd64/autobuilds/$st3 -q --show-progress -P /home


mkdir /home/Gentooify
if [ $? != 0 ]; then
    clear
    echo -e "An existing Gentooify instalation was detected!\nDo you want to overwrite it with a clean one or exit?\n\n1. Delete it\n2. Exit\n\n"
    read -p "Enter choice: " ovr
    if [ $ovr == 1 ]; then
        clear
        echo "Deleting..." 
        rm -r /home/Gentooify

    elif [ $ovr == 2 ]; then
        clear
        exit
    fi
fi
echo -e "Extracting stage3 tarball...\n"
mkdir /home/Gentooify
tar -xpf /home/$st3t -C /home/Gentooify

