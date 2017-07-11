#!/bin/bash
echo start ... $0

set -e
boostsource="boost_1_64_0.tar.gz"
 [ -f $tmpdir/$boostsource ] && \
 tar xzvf $tmpdir/$boostsource && \
 cd boost_1_64_0 && \
 ./bootstrap.sh --exec-prefix=/usr/local --with-python=python3 && \
 ./b2 threading=multi && \
 ./b2 install threading=multi && \
 cd .. && \
 rm $boostsource  && \
 rm -r boost_1_64_0 && \
 ln -s /usr/lib/x86_64-linux-gnu/libboost_python-py34.so /usr/lib/x86_64-linux-gnu/libboost_python3.so

echo done ... $0
