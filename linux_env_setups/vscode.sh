#!/bin/bash
set -e

# VSCode
# Author: noernova
# Date: Jul 27, 2021
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo "##############"
echo "### VSCode ###"
echo "##############"
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
curl -o vscode.deb -L 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'

sudo apt install ./vscode.deb

cd $SETUPDIR

# Clean temps
rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "VSCode, installation completed."

# -----------------------------------------------------------------------------------------
