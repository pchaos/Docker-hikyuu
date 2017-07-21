#!/bin/bash
docker images |grep hikyuu
# port num
pt=8888
echo --------------------------------------------------
echo run jupyter
echo "jupyter notebook --port=$pt --no-browser --ip=0.0.0.0 --allow-root"
echo "from hikyuu.interactive.interactive import * "
echo --------------------------------------------------

buildName="hikyuu:lastest"
set -e
#vpara=" -v $(pwd)/hikyuu:/home/fasiondog/hikyuu -v $(pwd)/archives:/tmp/archives"
vpara=" -v $(pwd)/archives:/tmp/archives"
docker run \
       -p $pt:$pt \
       -i $vpara \
       -t $buildName \
       /bin/bash

echo .............................. Bye
