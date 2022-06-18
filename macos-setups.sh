#!/bin/sh
set -e

# MacOS Setups
# Author noernova
# Date: Nov 14, 2021
# Contact noernova.com
# Github https://github.com/noernova
# ===================================================================================

# List of Content
#   1. Initial setups
#   2. Terminal setups
#     iTerm
#    2.1. Zsh
#    2.2. Prezto (https://github.com/sorin-ionescu/prezto)
#    2.3. Colorls (https://github.com/athityakumar/colorls)
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
#     7.3. Firefox
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

#   9. Others
#     9.1. batscat
brew install bats


echo " "
echo "Setups done, happy hacking..."
echo "to install eslint and prettier: npm i -g eslint_d prettier"


# -------------------------------------------------------------------------------------
