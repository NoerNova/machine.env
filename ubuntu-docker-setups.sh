#!/bin/sh
set -e

# Ubuntu Docker Setups
# Author noernova
# Date: Jul 25, 2021
# Contact noernova.com
# Github https://github.com/noernova
# ===================================================================================

# List of Content
#   1. Terminal setups
#     1.1. Zsh
#     1.2. Prezto (https://github.com/sorin-ionescu/prezto)
#     1.3. Colorls (https://github.com/athityakumar/colorls)
#   2. nvm & nodejs
#     2.1. nvm
#     2.2. nodejs
#   3. nvim
#     3.1. tree-sitter
#     3.2. luajit
#     3.3. neovim
#     3.4. vimplug
#   4. Other files
#     4.1. dotfiles
#     4.2. fonts
#        4.2.1. MesloLGS
#        4.2.2. Cascadia-Code
#   5. Finish and cleam temps
#  # ====================================================================================

# 0. Greeting #
###############
echo ""
echo ""
echo "###################"
echo "### HELLO WORLD ###"
echo "###################"
echo ""
echo ""

# ------------------------------------------------------------------------------------

# SETUP Temp folder
SETUPDIR=$(pwd)/linux_env_setups
[ ! -d $SETUPDIR/temp ] && mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/temp

cd $SETUPDIR

#   1. Terminal setups
./zsh_setups.sh

#   2. nvm & nodejs
./nvm_nodejs.sh

#   3. neovim
./neovim_docker.sh

#   4. Other files
#     4.1. dotfiles
./dotfiles.sh
#     4.2. fonts
./fonts.sh

#   5. Finished and Clean temps
rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

#   6. Others
#     6.1. batcat
sudo apt install bat

echo "Finish setups, happy hacking..."

# -------------------------------------------------------------------------------------
