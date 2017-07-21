#!/usr/bin/bash

buildName="hikyuu:lastest"

#下载相关资源
log4c="log4cplus-1.2.1-rc2.tar.gz"
[ ! -f $log4c ] && wget -c -O $log4c https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/1.2.1/log4cplus-1.2.1-rc2.tar.gz/download  &
#[ ! -f hdf5-1.8.19.tar.gz ] && wget -c -O hdf5-1.8.19.tar.gz https://support.hdfgroup.org/ftp/HDF5/current18/src/hdf5-1.8.19.tar.gz &
[ ! -f ta-lib-0.4.0-src.tar.gz ] && wget -c -O ta-lib-0.4.0-src.tar.gz http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz &
[ ! -f boost_1_64_0.tar.gz ] && wget -c -O boost_1_64_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.64.0/boost_1_64_0.tar.gz/download &
[ ! -d hikyuu ] && git clone https://git.oschina.net/fasiondog/hikyuu.git &
[ -d hikyuu ] && echo "git pull hikyuu .........." && cd hikyuu && git pull && cd ..
[ ! -f sh/conda3.sh ] && wget -c -O sh/conda3.sh https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh && chmod a+x conda3.sh

[ -d archives ] && rm -rf lock partial
[ ! -d archives ] && mkdir archives
TINI_VERSION=v0.15.0
[ ! -f tini ] &&  wget -O tini https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini && chmod a+x tini

set -e
chmod a+x sh/*.sh
chmod a+x *.sh

echo "building .............................. $buildName"
docker build -t=$buildName .

echo "build .............................. done"
echo --------------------------------------------------
echo run in shell:
echo ./start.sh
echo --------------------------------------------------

