# initial Windows setup
# Author: noernova
# Date: Jan 27, 2025 
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

# Skip on error
$ErrorActionPreference = 'Continue'

Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression

scoop install curl sudo jq

# git
winget install -e --id Git.Git
