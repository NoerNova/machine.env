# PowerShell oh-my-posh
# Author: noernova
# Date: Jan 27, 2025
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

Write-Output ""
Write-Output "#######################"
Write-Output "###### PowerShell #####"
Write-Output "#######################"
Write-Output ""

# copy setup files
$CONFIG_DIR = '~\.config\powershell'
if ((Test-Path -Path $CONFIG_DIR) -eq $false) {
	mkdir ~\.config\powershell
}
Copy-Item config_files\config.omp.json $CONFIG_DIR
Copy-Item config_files\user_profile.ps1 $CONFIG_DIR

# Powershell config file
$PFOLDER = '~\Documents\PowerShell'
if ((Test-Path -Path $PFOLDER) -eq $false) {
	mkdir ~\Documents\PowerShell
}

# Load the config file
Write-Output '. $env:USERPROFILE\.config\powershell\user_profile.ps1' >> $PROFILE.CurrentUserCurrentHost

# Oh-My-Posh
Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force

oh-my-posh --init --shell pwsh --config $CONFIG_DIR\config.omp.json | Invoke-Expression

# Terminal Icon
Install-Module -Name Terminal-Icons -Repository PSGallery -Force

# Directory Jumber
Install-Module -Name z -Force

# Auto Completion
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

# Fuzzy finder
scoop install fzf
Install-Module -Name PSFzf -Scope CurrentUser -Force
