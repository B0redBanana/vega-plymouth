#!/usr/bin/env bash

# Time to start the installer!
clear

echo "Enter Plymouth install location"
read -e -p "Default - /usr/share/Plymouth/: " location
if test -z "$location";
then
    location="/usr/share/Plymouth/"
fi
if test "${location: -1}" != "/"
then
    location="$location/"
fi

DIR=$(pwd)

read -p "1: Arch, 2: Debian: " DISTRO

case $DISTRO in
            echo "Pick A Size to Install:"
            read -p "1: Small (270x270px), 2: Medium (540x540px), 3: Large (1080x1080px): " size_select
            if test -z "$size_select";
            then
                size_select=1
            fi
            case "$size_select" in
            1)
                echo "Installing Small Version"
                cd $DIR/vega
                sudo cp -r vega-small /usr/share/plymouth/themes/
                sudo plymouth-set-default-theme -R vega-small
                ;;
            2)
                echo "Installing Medium Version"
                cd $DIR/vega
                sudo cp -r vega-medium /usr/share/plymouth/themes/
                sudo plymouth-set-default-theme -R vega-medium
                ;;
            3)
                echo "Installing Large Version"
                cd $DIR/vega
                sudo cp -r vega-large /usr/share/plymouth/themes/
                sudo plymouth-set-default-theme -R vega-large
                ;;
            esac
            ;;

        2)

            echo "Pick a size to install:"
            read -p "1: Small (270x270px), 2: Medium (540x540px), 3: Large (1080x1080px): " size_select
            if test -z "$size_select";
            then
                size_select=1
            fi

            case "$size_select" in
                1)
                    echo "Installing Small Version"
                    cd $DIR/vega
                    sudo cp -r vega-small /usr/share/plymouth/themes/
                    sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/vega-small/vega-small.plymouth 100
                    ;;
                2)
                    echo "Installing Medium Version"
                    cd $DIR/vega
                    sudo cp -r vega-medium /usr/share/plymouth/themes/
                    sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/vega-medium/vega-medium.plymouth 100
                    ;;
                3)
                    echo "Installing Large Version"
                    cd $DIR/vega
                    sudo cp -r vega-large /usr/share/plymouth/themes/
                    sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/vega-large/vega-large.plymouth 100
                    ;;
            esac
            
            
                echo "Choose Theme"
                sudo update-alternatives --config default.plymouth

                echo "Refreshing Initramfs"
                create_new_initramfs() {
                if type update-initramfs &>/dev/null; then
                    update-initramfs -u &>/dev/null  
                elif type mkinitcpio &>/dev/null; then
                    mkinitcpio -P &>/dev/null
                else
                    echo "Warning: Could not rebuild initramfs!"
                fi
                }

esac

echo "Done!"