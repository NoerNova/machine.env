#!/bin/bash
set -e

# Fonts
# Author: noernova
# Date: April 27, 2022
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "################################"
echo "### Fonts copying ... #######"
echo "################################"
echo ""

# SETUP Temp folder
SETUPDIR=$(pwd)
[ ! -d $SETUPDIR/temp ] && mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/temp

# Fonts directory
FONTSDIR=/usr/share/fonts

# fonts
echo "### fonts copying ... ####"
echo ""
[ ! -d $FONTSDIR/truetype ] && sudo mkdir $FONTSDIR/truetype

FONTSDIR=/usr/share/fonts/truetype

# MesloLGS
[ ! -d $FONTSDIR/MesloLGS ] && sudo mkdir $FONTSDIR/MesloLGS
sudo cp $SETUPDIR/../fonts/MesloLGS/*.ttf /usr/share/fonts/truetype/MesloLGS

# Cascadia-Code
[ ! -d $FONTSDIR/CascadiaCode ] && sudo mkdir $FONTSDIR/CascadiaCode
sudo cp $SETUPDIR/../fonts/CascadiaCode/*.ttf $FONTSDIR/CascadiaCode

echo ""
echo "Fonts are copied."
echo ""
# --------------------------------------------------------------------------
