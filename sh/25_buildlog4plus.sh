#!/bin/bash
echo start ................................. $0
set -e

log4c="log4cplus-1.2.1-rc2"
log4cfile=$tmpdir/$log4c.tar.gz
#[ ! -f $log4cfile ] && wget -c -O $log4cfile https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/1.2.1/log4cplus-1.2.1-rc2.tar.gz/download
tar -xzf $log4cfile
cd $log4c
#./configure --prefix=/usr CXXFLAGS="std=-c++11"
./configure --prefix=/usr CXXFLAGS=-std=c++0x
make -j 4
make install

echo done ................................. $0
