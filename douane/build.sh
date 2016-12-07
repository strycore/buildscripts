#!/bin/bash

set -e

sudo apt install liblog4cxx-dev libdbus-c++-dev libgtkmm-3.0-dev

cd
mkdir Douane
cd Douane/
git clone https://github.com/Douane/douane-dkms
cd douane-dkms
sudo make dkms

cd ~/Douane
git clone --recursive https://github.com/Douane/douane-daemon
cd douane-daemon
make
sudo make install

cd ~/Douane
git clone --recursive https://github.com/Douane/douane-dialog
cd douane-dialog
make
sudo make install


cd ~/Douane
git clone https://github.com/Douane/douane-configurator
cd douane-configurator
sudo python3 setup.py install


systemctl daemon-reload
sudo service douane start

