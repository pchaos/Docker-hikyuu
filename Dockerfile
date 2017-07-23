FROM ubuntu:16.04
MAINTAINER chaos "p19992003@gmail.com"

LABEL Description="ubuntu 16.04 系统下基于fasiondog的hikyuu搭建hikyuu环境"

ARG chinaLang=C.UTF-8
ARG fasiondoghome=/home/fasiondog

#设置时区和默认语言
ENV LANG=$chinaLang \
 LANGUAGE=$chinaLang \
 LC_ALL=$chinaLang \
 tmpdir=/tmp \
 HOME=$fasiondoghome \
 # TZ=Asia/Shanghai \
 DEBIAN_FRONTEND=noninteractive

#安装中文和英文语言支持
COPY sh/10_SetUpBasicEnvironment.sh sh/10_ubuntusource.list \
     sh/conda3.sh \
  $tmpdir/

COPY archives $tmpdir/archives/

RUN cp -f $tmpdir/10_ubuntusource.list /etc/apt/source.list &&  $tmpdir/10_SetUpBasicEnvironment.sh

# install Anaconda3
RUN  bash $tmpdir/conda3.sh -b -p /opt/conda  && rm $tmpdir/conda3.sh

ENV PATH=/opt/conda/bin:/usr/local/bin:$PATH  \
 LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

#RUN conda config --add channels conda-forge
RUN conda update -y conda \
  &&  conda install -y libgcc

#RUN  echo 'export PATH=/opt/conda/bin:$PATH'  > /etc/profile.d/conda.sh && mkdir $fasiondoghome
WORKDIR $fasiondoghome

#talib
COPY  sh/20_build_talib.sh \
 ta-lib-0.4.0-src.tar.gz  $tmpdir/
RUN  $tmpdir/20_build_talib.sh

#boost
COPY sh/15_buildboost.sh boost_1_64_0.tar.gz $tmpdir/


# install boost
RUN $tmpdir/15_buildboost.sh

COPY /sh/25_buildlog4plus.sh log4cplus-1.2.1-rc2.tar.gz $tmpdir/
RUN $tmpdir/25_buildlog4plus.sh

COPY sh/30_buildhikyuu.sh sh/30_patchfile.hikyuu $tmpdir/
#COPY sh/30_buildhikyuu.sh hikyuu $tmpdir/

ENV PYTHONPATH=$HOME/hikyuu/tools:/opt/conda/ \
 BOOST_ROOT=$HOME//boost_1_64_0 \
 BOOST_LIB=/usr/local/lib \
 HIKYUU=$HOME/hikyuuexport LD_LIBRARY_PATH=./:/usr/local/lib:/usr/lib:$HOME/hikyuu/tools/hikyuu/:/usr/local/lib \
 CPLUS_INCLUDE_PATH=/opt/conda/include/python3.6m/:$HOME/hikyuu/extern-libs/sqlite3/:/usr/include/:/usr/include/hdf5/serial/:/usr/local/include/log4cplus/

COPY  hikyuu $HOME/hikyuu/
RUN $tmpdir/30_buildhikyuu.sh

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI=/usr/local/bin
COPY tini sh/40_buildclean.sh $tmpdir/
#ENTRYPOINT ["$tmpdir/tini", "--"]

EXPOSE 8888
#CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]

#
