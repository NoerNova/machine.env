$ErrorActionPreference = 'Continue'

Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex

scoop install curl sudo jq

# git
winget install -e --id Git.Git

# neovim
scoop install neovim gcc

# copy setup files
$CFOLDER = '~\.config\powershell'
if ((Test-Path -Path $CFOLDER) -eq $false) {
	mkdir ~\.config\powershell
}
cp windows_env_setups\config.omp.json $CFOLDER
cp windows_env_setups\user_profile.ps1 $CFOLDER

# Powershell config file
$PFOLDER = '~\Documents\PowerShell'
if ((Test-Path -Path $PFOLDER) -eq $false) {
	mkdir ~\Documents\PowerShell
}

echo '$env:USERPROFILE\.config\powershell\user_profile.ps1' >> $PROFILE.CurrentUserCurrentHost

# Oh-My-Posh
Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force

oh-my-posh --init --shell pwsh --config $CFOLDER\config.omp.json | Invoke-Expression

# nvm
scoop install nvm
nvm install node

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