#!/bin/bash
set -e

# VSCode
# Author: noernova
# Date: April 27, 2022
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "##############"
echo "### VSCode ###"
echo "##############"
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

cd $SETUPTEMP
git clone https://AUR.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/

makepkg -s

sudo pacman -U visual-studio-code-bin-*.pkg.tar.zst

cd $SETUPDIR

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "VSCode, installation completed."

# -----------------------------------------------------------------------------------------
