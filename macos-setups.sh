#!/bin/sh
set -e

# Linux Setups
# Author noernova
# Date: Nov 14, 2021
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
#   5. Text Editor
#     5.1. VSCode
#     5.2. Sublime-Text
#   6. Web Browser
#     6.1. Google-Chrome
#     6.2. Brave
#   7. Finished
#   8. Others

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

# ------------------------------------------------------------------------------------

# SETUP Temp folder
SETUPDIR=$(pwd)/macos_env_setups
[ ! -d $SETUPDIR/temp ] && mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/temp

cd $SETUPDIR

#   1. initial_setups
./initial_setups.sh

#   2. Terminal setups
./iterm2.sh

#   3. nvm & nodejs
./nvm_nodejs.sh

#   4. neovim
./neovim.sh

#   5. Other files
#     5.1. dotfiles
./dotfiles.sh
#     5.2. fonts
./fonts.sh

#   6. Text Editors
./text_editor.sh

#   7. Web Browser
./web_browser.sh

#   8. Finished and Clean temps
rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo " "
echo "Setups done, happy hacking..."

# -------------------------------------------------------------------------------------
