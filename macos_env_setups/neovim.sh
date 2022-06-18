#!/bin/bash
set -e

# NEOVIM
# Author: noernova
# Date: Nov 14, 2021
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


# tree-sitter
brew install tree-sitter

# luajit
brew install luajit --HEAD

# neovim
brew install neovim

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
# npm i -g eslint_d prettier

cd $SETUPDIR

# Clean temps
rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "NEOVIM, setup finished."

# ----------------------------------------------------------------------------------------------
