#!/bin/bash
set -e

# RTL88x2BU Driver
# Author: noernova
# Date: April 27, 2022
# Contact: noernova.com
# Github: https://github.com/noernova
# Hardware: TP-Link Archer T4U V3
# Original folk from RinCat: https://github.com/RinCat/RTL88x2BU-Linux-Driver
# ===========================================================================

echo ""
echo ""
echo "#################################"
echo "### Wireless Driver RTL88x2BU ###"
echo "#################################"
echo ""

# SETUP Temp folder
SETUPDIR=$(pwd)
[ ! -d $SETUPDIR/temp ] && mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/temp

# Update
echo ""
echo "### Updating ... ####"
echo ""

sudo pacman -Syyu

# Install require modules and packages
sudo pacman -S git


# ----------------------------------------------------------------------------

# install requirement module for build
echo ""
echo "installing requirement module for build ..."
echo ""

sudo pacman -S bc base-devel

# Linux Kernel Header
echo ""
echo "installing linux header"
echo ""
sudo pacman -S linux-headers

# RTL88x2BU Driver (https://github.com/RinCat/RTL88x2BU-Linux-Driver)
echo ""
echo "installing driver ..."
echo ""
git clone https://github.com/RinCat/RTL88x2BU-Linux-Driver.git $SETUPTEMP/RTL88x2BU-Linux-Driver


cd $SETUPTEMP/RTL88x2BU-Linux-Driver
make clean
make
sudo make install

# USB 3.0 Support
sudo modprobe 88x2bu rtw_switch_usb_mode=1

cd $SETUPDIR

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "RTL88x2BU-Driver, setup finished."

# -----------------------------------------------------------------------------------------
