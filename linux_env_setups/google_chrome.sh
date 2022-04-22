#!/bin/bash
set -e

# Google Chrome
# Author: noernova
# Date: Jul 27, 2021
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "#####################"
echo "### GOOGLE CHROME ###"
echo "#####################"
echo ""

# SETUP Temp folder
SETUPDIR=$(pwd)
[ ! -d $SETUPDIR/temp ] && mkdir $SETUPDIR/temp
SETUPTEMP=$SETUPDIR/temp

# Update
echo ""
echo "### Updating ... ####"
echo ""

sudo apt update

# Install require modules and packages
sudo apt install curl apt-transport-https --yes


# ----------------------------------------------------------------------------

cd $SETUPTEMP
curl -o google-chrome-stable.deb -L "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

sudo dpkg -i google-chrome-stable.deb

# Clean temps
sudo rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "Google Chrome, installation completed."

# -----------------------------------------------------------------------------------------
