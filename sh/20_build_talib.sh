#!/bin/bash
echo start ................................. $0

#set -e
tocheckfile=$tmpdir/ta-lib-0.4.0-src.tar.gz
if [ -f $tocheckfile ]; then
  tar -xzf $tocheckfile
  cd ta-lib/
  ./configure --prefix=/usr LDFLAGS="-lm"
  # 加上 make -j4 会报错 Makefile:254: recipe for target 'gen_code-gen_code.o' failed
  make
  make install
fi

echo pip install -y ta-lib

pip install ta-lib

echo done ................................. $0
