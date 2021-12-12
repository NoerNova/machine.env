# Windows Setups
# Author noernova
# Date: Dec 13, 2021
# Contact noernova.com
# Github https://github.com/noernova
# ===================================================================================

# List of Content
# 	1. Initial setups
#   2. Windows Terminal
#    2.1. PowerShell
#   3. Scoop
#   4. Git
#	5. NeoVim
#	  5.1. vimplug
#  	6. Oh My Posh
# 	7. nvm
# 	8. Terminal Icons
# 	9. Directory Jumber
# 	10. PSReadLine Auto Completion
# 	11. Fuzzy finder

# ====================================================================================

Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex

scoop install curl sudo jq

# git
winget install -e --id Git.Git

# neovim
scoop install neovim gcc

# vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# copy nvim setupfile
cp -R nvim ~\AppData\Local

# copy setup files
$CONFIG_DIR = '~\.config\powershell'
if ((Test-Path -Path $CONFIG_DIR) -eq $false) {
	mkdir ~\.config\powershell
}
cp config_files\config.omp.json $CONFIG_DIR
cp config_files\user_profile.ps1 $CONFIG_DIR

# Powershell config file
$PFOLDER = '~\Documents\PowerShell'
if ((Test-Path -Path $PFOLDER) -eq $false) {
	mkdir ~\Documents\PowerShell
}

echo '. $env:USERPROFILE\.config\powershell\user_profile.ps1' >> $PROFILE.CurrentUserCurrentHost

# Oh-My-Posh
Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force

# load oh-my-posh config
oh-my-posh --init --shell pwsh --config $CONFIG_DIR\config.omp.json | Invoke-Expression

# nvm
scoop install nvm

# Terminal Icon
Install-Module -Name Terminal-Icons -Repository PSGallery -Force

# Directory Jumber
Install-Module -Name z -Force

# Auto Completion
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

# Fuzzy finder
scoop install fzf
Install-Module -Name PSFzf -Scope CurrentUser -Force

# echo finished
echo "Finished > checkout omp cool themes https://ohmyposh.dev/docs/themes"
echo "Perform nvm install lastest after restart powershell with admin privileges"
