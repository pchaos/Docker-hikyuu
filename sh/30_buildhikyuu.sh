#!/bin/bash
echo  .............................. $0

export PYTHONPATH=$HOME/hikyuu/tools:/opt/conda/
export BOOST_ROOT=$HOME//boost_1_64_0
export BOOST_LIB=/usr/local/lib
export HIKYUU=$HOME/hikyuu
export LD_LIBRARY_PATH=./:/usr/local/lib:/usr/lib:$HOME/hikyuu/tools/hikyuu/
export CPLUS_INCLUDE_PATH=/opt/conda/include/python3.6m/:$HOME/hikyuu/extern-libs/sqlite3/:/usr/include/:/usr/include/hdf5/serial/:/usr/local/include/log4cplus/
ln -s /usr/lib/x86_64-linux-gnu/libsqlite3.so.0.8.6  /usr/lib/x86_64-linux-gnu/libsqlite3.so
[ ! -f /usr/lib/x86_64-linux-gnu/libhdf5_serial.so ] && \
  ln -s /usr/lib/x86_64-linux-gnu/libhdf5.so /usr/lib/x86_64-linux-gnu/libhdf5_serial.so && \
  ln -s /usr/lib/x86_64-linux-gnu/libhdf5_hl.so /usr/lib/x86_64-linux-gnu/libhdf5_serial_hl.so

git clone https://git.oschina.net/fasiondog/hikyuu_examples.git

# solve: ImportError: libGL.so.1: cannot open shared object file: No such file or directory
#apt install -y libgl1-mesa-glx
#apt install -y qt5-image-formats-plugins

# if not exists hikyuu then download
[ ! -d hikyuu ] && git clone https://github.com/fasiondog/hikyuu.git
cd hikyuu
# hikyuu编译打补丁
echo .............................. patch Jamroot
cp Jamroot.linux Jamroot.linux.orig
patch -p0 < $tmpdir/30_patchfile.hikyuu

./build.sh

cp Jamroot.linux.orig Jamroot.linux
rm Jamroot.linux.orig

echo .............................. $0 Done
