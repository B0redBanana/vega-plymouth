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
        sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/vega-plymouth-small/vega-plymouth-small.plymouth 100
        ;;
    2)
        echo "installing and registering medium version"
        cd $HOME/vega-plymouth
        sudo cp -r vega-plymouth-medium /usr/share/plymouth/themes/
        sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/vega-plymouth-medium/vega-plymouth-medium.plymouth 100
        ;;
    3)
        echo "installing and registering large version"
        cd $HOME/vega-plymouth/
        sudo cp -r vega-plymouth-large /usr/share/plymouth/themes/
        sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/vega-plymouth-large/vega-plymouth-large.plymouth 100
        ;;
esac

echo "Choose Theme"
sudo update-alternatives --config default.plymouth

echo "Creating New Initramfs"
create_new_initramfs() {
  if type update-initramfs &>/dev/null; then
    update-initramfs -u &>/dev/null  
  elif type mkinitcpio &>/dev/null; then
    mkinitcpio -P &>/dev/null
  else
    echo "Warning: Could not rebuild initramfs!"
  fi

  echo "Done!"
}