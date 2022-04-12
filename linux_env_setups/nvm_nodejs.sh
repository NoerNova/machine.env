#!/bin/bash
set -e

# NVM and NODEJS
# Author: noernova
# Date: Jul 25, 2021
# Contact: noernova.com
# Github: https://github.com/noernova
# ===========================================================================

echo ""
echo ""
echo "######################"
echo "### NVM && NODEJS ####"
echo "######################"
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
sudo apt install curl --yes


# ----------------------------------------------------------------------------

# Install nvm
echo ""
echo "### NVM installing ... ####"
echo ""

cd $SETUPDIR/temp
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Install lastest nodejs
echo ""
echo ""
echo "### NODEJS installing ... ####"
echo ""

nvm install node

# Reload setting
source ~/.zshrc

cd $SETUPDIR

# Clean temps
rm -rf $SETUPTEMP
SETUPTEMP=
SETUPDIR=

echo "NVM and NodeJS, setup finished."

# -----------------------------------------------------------------------------------------
