#!/bin/bash
set -e

# SUBLIME TEXT
# Version: 4
# Author: noernova
# Date: Jul 25, 2021
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "####################"
echo "### SUBLIME TEXT ###"
echo "####################"
echo ""

# SETUP Temp folder
SETUPDIR=$(pwd)
[ ! -d $SETUPDIR/temp ] && mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/temp

cd $SETUPTEMP
curl -LO https://download.sublimetext.com/sublime_text_build_4126_x64.tar.xz

sudo tar -xvf sublime_text_build_4126_x64.tar.xz -C /opt

sudo ln -s /opt/sublime_text/sublime_text /bin/subl

cd $SETUPDIR

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo ""
echo "Sublime text, installation completed."
# ----------------------------------------------------------------------------
