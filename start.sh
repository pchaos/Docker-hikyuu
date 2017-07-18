#!/bin/bash
docker images |grep hikyuu
echo --------------------------------------------------
echo run jupyter
echo jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root
echo --------------------------------------------------

set -e
#vpara=" -v $(pwd)/hikyuu:/home/fasiondog/hikyuu -v $(pwd)/archives:/tmp/archives"
vpara=" -v $(pwd)/archives:/tmp/archives"
docker run \
       -p 8888:8888 \
       -i $vpara \
       -t hikyuu:hikyuutest \
       /bin/bash

echo .............................. Bye
