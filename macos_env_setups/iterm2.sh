#!/bin/bash
set -e

# iTerm2 fish tide fisher z exa zsh zprezto colorls tree git setups
# Author: noernova
# Date: Jan 5, 2023 
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
# brew install zsh


## # zprezto
## [ ! -d ${ZDOTDIR:-$HOME}/.zprezto ] && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
## cd $HOME/.zprezto
## git pull
## git submodule sync --recursive
## git submodule update --init --recursive

# fish
brew install fish

fish

# fisher plugin
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# tide plugin
fisher install IlanCosman/tide@v5

# exa
brew install exa

# z
fisher install jethrokuan/z

# colorls
sudo gem install colorls

# tree
brew install tree

# git
brew install git



## # copy dotfiles
## [ -f $HOME/.zshrc ] && rm -r $HOME/.zshrc
## cp $SETUPDIR/../dotfiles/.zshrc $HOME/.zshrc
## 
## [ -f $HOME/.zpreztorc ] && rm -r $HOME/.zpreztorc
## cp $SETUPDIR/../dotfiles/.zpreztorc $HOME/.zpreztorc
## 
## # iterm colors
## cp -R $SETUPDIR/../iterm2/colors $HOME/.config/iterm2/

cd $SETUPDIR

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "Fish setup finished."
d $SETUPDIR
