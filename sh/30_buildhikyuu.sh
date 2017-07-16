#!/bin/bash

export PYTHONPATH=$HOME/hikyuu/tools:/opt/conda/
export BOOST_ROOT=$HOME//boost_1_64_0
export BOOST_LIB=/usr/local/lib
export HIKYUU=$HOME/hikyuu
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:$HOME/hikyuu/tools/hikyuu/:/usr/local/lib
export CPLUS_INCLUDE_PATH=/opt/conda/include/python3.6m/:$HOME/hikyuu/extern-libs/sqlite3/:$HOME/hikyuu/extern-libs/mysql/include/:/usr/include/:/usr/include/hdf5/serial/:/usr/include/log4cplus/
ln -s /usr/lib/x86_64-linux-gnu/libsqlite3.so.0.8.6  /usr/lib/x86_64-linux-gnu/libsqlite3.so



# if not exists hikyuu then download
[ ! -d hikyuu ] && git clone https://github.com/fasiondog/hikyuu.git
set -e
cd hikyuu
./configure
make -j4
make install

#apt-get install liblog4cpp5-dev -d -o dir::cache=./
#apt-get install liblog4cxx10-dev -d -o dir::cache=./
apt-get install -y libmysqlclient-dev libmysqlclient20 -d -o dir::cache=./
dpkg -i archives/*.deb

apt-get install mysql-source-5.7 -d -o dir::cache=./
dpkg -i archives/*.deb



./configure --prefix=/usr
make -j 4
make install
