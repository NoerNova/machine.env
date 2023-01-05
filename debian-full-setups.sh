#!/bin/sh
set -e

# Debian Setups
# Author noernova
# Date: Jan 5, 2023
# Contact noernova.com
# Github https://github.com/noernova
# ===================================================================================

# List of Content
#   1. Wireless Driver
###   2. Terminal setups
###     2.1. Zsh
###     2.2. Prezto (https://github.com/sorin-ionescu/prezto)
###     2.3. Colorls (https://github.com/athityakumar/colorls)
#   2. Terminal setups
#       2.1. fish
#       2.2. fisher
#       2.3. tide
#       2.4. z
#       2.5. exa
#   3. nvm & nodejs
#     3.1. nvm
#     3.2. nodejs
#   4. nvim
#     4.1. tree-sitter
#     4.2. luajit
#     4.3. neovim
#     4.4. vimplug
#   5. Other files
#     5.1. dotfiles
#     5.2. fonts
#        5.2.1. MesloLGS
#        5.2.2. Cascadia-Code
#   6. Text Editor
#     6.1. VSCode
#     6.2. Sublime-Text
#   7. Web Browser
#     7.1. Google-Chrome
#     7.2. Brave
#   8. Finished
#   9. Others

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
SETUPDIR=$(pwd)/debian_env_setups
[ ! -d $SETUPDIR/temp ] && mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/temp

cd $SETUPDIR

#   1. Wireless Driver
./rtl88x2bu_driver.sh

#   2. Terminal setups
# ./zsh_setups.sh

#   2. Terminal setups
./fish_setups.sh

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
#     6.1. VSCode
./vscode.sh
#     6.2. Sublime-Text
./sublime_text.sh

#   7. Web Browser
#     7.1. Google-Chrome
./google_chrome.sh
#     7.2. Brave
./brave.sh

#   8. Finished and Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

#   9. Others
#     9.1. batcat
sudo apt install bat

echo ""
echo "Finish setups, happy hacking..."
echo "to install eslint and prettier: npm i -g eslint_d prettier"

# -------------------------------------------------------------------------------------

# // thai fonts for kali, (Require)
## sudo apt install fonts-thai-tlwg

# // drop down terminal
## sudo apt install guake

# // command correction
## sudo apt install thefuck

# // howdoi
# sudo apt install howdoi
# pip install howdoi
