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

sudo apt install fish --yes

sudo chsh -s $(which fish)

fish

# fisher plugin
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# tide plugin
fisher install IlanCosman/tide@v5

# exa
sudo apt install exa --yes

# z
fisher install jethrokuan/z

# copy dotfiles
[ -f $HOME/.config/fish ] && rm -rf $HOME/.config/fish
cp -r $SETUPDIR/../fish $HOME/.config

cd $SETUPDIR

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "Fish setup finished."

