#!/bin/bash
echo start ................................. $0
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
#apt-get update --fix-missing
apt-get install -y apt-utils

RUNLEVEL=1
debdir="/tmp/archives"

if [ -d $debdir ]; then
    cd $debdir
    dpkg -i *.deb
fi

# install development environment
# apt-get install -y build-essential git wget sudo vim git

mkdir /home/fashingdog

#RUN conda install -y pandas numpy mkl flask beautifulsoup4 requests ipython matplotlib lxml hdf5

#RUN conda install -y jupyter tushare

echo done ................................. $0
