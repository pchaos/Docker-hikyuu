#!/bin/bash
docker images |grep hikyuu
# port num
pt=8888
echo --------------------------------------------------
echo run jupyter
echo jupyter notebook --port=$pt --no-browser --ip=0.0.0.0 --allow-root
echo --------------------------------------------------

set -e
#vpara=" -v $(pwd)/hikyuu:/home/fasiondog/hikyuu -v $(pwd)/archives:/tmp/archives"
vpara=" -v $(pwd)/archives:/tmp/archives"
docker run \
       -p $pt:8888 \
       -i $vpara \
       -t hikyuu:hikyuutest \
       /bin/bash

echo .............................. Bye
