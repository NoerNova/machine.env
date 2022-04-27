#!/bin/bash
set -e

# Dotfiles
# Author: noernova
# Date: April 27, 2022
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "################################"
echo "### Dotfiles copying ... #######"
echo "################################"
echo ""

# SETUP Temp folder
SETUPDIR=$(pwd)
[ ! -d $SETUPDIR/temp ] && mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/temp

# dotfiles
echo "### dotfiles copying ... ####"
echo ""

cp $SETUPDIR/../dotfiles/.bash_aliases $HOME/
cp $SETUPDIR/../dotfiles/.p10k.zsh $HOME/

echo "Dotfiles are copied."

# ----------------------------------------------------------------------------