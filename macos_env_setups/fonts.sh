#!/bin/bash
set -e

# Fonts
# Author: noernova
# Date: Nov 14, 2021
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "################################"
echo "### Fonts copying ... #######"
echo "################################"
echo ""

# fonts
echo "### fonts copying ... ####"
echo ""

# MesloLGS
sudo cp ../fonts/MesloLGS/*.ttf /Library/Fonts

# Cascadia-Code
sudo cp ../fonts/CascadiaCode/*.ttf /Library/Fonts

echo ""
echo "Fonts are copied."
echo ""
# --------------------------------------------------------------------------
