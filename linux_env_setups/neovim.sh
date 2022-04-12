#!/bin/bash
set -e

# NEOVIM
# Author: noernova
# Date: Jul 25, 2021
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

sudo apt update

# Install require modules and packages
sudo apt install ruby rubygems ruby-dev curl git gzip --yes


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

sudo apt install luajit --yes

# neovim
echo ""
echo ""
echo "### NEOVIM installing ... ###"
echo ""

cd $SETUPTEMP
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim

cp -r $SETUPDIR/../nvim $HOME/.config

# vim-plug
echo ""
echo ""
echo "### VIM-PLUG installing ... ###"
echo ""

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qa

# prettier and formatter
# reload npm
source ~/.zshrc
npm i -g eslint_d prettier

cd $SETUPDIR

# Clean temps
rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "NEOVIM, setup finished."

# ----------------------------------------------------------------------------------------------
