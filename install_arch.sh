#!/usr/bin/env bash

# An installer for the VEGA plymouth theme by BoredBanana
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



echo "Pick a size to install:"
read -p "1: small (270x270px), 2: medium (540x540px), 3: large (1080x1080px): " size_select
if test -z "$size_select";
then
    size_select=1
fi
case "$size_select" in
    1)
        echo "installing and registering small version"
        cd $HOME/vega-plymouth/
        sudo cp -r vega-plymouth-small /usr/share/plymouth/themes/
        sudo plymouth-set-default-theme -R vega-plymouth-small
        ;;
    2)
        echo "installing and registering medium version"
        cd $HOME/vega-plymouth
        sudo cp -r vega-plymouth-medium /usr/share/plymouth/themes/
        sudo plymouth-set-default-theme -R vega-plymouth-medium
        ;;
    3)
        echo "installing and registering large version"
        cd $HOME/vega-plymouth/
        sudo cp -r vega-plymouth-large /usr/share/plymouth/themes/
        sudo plymouth-set-default-theme -R vega-plymouth-large
        ;;
esac



echo "Done!"