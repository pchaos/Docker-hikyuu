#!/bin/bash
echo start ................................. $0
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
apt-get update --fix-missing
apt-get install -y apt-utils

RUNLEVEL=1

debdir="/tmp/archives"
mkdir $HOME
cd $HOME
if [ ! -f $debdir/git*.deb ]; then
    apt-get install -y language-pack-zh-hant language-pack-zh-hans language-pack-en build-essential git wget sudo vim git -d  git -o dir::cache=./
    cp archives/ $debdir/
    rm -rf archives/
fi

if [ -d $debdir ]; then
    cd $debdir
    dpkg -i *.deb
    [ ! -d mysql ] && apt-get install -y libmysqlclient-dev libmysqlclient20
    [ -d mysql ] && dpkg -i mysql/*.deb
    [ ! -d hdf5 ] && apt-get install -y lihdf5-dev lihdf5-serial-dev
    [ -d hdf5 ] && dpkg -i hdf5/*.deb
fi

# install development environment
#

/opt/conda/bin/conda install -y pandas numpy mkl flask beautifulsoup4 requests ipython
/opt/conda/bin/conda install -y matplotlib lxml hdf5 jupyter
#RUN conda install -y pandas numpy mkl flask beautifulsoup4 requests ipython matplotlib lxml hdf5

echo done ................................. $0
