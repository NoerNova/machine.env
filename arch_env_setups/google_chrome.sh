#!/bin/bash
set -e

# Google Chrome
# Author: noernova
# Date: April 27, 2022
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "#####################"
echo "### GOOGLE CHROME ###"
echo "#####################"
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

echo "Google Chrome ..."

cd $SETUPTEMP
git clone https://AUR.archlinux.org/google-chrome.git
cd google-chrome

makepkg -si

sudo pacman -U google-chrome-*.pkg.tar.zst

cd $SETUPDIR

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "Google Chrome, installation completed."

# -----------------------------------------------------------------------------------------
