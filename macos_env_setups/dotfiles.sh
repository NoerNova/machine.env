#!/bin/bash
set -e

# Dotfiles
# Author: noernova
# Date: Jul 25, 2021
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

# tmux
cp -r $SETUPDIR/../dotfiles/.tmux $HOME/
cp $SETUPDIR/../dotfiles/.tmux.conf.* $HOME/
# cp $SETUPDIR/../dotfiles/.p10k.zsh $HOME/
# cp $SETUPDIR/../dotfiles/.projectman $HOME/

echo "Dotfiles are copied."

# ----------------------------------------------------------------------------
