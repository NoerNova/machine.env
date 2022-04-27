#!/bin/bash
set -e

# Brave Browser
# Author: noernova
# Date: April 27, 2022
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "######################"
echo "### Brave Browser ###"
echo "######################"
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

echo "Brave Browser ..."

cd $SETUPTEMP
git clone https://AUR.archlinux.org/brave-bin.git
cd brave-bin

makepkg -si

sudo pacman -U brave-bin-*.pkg.tar.zst

cd $SETUPDIR

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "Brave Browser, installation completed."
# ----------------------------------------------------------------------------
