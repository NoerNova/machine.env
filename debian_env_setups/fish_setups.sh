#!/bin/bash
set -e

# Fish
# Author: noernova
# Date: Jan 5, 2023
# Contact: noernova.com
# Github: https://github.com/noernova
# =====================================================================

echo ""
echo "#######################"
echo "### Terminal Setups ###"
echo "#######################"
echo ""

# SETUP Temp folder
SETUPDIR=$(pwd)
[ ! -d $SETUPDIR/temp ] && mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/temp

# Update
echo ""
echo "### Updating ... ####"
echo ""

sudo apt update

# Install require modules and packages
sudo apt install ruby rubygems ruby-dev git --yes


# ----------------------------------------------------------------------------

# fish
echo ""
echo ""
echo "### Fish installing ... ###"
echo ""

sudo apt install fish gnome-terminal --yes

sudo chsh -s $(which fish)

# copy dotfiles
[ -f $HOME/.config/fish ] && rm -rf $HOME/.config/fish
cp -r $SETUPDIR/../fish $HOME/.config

# fisher plugin
cd $SETUPDIR
gnome-terminal -- fish $SETUPDIR/fisher_plugins.sh

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "Fish setup finished."

