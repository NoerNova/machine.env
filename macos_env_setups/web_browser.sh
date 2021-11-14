#!/bin/bash

# Web_browser setups
# Author: noernova
# Date: Nov 14, 2021 
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "#######################"
echo "### Brave, Firefox, Google-Chrome ###"
echo "#######################"
echo ""

# Brave-browser
[ ! -d /Applications/Brave\ Browser.app ] && brew install --cask brave-browser

# Firefox
[ ! -d /Applications/Firefox.app ] && brew install --cask firefox

# Google-Chrome
[ ! -d /Applications/Google\ Chrome.app ] && brew install --cask google-chrome

echo "Brave, Firefox and Google-Chrome are setups."
