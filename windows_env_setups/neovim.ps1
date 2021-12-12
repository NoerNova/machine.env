# NEOVIM
# Author: noernova
# Date: Dec 13, 2021
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "##############"
echo "### NEOVIM ###"
echo "##############"
echo ""

# neovim
scoop install neovim gcc

# vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# copy nvim setupfile
cp -R ..\nvim ~\AppData\Local