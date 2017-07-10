#!/bin/bash

tar -xzf /tmp/ta-lib-0.4.0-src.tar.gz
cd ta-lib/
./configure --prefix=/usr
make -j4
make install



