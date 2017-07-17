FROM ubuntu:16.04
MAINTAINER chaos "p19992003@gmail.com"

LABEL Description="基于fasiondog的hikyuu搭建hikyuu环境"

#RUN apt-get update --fix-missing

ARG chinaLang=C.UTF-8
ARG fasiondoghome=/home/fasiondog

#设置时区和默认语言
ENV TZ=Asia/Shanghai \
 LANG=$chinaLang \
 LANGUAGE=$chinaLang \
 LC_ALL=$chinaLang \
 tmpdir=/tmp \
 HOME=$fasiondoghome

#安装中文和英文语言支持
COPY sh/10_SetUpBasicEnvironment.sh sh/conda3.sh \
  #sh/15_buildboost.sh \
  $tmpdir/

COPY archives $tmpdir/archives/

RUN $tmpdir/10_SetUpBasicEnvironment.sh

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

COPY sh/30_buildhikyuu.sh $tmpdir/
#COPY sh/30_buildhikyuu.sh hikyuu $tmpdir/

ENV PYTHONPATH=$HOME/hikyuu/tools:/opt/conda/ \
 BOOST_ROOT=$HOME//boost_1_64_0 \
 BOOST_LIB=/usr/local/lib \
 HIKYUU=$HOME/hikyuuexport LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:$HOME/hikyuu/tools/hikyuu/:/usr/local/lib \
 CPLUS_INCLUDE_PATH=/opt/conda/include/python3.6m/:$HOME/hikyuu/extern-libs/sqlite3/:$HOME/hikyuu/extern-libs/mysql/include/:/usr/include/:/usr/include/hdf5/serial/:/usr/local/include/log4cplus/

RUN conda install -y pandas numpy mkl flask beautifulsoup4 requests ipython matplotlib lxml hdf5 jupyter

# Add Tini
ENV TINI_VERSION v0.15.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]

# zh_CN.utf8
#DEBIAN_FRONTEND=noninteractive

