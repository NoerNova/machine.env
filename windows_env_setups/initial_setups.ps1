# initial Windows setup
# Author: noernova
# Date: Dev 13, 2021 
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

# Skip on error
$ErrorActionPreference = 'Continue'

Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex

scoop install curl sudo jq

# git
winget install -e --id Git.Git