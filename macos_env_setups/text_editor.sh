#!/bin/bash

# Text_editor setups
# Author: noernova
# Date: Nov 14, 2021 
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "#######################"
echo "### Sublime-Text VSCode NeoVim ###"
echo "#######################"
echo ""

# sublime-text
[ ! -d /Applications/Sublime\ Text.app ] && brew install --cask sublime-text

# vscode
[ ! -d /Applications/Visual\ Studio\ Code.app ] && brew install --cask visual-studio-code

echo "Sublime-Text and VSCode are setups."
