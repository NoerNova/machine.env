# NEOVIM
# Author: noernova
# Date: Jan 27, 2025
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

Write-Output ""
Write-Output "##############"
Write-Output "### NEOVIM ###"
Write-Output "##############"
Write-Output ""

# neovim
scoop install neovim gcc

# vim-plug
Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    New-Item "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# copy nvim setupfile
Copy-Item -R ..\nvim ~\AppData\Local

# prettier and formatter
# npm i -g eslint_d prettier
