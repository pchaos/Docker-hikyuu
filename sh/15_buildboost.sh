#!/bin/bash
echo start ................................. $0
export CPLUS_INCLUDE_PATH=/opt/conda/include/python3.6m/
export PYTHONPATH=/opt/conda/

set -e
boostsource=$tmpdir/"boost_1_64_0.tar.gz"

 [ -f $boostsource ] && \
 tar xzvf $boostsource && \
 cd boost_1_64_0 && \
 ./bootstrap.sh --exec-prefix=/usr/local --with-python=python3 && \
 ./b2 -q -j 4 threading=multi && \
 ./b2 install threading=multi && \
 cp b2 bjam /usr/local/bin/ && \
 cd .. && \
 rm $boostsource  && \
 #rm -rf boost_1_64_0 && \
 ln -s /usr/lib/x86_64-linux-gnu/libboost_python-py34.so /usr/lib/x86_64-linux-gnu/libboost_python3.so

echo done ................................. $0
