#!/bin/bash
set -e

# Fonts
# Author: noernova
# Date: Jul 25, 2021
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
FONTSDIR=/usr/share/fonts/truetype

# fonts
echo "### fonts copying ... ####"
echo ""

# MesloLGS
[ ! -d $FONTSDIR/MesloLGS ] && sudo mkdir $FONTSDIR/MesloLGS
sudo cp $SETUPDIR/../fonts/MesloLGS/*.ttf /usr/share/fonts/truetype/MesloLGS

# Cascadia-Code
[ ! -d $FONTSDIR/CascadiaCode ] && sudo mkdir $FONTSDIR/CascadiaCode
sudo cp $SETUPDIR/../fonts/CascadiaCode/*.ttf $FONTSDIR/CascadiaCode

FONTSDIR=/usr/share/fonts/opentype
# Fantasque Sans Mono
[ ! -d $FONTSDIR/FantasqueSansMono ] && sudo mkdir $FONTSDIR/FantasqueSansMono
sudo cp $SETUPDIR/../fonts/FantasqueSansMono/*.otf $FONTSDIR/FantasqueSansMono

echo ""
echo "Fonts are copied."
echo ""
# --------------------------------------------------------------------------
