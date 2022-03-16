#!/bin/bash
set -e

# iTerm2 zsh zprezto colorls tree git setups
# Author: noernova
# Date: Nov 14, 2021 
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "#######################"
echo "### iTerm2 ###"
echo "#######################"
echo ""

# SETUP Temp folder
SETUPDIR=$(pwd)
[ ! -d $SETUPDIR/temp ] && mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/tem

# iTerm2
brew install --cask iterm2

# zsh
brew install zsh

# zprezto
[ ! -d ${ZDOTDIR:-$HOME}/.zprezto ] && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
cd $HOME/.zprezto
git pull
git submodule sync --recursive
git submodule update --init --recursive

# starship
brew install starship

# colorls
sudo gem install colorls

# tree
brew install tree

# git
brew install git

# copy dotfiles
[ -f $HOME/.zshrc ] && rm -r $HOME/.zshrc
cp $SETUPDIR/../dotfiles/.zshrc $HOME/.zshrc

[ -f $HOME/.zpreztorc ] && rm -r $HOME/.zpreztorc
cp $SETUPDIR/../dotfiles/.zpreztorc $HOME/.zpreztorc

# iterm colors
cp -R $SETUPDIR/../iterm2/colors $HOME/.config/iterm2/
