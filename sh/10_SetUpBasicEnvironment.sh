#!/bin/bash
echo start ................................. $0

# 修复交互报错
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# instal update
echo .............................. apt-get update --fix-missing
apt-get update --fix-missing
apt-get install -y apt-utils

RUNLEVEL=1

debdir="/tmp/archives"
mkdir $HOME
cd $HOME
if [ ! -f $debdir/git_1%3a2.7.4-0ubuntu1.1_amd64.deb ]; then
    echo .............................. apt-get install language-pack-zh-hant language-pack-zh-hans language-pack-en
    #apt-get install -y language-pack-zh-hant language-pack-zh-hans language-pack-en build-essential git wget sudo vim git bzip2 -d -o dir::cache=./
    apt-get install -y language-pack-zh-hant language-pack-zh-hans language-pack-en
    apt-get install -y build-essential git wget sudo vim git bzip2
    #cp archives/ $debdir/
    #rm -rf archives/
fi

if [ -d $debdir ]; then
    cd $debdir
    [ -f $debdir/git_1%3a2.7.4-0ubuntu1.1_amd64.deb ] && dpkg -i *.deb
    [ ! -d mysql ] && apt-get install -y libmysqlclient-dev libmysqlclient20
    [ -d mysql ] && dpkg -i mysql/*.deb
    [ ! -d hdf5 ] && apt-get install -y libhdf5-dev libhdf5-serial-dev
    [ -d hdf5 ] && dpkg -i hdf5/*.deb
fi

# install development environment
#

echo .............................. conda update
/opt/conda/bin/conda install -y pandas numpy mkl flask beautifulsoup4 requests ipython
/opt/conda/bin/conda install -y matplotlib lxml hdf5 jupyter
#RUN conda install -y pandas numpy mkl flask beautifulsoup4 requests ipython matplotlib lxml hdf5
echo .............................. conda update Done

echo done ................................. $0
