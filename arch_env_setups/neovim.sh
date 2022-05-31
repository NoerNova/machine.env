#!/bin/bash
set -e

# NEOVIM docker - ubuntu image
# Author: noernova
# Date: April 27, 2022
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "##############"
echo "### NEOVIM ###"
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
sudo pacman -Sy ruby rubygems  curl git gzip

# Install more require moduleds by ubuntu running on docker
sudo pacman -Sy gcc cmake pkg-config libtool gettext

# ----------------------------------------------------------------------------

# Tree-Sitter
echo ""
echo "### TREE-SITTER installing ... ###"
echo ""

cd $SETUPTEMP
curl -LO https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.0/tree-sitter-linux-x64.gz
gzip -d tree-sitter-linux-x64.gz
sudo chmod +x tree-sitter-linux-x64
sudo mv tree-sitter-linux-x64 /usr/bin/tree-sitter

cd $SETUPDIR

# luajit
echo ""
echo ""
echo "### Luajit installing ... ####"
echo ""

sudo pacman -Sy luajit

# neovim
echo ""
echo ""
echo "### NEOVIM installing ... ###"
echo ""

# appImage not work, require fuselib
# so let self build and install
cd $SETUPTEMP
git clone https://github.com/neovim/neovim
cd neovim
sudo make CMAKE_BUILD_TYPE=Release install

# vim-plug
echo ""
echo ""
echo "### VIM-PLUG installing ... ###"
echo ""

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# back to root parent
cd $SETUPDIR/../

# ~/.config folder
[ ! -d ~/.config ] && mkdir ~/.config

# copy nvim files config directory to ~/.config
cp -r nvim ~/.config/

nvim +PlugInstall +qa

# exlint and prettier for neovim
# gnome-terminal -- npm i -g eslint_d prettier

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "NEOVIM, setup finished."

# ----------------------------------------------------------------------------------------------
