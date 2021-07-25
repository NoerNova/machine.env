#!/bin/sh
set -e
# set -o errexit -o pipefail
# Linux Setups
# Author noernova
# Date: Jul 25, 2021
# Contact noernova.com
# Github https://github.com/noernova
# ===================================================================================

# List of Content
#   1. Update && Upgrade
#   	1.1. Update and Upgrade system
#	1.2. install require modules and packages
#   2. Wireless Driver
#   3. Terminal setups
#     3.1. Zsh
#     3.2. Prezto (https://github.com/sorin-ionescu/prezto)
#     3.3. Colorls (https://github.com/athityakumar/colorls)
#   4. nvm & nodejs
#     4.1. nvm
#     4.2. nodejs
#   5. nvim
#     5.1. tree-sitter
#     5.2. luajit
#     5.3. neovim
#     5.4. vimplug
#   6. Other files
#     6.1. dotfiles
#     6.2. fonts
#        6.2.1. MesloLGS
#        6.2.2. Cascadia-Code
#   7. Finished

# ====================================================================================

# 0. Greeting #
###############
echo ""
echo ""
echo "###################"
echo "### HELLO WORLD ###"
echo "###################"
echo ""
echo ""

# SETUP Temp folder
SETUPDIR=$(pwd)
mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/temp

# ------------------------------------------------------------------------------------

# 1. Update && Upgrade #
echo "### Updating ... ###"
echo ""

# 1.1. Update and Upgrade system
sudo apt update

# 1.2. Install require modules and packages
sudo apt install ruby rubygems ruby-dev curl git gzip --yes

# ------------------------------------------------------------------------------------

# 2. Wireless Driver RTL88x2BU #
################################
echo ""
echo ""
echo "#################################"
echo "### Wireless Driver RTL88x2BU ###"
echo "#################################"
echo ""

# - TP-Link Archer T4U V3
#
# install requirement module for build
sudo apt install bc build-essential --yes

# Linux Kernel Header
sudo apt install linux-headers-$(uname -r)

# RTL88x2BU Driver (https://github.com/RinCat/RTL88x2BU-Linux-Driver)
git clone https://github.com/RinCat/RTL88x2BU-Linux-Driver.git $SETUPTEMP/RTL88x2BU-Linux-Driver

cd $SETUPTEMP/RTL88x2BU-Linux-Driver
make clean
make
sudo make install

# USB 3.0 Support
sudo modprobe 88x2bu rtw_switch_usb_mode=1

cd $SETUPDIR

# ---------------------------------------------------------------------------------------

# 3. Terminal Setup #
#####################
echo ""
echo ""
echo "#######################"
echo "### Terminal Setups ###"
echo "#######################"
echo ""

# 3.1. zsh
echo ""
echo ""
echo "### Zsh installing ... ####"
echo ""

sudo apt install zsh --yes

# 3.2. Prezto (https://github.com/sorin-ionescu/prezto)
echo ""
echo ""
echo "### Zprezto installing ... ####"
echo ""

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

cd $HOME/.zprezto
git pull
git submodule sync --recursive
git submodule update --init --recursive

# 3.3. Colorls
echo ""
echo ""
echo "### Colorls installing ... ####"
echo ""

sudo gem install colorls

# copy dotfiles
cp $SETUPDIR/dotfiles/.zshrc $HOME/.zshrc
cp $SETUPDIR/dotfiles/.zpreztorc $HOME/.zpreztorc
sudo chsh -s /bin/zsh

# -----------------------------------------------------------------------------------------

# 4. NVM && NODEJS #
####################
echo ""
echo ""
echo "######################"
echo "### NVM && NODEJS ####"
echo "######################"
echo ""

# 4.1. Install nvm
echo "### NVM installing ... ####"
echo ""

cd $SETUPDIR/temp
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# 4.2. Install lastest nodejs
echo ""
echo ""
echo "### NODEJS installing ... ####"
echo ""

nvm install node

# -----------------------------------------------------------------------------------------

# 5. NeoVim #
#############
echo ""
echo ""
echo "##############"
echo "### NEOVIM ###"
echo "##############"
echo ""

# 5.1. Tree-Sitter
echo "### TREE-SITTER installing ... ###"
echo ""

cd $SETUPTEMP
curl -LO https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.0/tree-sitter-linux-x64.gz
gzip -d tree-sitter-linux-x64.gz
sudo chmod +x tree-sitter-linux-x64
sudo mv tree-sitter-linux-x64 /usr/bin/tree-sitter

cd $SETUPDIR

# 5.2. luajit
echo ""
echo ""
echo "### Luajit installing ... ####"
echo ""

sudo apt install luajit --yes

# 5.3. neovim
echo ""
echo ""
echo "### NEOVIM installing ... ###"
echo ""

cd $SETUPTEMP
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim

cp -r $SETUPDIR/nvim $HOME/.config

# 5.4 vim-plug
echo ""
echo ""
echo "### VIM-PLUG installing ... ###"
echo ""

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +PlugInstall +qa

cd $SETUPDIR

# ----------------------------------------------------------------------------------------------

# 6. Other files #
####################
echo ""
echo ""
echo "################################"
echo "### Other files copying ... ####"
echo "################################"
echo ""

# 6.1. dotfiles
echo "### dotfiles copying ... ####"
echo ""

cp $SETUPDIR/dotfiles/.bash_aliases $HOME/
cp $SETUPDIR/dotfiles/.p10k.zsh $HOME/

# 6.2. fonts
echo "### fonts copying ... ####"

# 6.2.1. MesloLGS
sudo mkdir /usr/share/fonts/truetype/MesloLGS
sudo cp $SETUPDIR/fonts/MesloLGS/*.ttf /usr/share/fonts/truetype/MesloLGS

# 6.2.2. Cascadia-Code
sudo mkdir /usr/share/fonts/truetype/CascadiaCode
sudo cp $SETUPDIR/fonts/CascadiaCode/*.ttf /usr/share/fonts/truetype/CascadiaCode

# ----------------------------------------------------------------------------------------------

# 7. Finishing #
################
echo ""
echo ""
echo "#############################"
echo "### Finishing setups ... ####"
echo "#############################"
echo ""

ORANGE='\033[0;33m'
NC='\033[0m' # No Color

# Clean temps
rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

read -p "$(echo ${ORANGE}"Reboot may require, reboot now?"${NC}, "(y/n): " )" yn
case $yn in                                                                                                     
  [Yy]* ) sudo reboot; break;;                                                                                         
  [Nn]* ) echo "Incase any setup not work pls manualy reboot and try again, happy hacking... ;)"; exit;;                                                   
  * ) echo "finished setups, happy hacking... ;)"; exit;;                                                        
esac     

