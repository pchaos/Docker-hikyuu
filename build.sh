#!/usr/bin/bash

buildName="hikyuu:hikyuutest"
[ ! -f sh/conda3.sh ] && wget -c -O sh/onda3.sh https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh && chmod a+x conda3.sh
[ ! -f ta-lib-0.4.0-src.tar.gz ] && wget -c -O ta-lib-0.4.0-src.tar.gz http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
[ ! -f boost_1_64_0.tar.gz ] && wget -O boost_1_64_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.64.0/boost_1_64_0.tar.gz/download
[ ! -d hikyuu ] && git clone https://git.oschina.net/fasiondog/hikyuu.git
[ -d archives ] && rm -rf lock partial
[ ! -d archives ] && mkdir archives

set -e
chmod a+x sh/*.sh
chmod a+x *.sh

echo building $buildName
docker build -t=$buildName .

echo build done
echo run in shell:
echo ./start.sh


