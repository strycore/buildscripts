#!/bin/bash

set -e

PREFIX=/opt/gimp
CPU_CORES=$(grep -c processor /proc/cpuinfo)

export PATH="$PREFIX/bin:$PATH"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export LD_LIBRARY_PATH="$PREFIX/lib"

sudo apt-get build-dep gimp
sudo apt-get install libjpeg8-dev libopenexr-dev librsvg2-dev libtiff5-dev libavcodec-ffmpeg-dev libavcodec-dev

build_babl () {
    git clone git://git.gnome.org/babl
    cd babl
    ./autogen.sh --prefix=$PREFIX
    make -j${CPU_CORES}
    sudo make install
    cd ..
}

build_gegl () {
    #git clone git://git.gnome.org/gegl
    cd gegl
    ./autogen.sh --prefix=$PREFIX
    #./configure  --prefix=$PREFIX
    make -j${CPU_CORES}
    sudo make install
    cd ..
}

build_gimp () {
    #git clone git://git.gnome.org/gimp gimp-src
    cd gimp-src
    ./autogen.sh --prefix=$PREFIX
    make -j$CPU_CORES
    sudo make install
}

build_gegl
build_gimp
