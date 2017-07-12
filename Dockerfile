FROM ubuntu:16.04
MAINTAINER chaos "p19992003@gmail.com"

LABEL Description="基于fashingdog的hikyuu搭建hikyuu环境"

RUN apt-get update --fix-missing

#RUN apt-get update --fix-missing && apt-get install -y language-pack-zh-hant language-pack-zh-hans language-pack-en  -d  git -o dir::cache=/tmp
RUN echo $(cat /etc/os-release)

ENV chinaLang=C.UTF-8 \
  tmpdir=/tmp

#设置时区和默认语言
ENV TZ=Asia/Shanghai \
 LANG=$chinaLang \
 LANGUAGE=$chinaLang \
 LC_ALL=$chinaLang

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
RUN conda update -y conda


#RUN  echo 'export PATH=/opt/conda/bin:$PATH'  > /etc/profile.d/conda.sh && mkdir /home/fashingdog
WORKDIR /home/fashingdog

COPY sh/15_buildboost.sh boost_1_64_0.tar.gz $tmpdir/
# install boost
RUN $tmpdir/15_buildboost.sh

#talib
COPY  sh/20_build_talib.sh \
 ta-lib-0.4.0-src.tar.gz  $tmpdir/
RUN  $tmpdir/20_build_talib.sh

COPY sh/30_buildhikyuu.sh $tmpdir/
#USER fashingdog

# zh_CN.utf8
#DEBIAN_FRONTEND=noninteractive

#ENTRYPOINT "echo 开始hikyuu "
