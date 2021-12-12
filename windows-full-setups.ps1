# Skip on error
$ErrorActionPreference = 'Continue'

# Windows Setups
# Author noernova
# Date: Dec 13, 2021
# Contact noernova.com
# Github https://github.com/noernova
# ===================================================================================

# List of Content
# 	1. Initial setups
#   2. Scoop
#   3. Git
#   4. Windows Terminal
#    4.1. PowerShell
#  	 4.2. Oh My Posh
# 	 4.3. Terminal Icons
# 	 4.4. Directory Jumber
# 	 4.5. PSReadLine Auto Completion
# 	 4.6. Fuzzy finder
#	5. NeoVim
#	  5.1. vimplug
# 	7. nvm


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

# SETUP Folder
cd windows_env_setups

# 	1. Initial setups, Scoop, Git
./initial_setups.ps1

#   4. Windows Terminal
./powershell.ps1

#	5. NeoVim
./neovim.ps1

# 	7. nvm
./nvm_nodejs.ps1

echo " "
echo "Setups done, happy hacking..."

# -------------------------------------------------------------------------------------