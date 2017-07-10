#!/bin/bash

# if not exists hikyuu then download
[ ! -d hikyuu ] && git clone https://github.com/fasiondog/hikyuu.git
set -e
cd hikyuu
./configure
make -j4
make install
