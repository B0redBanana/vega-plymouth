<h1 align="center">VEGA Plymouth Theme</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Maintained%3F-Yes-green?style=for-the-badge">
  <img src="https://img.shields.io/github/issues/B0redBanana/vega-plymouth?color=violet&style=for-the-badge">
</p>

<p align="center">
A plymouth animation, derived from <a href="https://vega-gaming.de/">VEGA Gaming's</a> logo.

![gif](https://github.com/B0redBanana/vega-plymouth/blob/8697b7d5202bf335ef6f1677ece687d5e6515028/preview/logo.gif)
</p>

### What is plymouth?

[Plymouth](http://www.freedesktop.org/wiki/Software/Plymouth) is a project from Fedora and now listed among the [freedesktop.org's official resources](https://www.freedesktop.org/wiki/Software/#graphicsdriverswindowsystemsandsupportinglibraries) providing a flicker-free graphical boot process. It relies on [kernel mode setting](https://wiki.archlinux.org/index.php/Kernel_mode_setting) (KMS) to set the native resolution of the display as early as possible, then provides an eye-candy splash screen leading all the way up to the login manager.

### How to set it up?

[Click here](https://wiki.archlinux.org/index.php/plymouth) for an article on the Archwiki and [here](https://wiki.ubuntu.com/Plymouth) for the Ubuntuwiki.

### How to get these themes?

**Download manually** 

**or clone using:**
```bash
git clone https://github.com/B0redBanana/vega-plymouth.git
```

### How to use these themes?

**Install using the script** 
Once it's downloaded or cloned run the install for your distro and follow the instructions. It'll ask you for the path and preferred size!

**Install manually** (We're using the small version in this case, replace small with either medium or large, if desired)

+ For **Arch-based** distros
```bash
# Make sure the Plymouth pakcage is installed

# Copying the theme into Plymouth's folder
sudo cp -r vega-plymouth-small /usr/share/plymouth/themes/

# Set the theme as default
sudo plymouth-set-default-theme -R vega-plymouth-small

```
+ For **Debian** based distros
```bash
# Install Plymouth
sudo apt install plymouth

# Copying the theme into Plymouth's folder
sudo cp -r vega-plymouth-small /usr/share/plymouth/themes/

# Install the theme
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/vega-plymouth-small/vega-plymouth-small.plymouth 100

# Choose the theme you want to use
sudo update-alternatives --config default.plymouth

# Then udate initramfs
sudo update-initramfs -u
``` 



### Important info
+ This was created with a resolution of 1920x1080
+ Feel free to leave suggestions or report any issues!