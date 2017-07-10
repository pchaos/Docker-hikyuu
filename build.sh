#!/usr/bin/bash

buildName="hikyuu:hikyuutest"
[ ! -f conda3.sh ] && wget -c -O conda3.sh https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh && chmod a+x conda3.sh
[ ! -f ta-lib-0.4.0-src.tar.gz ] && wget -c -O ta-lib-0.4.0-src.tar.gz http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
[ ! -d hikyuu ] && git clone https://git.oschina.net/fasiondog/hikyuu.git

set -e
chmod a+x build_ta-lib.sh build_hikyuu.sh

echo building $buildName
docker build -t=$buildName .

echo run in shell:
echo docker run -i -t $buildName /bin/bash

