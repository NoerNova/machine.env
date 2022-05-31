#!/bin/bash
set -e

# ZSH, Prezto and Colorls
# Author: noernova
# Date: April 27, 2022
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

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

sudo pacman -Syyu

# Install require modules and packages
sudo pacman -Sy ruby rubygems git


# ----------------------------------------------------------------------------

# zsh
echo ""
echo ""
echo "### Zsh installing ... ####"
echo ""

sudo pacman -S zsh

# Prezto (https://github.com/sorin-ionescu/prezto)
echo ""
echo ""
echo "### Zprezto installing ... ####"
echo ""

[ ! -d ${ZDOTDIR:-$HOME}/.zprezto ] && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

cd $HOME/.zprezto
git pull
git submodule sync --recursive
git submodule update --init --recursive

# Colorls
echo ""
echo ""
echo "### Colorls installing ... ####"
echo ""

sudo pacman -Sy bc
gem install colorls

# copy dotfiles
[ -f $HOME/.zshrc ] && rm -r $HOME/.zshrc
cp $SETUPDIR/../dotfiles/.zshrc $HOME/.zshrc

[ -f $HOME/.zpreztorc ] && rm -r $HOME/.zpreztorc
cp $SETUPDIR/../dotfiles/.zpreztorc $HOME/.zpreztorc

sudo chsh -s $(which zsh)

cd $SETUPDIR

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "ZSH, Prezto and Colorls, setup finished."

# -----------------------------------------------------------------------------------------
