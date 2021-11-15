#!/bin/bash
set -e

# initial MacOS setup
# Author: noernova
# Date: Nov 14, 2021 
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "#######################"
echo "### Homebrew ###"
echo "#######################"
echo ""

# Homebrew setups
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
   test -d "${xpath}" && test -x "${xpath}" ; then
   echo "command line tools are already installed, skip."
else
   sudo xcode-select --install
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


# incase PATH not setup in .zshrc
# echo 'PATH="/opt/homebrew/bin:$PATH"' >> ~/.bash_profile
# source ~/.bash_profile

# echo 'PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
# source ~/.zshrc

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


# Enable Key Repeating
defaults write -g ApplePressAndHoldEnabled -bool false