#!/bin/bash
# setup_dependencies.sh
# 2018-08-31 david.montaner@gmail.com
# install some python libraries and dependencies required by elpy

# needed in ess
sudo apt-get install texlive

# needed in pdf-tools
sudo apt-get install libpng-dev zlib1g-dev libpoppler-glib-dev libpoppler-private-dev imagemagick

# required python libraries
sudo -H pip3 install --upgrade rope
sudo -H pip3 install --upgrade jedi
sudo -H pip3 install --upgrade flake8   # flake8 for code checks
sudo -H pip3 install --upgrade autopep8 # autopep8 for automatic PEP8 formatting
sudo -H pip3 install --upgrade yapf     # yapf for code formatting

# create flake8 configuration file link
cd
ln -s .emacs.d/flake8.config .flake8

