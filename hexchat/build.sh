#!/bin/bash

set -e

root_dir="$(pwd)"
package_name="hexchat"
source_dir="${root_dir}/${package_name}"
git clone https://github.com/hexchat/hexchat.git $source_dir

sudo apt-get install libnotify-dev

cd $source_dir
./autogen.sh

./configure
make
